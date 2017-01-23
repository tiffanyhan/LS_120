# 1.

# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-#{'-' * @message.length}-+"
#   end

#   def empty_line
#     "| #{' ' * @message.length} |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner

# 2.

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name # outputs 'Fluffy'
# puts fluffy # outputs "My name is FLUFFY"
# puts fluffy.name # outputs 'FLUFFY'
# puts name # outputs 'Fluffy'

# 3.

# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 4.

# class Book
#   attr_accessor :title, :author

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 5.

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

#   def first_name=(name)
#     @first_name = name.capitalize
#   end

#   def last_name=(name)
#     @last_name = name.capitalize
#   end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# 6.

# class Flight
#   attr_accessor :database_handle

#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

# make the database_handle private or protected

# 7.

# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     self.mileage += miles
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# 8.

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end

#   def area
#     @height * @width
#   end
# end

# class Square < Rectangle
#   def initialize(side)
#     super(side, side)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# 9.

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, fur_color)
#     super(name, age)
#     @fur_color = fur_color
#   end

#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@fur_color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

# 10.

# class Vehicle
#   attr_reader :make, :model, :wheels

#   def initialize(make, model, wheels)
#     @make = make
#     @model = model
#     @wheels = wheels
#   end

#   def to_s
#     "#{make} #{model}, #{wheels} wheels"
#   end
# end

# class Car < Vehicle
# end

# class Motorcycle < Vehicle
# end

# class Truck < Vehicle
#   attr_reader :payload

#   def initialize(make, model, wheels, payload)
#     super(make, model, wheels)
#     @payload = payload
#   end
# end

# car = Car.new('Honda', 'Accord', 4)
# motorcycle = Motorcycle.new('Kawasaki', 'Ninja', 2)
# truck = Truck.new('Nissan', 'Frontier', 6, 'Bed')

# puts car
# puts motorcycle
# puts truck
# puts truck.payload
