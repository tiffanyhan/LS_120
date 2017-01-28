# 1.

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# hello = Hello.new
# hello.hi # outputs "Hello"

# hello = Hello.new
# hello.bye # no method error

# hello = Hello.new
# hello.greet # argument error

# hello = Hello.new
# hello.greet("Goodbye") # outputs "Goodbye"

# Hello.hi # no method error

# 2.

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# make an instance of the Hello class
# and then class the .hi method on the instance

# 3.

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end

#   def age
#     puts @age
#   end

#   def name
#     puts @name
#   end

#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# smalls = AngryCat.new(3, 'Tiny')
# big = AngryCat.new(4, 'Biggie')

# 4.

# class Cat
#   attr_reader :type

#   def initialize(type)
#     @type = type
#   end

#   def to_s
#     "I am a #{type} cat"
#   end
# end

# 5.

# class Television
#   def self.manufacturer
#     # method logic
#   end

#   def model
#     # method logic
#   end
# end

# tv = Television.new
# tv.manufacturer # no method error
# tv.model # works

# Television.manufacturer # works
# Television.model # no method error

# 6.

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     @age += 1
#   end
# end

# 7.

# the class method
