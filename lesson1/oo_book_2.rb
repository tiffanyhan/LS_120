# 1.
# 2.
# 3.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def accelerate(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def speed
    puts "You are going #{@speed} mph."
  end

  def shut_off
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Lookin' good!  Your car is now #{self.color}."
  end
end

mustang = MyCar.new(2000, 'yellow', 'Ford Mustang')
mustang.speed
mustang.accelerate(40)
mustang.speed
mustang.accelerate(20)
mustang.speed
mustang.brake(10)
mustang.speed
mustang.brake(30)
mustang.speed
mustang.shut_off
mustang.speed

puts mustang.color
mustang.spray_paint('baby blue')
puts mustang.year
# mustang.year = 1990 # throws an error as expected
