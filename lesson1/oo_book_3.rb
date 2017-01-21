# 1.
# 2.

class MyCar
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.mpg(gallons, miles)
    puts "Mpg is #{miles / gallons}."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def to_s
    "This is a #{self.year} #{self.model} that is #{self.color}."
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
MyCar.mpg(12, 250)
puts mustang

# 3.

# we are trying to call a setter method for name, but
# attr_reader only establishes a getter method for name
# and not a setter method.