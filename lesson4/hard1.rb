# 1.

# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end

# class SecretFile
#   def initialize(secret_data)
#     @data = secret_data
#     @logger = SecurityLogger.new
#   end

#   def data
#     @logger.create_log_entry
#     @data
#   end
# end

# 2.
# 3.
# 4.

# module Moveable
#   attr_accessor :speed, :heading
#   attr_writer :fuel_capacity, :fuel_efficiency

#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end

# class WheeledVehicle
#   include Moveable

#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity
#   end

#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end

#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end

# class Seacraft
#   include Moveable

#   attr_accessor :propeller_count, :hull_count

#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     self.fuel_efficiency = km_traveled_per_liter
#     self.fuel_capacity = liters_of_fuel_capacity

#     # ... other code to track catamaran-specific data omitted ...
#   end

#   def range
#     range_by_using_fuel = super
#     range_by_using_fuel + 10
#   end
# end

# class Catamaran < Seacraft
# end

# class Motorboat < Seacraft
#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
#   end
# end
