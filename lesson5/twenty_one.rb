module Hand
  def busted?
    total > Participant::BUSTED_LIMIT
  end

  def total
    total = 0

    cards.each do |card|
      total += if card.ace?
                 11
               elsif card.jack? || card.queen? || card.king?
                 10
               else
                 card.rank.to_i
               end
    end

    ace_count = cards.select(&:ace?).count
    ace_count.times { total -= 10 if total > Participant::BUSTED_LIMIT }

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def display_cards
    puts ""
    puts "---- #{name}'s hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ""
  end
end

class Participant
  include Hand

  BUSTED_LIMIT = 21

  attr_accessor :cards, :name

  def initialize(name='Player')
    @cards = []
    @name = name
  end

  def show_initial_cards
    display_cards
  end
end

class Dealer < Participant
  include Hand

  HIT_LIMIT = 17

  def initialize
    super('Dealer')
  end

  def show_initial_cards
    puts ""
    puts "---- #{name}'s hand: ----"
    puts "=> #{cards.first}"
    puts "=> [?]"
    puts ""
  end

  def has_to_hit?
    total < HIT_LIMIT
  end
end

class Deck
  attr_reader :cards

  def initialize
    reset
  end

  def shuffle!
    cards.shuffle!
  end

  def reset
    @cards = Card::SUITS.product(Card::RANKS).map { |combo| Card.new(*combo) }

    shuffle!
  end

  def deal_card
    reset if cards.empty?
    cards.pop
  end
end

class Card
  SUITS = %w(Spade Diamond Club Heart).freeze
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze

  attr_reader :rank, :suit

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def ace?
    rank == 'Ace'
  end

  def jack?
    rank == 'Jack'
  end

  def queen?
    rank == 'Queen'
  end

  def king?
    rank == 'King'
  end

  def to_s
    "[#{rank} of #{suit}s]"
  end
end

class Game
  RESULT_MESSAGES = { player_busted: "Player busted.. Dealer won!",
                      dealer_busted: "Dealer busted.. Player won!",
                      player_win:    "Player won!",
                      dealer_win:    "Dealer won!",
                      tie:           "It's a tie!" }.freeze

  attr_accessor :dealer, :player, :deck, :result

  def initialize
    @dealer = Dealer.new
    @player = Participant.new
    @deck = Deck.new
    @result = nil
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_card)
      dealer.add_card(deck.deal_card)
    end
  end

  def show_initial_cards
    player.show_initial_cards
    dealer.show_initial_cards
  end

  def get_answer(valid_answers)
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if valid_answers.include?(answer)
      puts "Invalid input.  Please enter h or s."
    end
    answer
  end

  def player_turn
    loop do
      puts "Would you like to (h)it or (s)tay?"
      break if get_answer(%w(h s)) == 's'

      puts "You hit"
      player.add_card(deck.deal_card)

      player.display_cards
      break if player.busted?
    end
  end

  def display_dealer_turn_message
    puts "You stayed."
    puts "Dealer turn..."
    puts ""
  end

  def dealer_turn
    while dealer.has_to_hit?
      puts "Dealer hit!"
      dealer.add_card(deck.deal_card)
    end
  end

  def display_dealer_stay_message
    puts "Dealer stayed..."
  end

  def show_final_cards
    player.display_cards
    dealer.display_cards
  end

  def set_result
    self.result = :player_win    if player.total > dealer.total
    self.result = :dealer_win    if player.total < dealer.total
    self.result = :tie           if player.total == dealer.total
  end

  def show_final_result
    set_result unless result
    message = RESULT_MESSAGES[result]
    puts message
  end

  def show_final_result_and_cards
    show_final_result
    puts ""
    puts "FINAL CARDS:"
    show_final_cards
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    get_answer(%w(y n)) == 'y'
  end

  def reset
    player.cards = []
    dealer.cards = []
    self.deck = Deck.new
    self.result = nil
  end

  def clear
    system 'clear'
  end

  def start
    loop do
      clear
      deal_cards
      show_initial_cards

      player_turn
      if player.busted?
        self.result = :player_busted
        show_final_result_and_cards
        break unless play_again?
        reset
        next
      end

      display_dealer_turn_message

      dealer_turn
      if dealer.busted?
        self.result = :dealer_busted
        show_final_result_and_cards
        break unless play_again?
        reset
        next
      end

      display_dealer_stay_message

      show_final_result_and_cards
      play_again? ? reset : break
    end

    puts "Thank you for playing Twenty-One.  Goodbye!"
  end
end

Game.new.start
