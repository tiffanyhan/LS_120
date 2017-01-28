# 1.

# all are objects
# use the .class method

# 2.

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed

#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed

#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# car = Car.new
# car.go_fast

# truck = Truck.new
# truck.go_fast

# 3.

# self refers to the object that called the method

# 4.

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end

# kitty = AngryCat.new

# 5.

# Pizza has an instance variable bc it is
# prefixed with @

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end

# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end

# hot_pizza = Pizza.new('cheese')
# orange    = Fruit.new('apple')

# p hot_pizza.instance_variables
# p orange.instance_variables

# 6.

# class Cube
#   def initialize(volume)
#     @volume = volume
#   end

#   def get_volume
#     @volume
#   end
# end

# big_cube = Cube.new(5000)
# puts big_cube.get_volume

# 7.

# prints out a string representation of the object
# like <Object: 2443>
# you could look up documentation for the BasicObject
# or Object class

# 8.

# class Cat
#   attr_accessor :type, :age

#   def initialize(type)
#     @type = type
#     @age  = 0
#   end

#   def make_one_year_older
#     self.age += 1
#   end
# end

# self refers to an instance of the class

# 9.

# class Cat
#   @@cats_count = 0

#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end

#   def self.cats_count
#     @@cats_count
#   end
# end

# self refers to the class

# 10.

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end

# bag = Bag.new('brown', 'paper')
