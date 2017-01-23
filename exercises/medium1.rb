require 'pry'

# 1.

# class Machine
#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   private

#   attr_writer :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# machine = Machine.new
# machine.start

# 2.

# class FixedArray
#   attr_reader :array

#   def initialize(length)
#     @array = Array.new(5)
#   end

#   def [](index)
#     self.array.fetch(index)
#   end

#   def []=(index, val)
#     self.array[index] = val
#   end

#   def to_a
#     self.array.clone
#   end

#   def to_s
#     to_a.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# 3.

# class Student
#   attr_reader :name, :year

#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
# end

# 4.

# require 'time'

# class CircularQueue
#   def initialize(size)
#     @buffer = [nil] * size
#     @next_position = 0
#     @oldest_position = 0
#   end

#   def enqueue(object)
#     unless @buffer[@next_position].nil?
#       @oldest_position = increment(@next_position)
#     end

#     @buffer[@next_position] = object
#     @next_position = increment(@next_position)
#   end

#   def dequeue
#     value = @buffer[@oldest_position]
#     @buffer[@oldest_position] = nil
#     @oldest_position = increment(@oldest_position) unless value.nil?
#     value
#   end

#   private

#   def increment(position)
#     (position + 1) % @buffer.size
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)

# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# 5.

# class MinilangRuntimeError < RuntimeError
# end

# class BadTokenError < MinilangRuntimeError
# end

# class EmptyStackError < MinilangRuntimeError
# end

# class Minilang
#   attr_accessor :register
#   attr_reader :stack

#   def initialize(input)
#     @commands = input.split
#     @register = 0
#     @stack = []
#   end

#   def eval
#     @commands.each do |command|
#       if command =~ /\d/
#         self.register = command.to_i
#       else
#         begin
#           self.send(:execute, command.downcase)
#         rescue MinilangRuntimeError => error
#           puts error.message
#         end
#       end
#     end
#   end

#   private

#   def execute(command)
#     begin
#       case command
#       when 'print' then puts self.register
#       when 'push'  then self.stack << self.register
#       when 'pop'   then self.register = self.stack.pop if self.stack.fetch(-1)
#       when 'add'   then self.register += self.stack.fetch(-1)
#       when 'sub'   then self.register -= self.stack.fetch(-1)
#       when 'mult'  then self.register *= self.stack.fetch(-1)
#       when 'div'   then self.register /= self.stack.fetch(-1)
#       when 'mod'   then self.register %= self.stack.fetch(-1)
#       else              raise BadTokenError, "Invalid token: #{command.upcase}"
#       end
#     rescue IndexError
#       raise EmptyStackError, "Empty stack!"
#     end
#   end
# end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# 6.
# 7.

# class Guesser
#   RESULT_MESSAGE = {
#     low: 'Your number is too low.',
#     high: 'Your number is too high.',
#     lose: 'You are out of guesses.  You lose.',
#     win: 'You win!'
#   }.freeze

#   def initialize(low, high)
#     @range = low..high
#     @max_guesses = Math.log2(high - low + 1).to_i + 1
#   end

#   def play
#     reset
#     @max_guesses.downto(1) do |remaining_guesses|
#       display_guesses_remaining(remaining_guesses)
#       result = check_guess(obtain_guess)
#       puts RESULT_MESSAGE[result]
#       return if result == :win
#     end

#     puts "\n", RESULT_MESSAGE[:lose]
#   end

#   private

#   def display_guesses_remaining(remaining)
#     puts
#     if remaining == 1
#       puts 'You have 1 guess remaining.'
#     else
#       puts "You have #{remaining} guesses remaining."
#     end
#   end

#   def check_guess(guess_value)
#     return :low if guess_value < @secret_number
#     return :high if guess_value > @secret_number
#     :win
#   end

#   def obtain_guess
#     loop do
#       print "Enter a number between #{@range.first} and #{@range.last}:"
#       guess = gets.chomp.to_i
#       return guess if @range.cover?(guess)
#       print "Invalid guess."
#     end
#   end

#   def reset
#     @secret_number = rand(@range)
#   end
# end

# game = Guesser.new(501, 1500)
# game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# You win!

# game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low

# You are out of guesses. You lose.

# 8.
# 9.
# 10.

# class Card
#   include Comparable

#   VALUES = {
#     'Jack' => 11,
#     'Queen' => 12,
#     'King' => 13,
#     'Ace' => 14
#   }

#   attr_reader :rank, :suit

#   def initialize(rank, suit)
#     @suit = suit
#     @rank = rank
#   end

#   def to_s
#     "#{self.rank} of #{self.suit}"
#   end

#   def value
#     VALUES.fetch(self.rank, self.rank)
#   end

#   def <=>(other_card)
#     self.value <=> other_card.value
#   end
# end

# class Deck
#   RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
#   SUITS = %w(Hearts Clubs Diamonds Spades).freeze

#   def initialize
#     reset
#   end

#   def draw
#     reset if @deck.empty?
#     @deck.pop
#   end

#   private

#   def reset
#     @deck = RANKS.product(SUITS).map do |rank, suit|
#       Card.new(rank, suit)
#     end

#     @deck.shuffle!
#   end
# end

# # Include Card and Deck classes from the last two exercises.

# class PokerHand
#   def initialize(deck)
#     @cards = []
#     @rank_count = Hash.new(0)

#     5.times do
#       card = deck.draw
#       @cards << card
#       @rank_count[card.rank] += 1
#     end
#   end

#   def print
#     puts @cards
#   end

#   def evaluate
#     case
#     when royal_flush?     then 'Royal flush'
#     when straight_flush?  then 'Straight flush'
#     when four_of_a_kind?  then 'Four of a kind'
#     when full_house?      then 'Full house'
#     when flush?           then 'Flush'
#     when straight?        then 'Straight'
#     when three_of_a_kind? then 'Three of a kind'
#     when two_pair?        then 'Two pair'
#     when pair?            then 'Pair'
#     else                       'High card'
#     end
#   end

#   private

#   def royal_flush?
#     straight_flush? && @cards.min.rank == 10
#   end

#   def straight_flush?
#     flush? && straight?
#   end

#   def four_of_a_kind?
#     n_of_a_kind?(4)
#   end

#   def full_house?
#     n_of_a_kind?(3) && n_of_a_kind?(2)
#   end

#   def flush?
#     suit = @cards.first.suit
#     @cards.all? { |card| card.suit == suit }
#   end

#   def straight?
#     return false if @rank_count.any? { |_, count| count > 1 }

#     @cards.min.value == @cards.max.value - 4
#   end

#   def three_of_a_kind?
#     n_of_a_kind?(3)
#   end

#   def two_pair?
#     @rank_count.select { |_, count| count == 2 }.length == 2
#   end

#   def pair?
#     n_of_a_kind?(2)
#   end

#   def n_of_a_kind?(number)
#     @rank_count.one? { |_, count| count == number }
#   end
# end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# # Danger danger danger: monkey
# # patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

# # Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'
