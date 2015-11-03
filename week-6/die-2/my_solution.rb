# Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: an array of strings
# Output: when Die#roll is called it should randomly return one of those strings
# Steps:

# 1. Initialize an instance of Die
# 	a. if the passed array, 'labels', is empty or zero length, raise an Arguement Error
#   b. populate an instance array, @labels, with the data from 'labels', the passed argument	
# 2. Set the number of sides to be equal to the @labels array length
# 3. def the method "roll" to randomly return on of the strings from @labels
#   a. generate 'side_rolled' equal to a random number from 0 to the number of elements in 
#      @labels (also equal to 'sides')
#   b. return the string found at index "side_rolled" of @labels

# Initial Solution

class Die
  def initialize(labels)
  	raise ArgumentError.new("Must have at least 1 labeled side") unless labels.length >= 1
  	@labels = labels.dup
  	@labels.each {|w| print " - #{w} -"}
  end

  def sides
  	@sides = @labels.length
  end

  def roll
  	side_rolled = rand(@sides)
  	print " : #{@labels[side_rolled]}"
  	@labels[side_rolled]
  end
end

# Driver code

my_die = Die.new(%w{a b c d e f g h})
p "sides: #{my_die.sides}"
p " rolled: #{my_die.roll}"
p " rolled: #{my_die.roll}"
p " rolled: #{my_die.roll}"
p " rolled: #{my_die.roll}"
p " rolled: #{my_die.roll}"

output = []
100.times { output << my_die.roll}
output.each {|e| puts "roll = #{e}"}
# Refactored Solution








# Reflection