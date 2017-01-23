# 1.

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Person
#   def initialize(name, address, city, state, zipcode)
#     @name = name
#     @address = address
#     @city = city
#     @state = state
#     @zipcode = zipcode
#   end
# end

# class Customer < Person
#   include Mailable

#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee < Person
#   include Mailable

#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new('John Doe', '3679 W MLK Ave', 'Los Angeles', 'CA', '90024')
# bob = Employee.new('Jane Doe', '516 Alvarado Ave', 'Los Angeles', 'CA', '90051' )
# betty.print_address
# bob.print_address

# 2.

# module Drivable
#   def drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive

# 3.

# class House
#   include Comparable

#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     self.price <=> other.price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# 4.

# class Transform
#   def self.lowercase(data)
#     data.downcase
#   end

#   def initialize(data)
#     @data = data
#   end

#   def uppercase
#     @data.upcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

# 5.

# class Something
#   def initialize
#     @data = 'Hello'
#   end

#   def dupdata
#     @data + @data
#   end

#   def self.dupdata
#     'ByeBye'
#   end
# end

# thing = Something.new
# puts Something.dupdata # outputs 'ByeBye'
# puts thing.dupdata # outputs 'HelloHello'

# 6.

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     self.amount <=> other_wallet.amount
#   end

#   protected

#   attr_reader :amount
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# 7.

# class Pet
#   attr_reader :type, :name

#   def initialize(type, name)
#     @type = type
#     @name = name
#   end

#   def to_s
#     "A #{self.type} named #{self.name}."
#   end
# end

# class Owner
#   attr_reader :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end

#   def add_pet(pet)
#     self.pets << pet
#   end

#   def number_of_pets
#     self.pets.length
#   end

#   def print_pets
#     self.pets.each { |pet| puts pet }
#   end
# end

# class Shelter
#   attr_reader :owners

#   def initialize
#     @owners = []
#   end

#   def adopt(owner, pet)
#     owner.add_pet(pet)
#     self.owners << owner if !self.owners.include?(owner)
#   end

#   def print_adoptions
#     self.owners.each do |owner|
#       puts "#{owner.name} has adopted the following pets:"

#       owner.print_pets
#       puts
#     end
#   end
# end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# 8.

# class Expander
#   def initialize(string)
#     @string = string
#   end

#   def to_s
#     expand(3)
#   end

#   private

#   def expand(n)
#     @string * n
#   end
# end

# expander = Expander.new('xyz')
# puts expander

# can't call a private method with self as the calling object.

# 9.

# module Walkable
#   def walk
#     puts "#{self} #{gait} forward."
#   end
# end

# class Animal
#   include Walkable

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     self.name
#   end
# end

# class Person < Animal
#   private

#   def gait
#     "strolls"
#   end
# end


# class Cat < Animal
#   private

#   def gait
#     "saunters"
#   end
# end

# class Cheetah < Cat
#   private

#   def gait
#     "runs"
#   end
# end

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# #=> "Flash runs forward"

# # 10.

# class Noble < Person
#   attr_reader :title

#   def initialize(name, title)
#     super(name)
#     @title = title
#   end

#   def to_s
#     "#{self.title} #{self.name}"
#   end

#   private

#   def gait
#     "struts"
#   end
# end

# byron = Noble.new("Byron", "Lord")
# byron.walk
# # => "Lord Byron struts forward"

# # puts byron.name
# # #=> "Byron"
# # puts byron.title
# #=> "Lord"

# puts Noble.ancestors
# puts '-------------'
# puts Cheetah.ancestors
