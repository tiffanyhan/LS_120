# 1.

# puts 'Hello'.class
# puts 5.class
# puts [1, 2, 3].class

# 2.

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

# 3.

kitty = Cat.new('Sophie')

# 4.
# 5.

kitty.greet
puts kitty.name

# 6.
# 7.

kitty.name = 'Luna'
kitty.greet

# 8.

kitty.walk
