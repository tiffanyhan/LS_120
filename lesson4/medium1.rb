# 1.

# class BankAccount
#   attr_reader :balance

#   def initialize(starting_balance)
#     @balance = starting_balance
#   end

#   def positive_balance?
#     balance >= 0
#   end
# end

# Ben is right.
# you don't need self in order to use
# the getter method, which is what this
# code is doing

# 2.

# class InvoiceEntry
#   attr_reader :quantity, :product_name

#   def initialize(product_name, number_purchased)
#     @quantity = number_purchased
#     @product_name = product_name
#   end

#   def update_quantity(updated_count)
#     # prevent negative quantities from being set
#     quantity = updated_count if updated_count >= 0
#   end
# end

# quantity is functioning as a local variable inside update_quantity
# to fix it, add a setter method for @quantity, and call it
# using self.quantity =

# 3.

# we may not want to expose the setter method for @quantity
# i.e. we may not want to allow use of it outside the class

# 4.

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     self.greet('Hello')
#   end
# end

# class Goodbye < Greeting
#   def bye
#     self.greet('Goodbye')
#   end
# end

# 5.

# class KrispyKreme
#   attr_reader :filling_type, :glazing

#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end

#   def to_s
#     filling_string = filling_type ? filling_type : "Plain"
#     glazing_string = glazing ? " with #{glazing}" : ''
#     filling_string + glazing_string
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1
#   #=> "Plain"

# puts donut2
#   #=> "Vanilla"

# puts donut3
#   #=> "Plain with sugar"

# puts donut4
#   #=> "Plain with chocolate sprinkles"

# puts donut5
#   #=> "Custard with icing"

# 6.

# no difference

# 7.

# self.information
