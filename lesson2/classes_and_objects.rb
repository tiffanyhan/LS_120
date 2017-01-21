# 1.
# 2.
# 3.

class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(name)
    parse_full_name(name)
  end

  def to_s
    name
  end

  private

  def parse_full_name(name)
    self.first_name = name.split.first
    self.last_name = name.split.length > 1 ? name.split.last : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

# 4.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts bob.name == rob.name

# 5.

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# outputs something like:
# "The person's name is: <Person:321439024>"

# after we overwrite the to_s method,
# now it prints out:
# "The person's name is: Robert Smith"
