# 1.

class Cat
end

cookie = Cat.new

# 2.

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

module Animal
  class Cat
    include Speak
  end
end

cookie = Animal::Cat.new
cookie.speak('meow')

puts Animal::Cat.ancestors