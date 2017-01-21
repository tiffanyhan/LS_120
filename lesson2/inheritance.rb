# 1.

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class BullDog < Dog
#   def swim
#     "can't swim!"
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# max = BullDog.new
# puts max.speak
# puts max.swim

# 2.

class Pet
  def speak(sound)
    sound
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet

end

spot = Dog.new
puts spot.run
puts spot.jump
puts spot.swim
puts spot.speak('arf!')

puts '---------'

tiger = Cat.new
puts tiger.run
puts tiger.jump
puts tiger.speak('meow!')
#puts tiger.fetch

# 3.

#     PET
#   DOG - CAT
# BULLDOG

# 4.

# the method lokoup path is where ruby looks for methods
# when a certain method is called on an object.
# it is important bc subclasses can inherit methods from superclasses.
# also methods can be overwritten. so to know which method will be used,
# you have to know in what order classes are searched
