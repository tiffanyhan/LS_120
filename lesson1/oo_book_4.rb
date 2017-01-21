# 1.
# 2.
# 3.
# 4.
# 5.
# 6.

require 'time'

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year, :speed
  attr_reader :model

  def self.number_of_vehicles
    puts "#{@@number_of_vehicles} vehicles have been created."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @time_created = Time.new

    @@number_of_vehicles += 1
  end

  def accelerate(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def shut_off
    @speed = 0
    puts "Let's park this bad boy!"
  end

  def age
    "This vehicle is #{years_old} years_old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

module Trunkable
  def trunk
    puts "You popped open the trunk!"
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class MyCar < Vehicle
  include Trunkable

  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.year} #{self.model} that is #{self.color}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{self.year} #{self.model} that is #{self.color}."
  end
end

mustang = MyCar.new(2000, 'yellow', 'Ford Mustang')
puts mustang
puts mustang.speed
mustang.accelerate(65)
puts mustang.speed

frontier = MyTruck.new(2010, 'silver', 'Nissan Frontier')
puts frontier
puts frontier.speed
frontier.accelerate(20)
puts frontier.speed
frontier.accelerate(10)
puts frontier.speed

Vehicle.number_of_vehicles

mustang.trunk
puts frontier.can_tow?(500)

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts mustang.age
puts frontier.age

# 7.

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('Joe', 100)
bob = Student.new('Bob', 90)

puts 'Well done!' if joe.better_grade_than?(bob)

# 8.

# trying to call a private method on the object
# either make the method public or call it
# within the class










