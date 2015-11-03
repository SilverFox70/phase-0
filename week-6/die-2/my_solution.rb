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
  	@sides = @labels.length
  end

  def sides
  	@sides
  end

  def roll
  	side_rolled = rand(@sides)
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

possible_values = ('A'..'Z').to_a.shuffle.first(15)

die = Die.new(possible_values)
puts "THis die has #{die.sides}"
output = []
100.times { output << die.roll}
output.each {|e| puts "roll = #{e}"}


# Refactored Solution

# Given the simplicity of this class and its code, I can't find anything
# worth refactoring here, although I am open to hearing suggestions when
# folks review this.


# Reflection

What were the main differences between this die class and the last one you created in terms 
of implementation? Did you need to change much logic to get this to work?

  It is not a lot different in reality.  With a little bit of work you could make one Class
  of Die that could handle either situation.  The main difference here is that the user is
  providing an array of labels as opposed to merely a number of sides for the die.

What does this exercise teach you about making code that is easily changeable or modifiable? 

  You should create code that is plastic and extensible so that you can add features or
  functionality in the future.  Really, you should build your classes starting with the most
  abstract blueprint of the kind of task you are trying to  accomplish and then make sub-classes
  to handle your current specific needs.	

What new methods did you learn when working on this challenge, if any?

  It isn't really new to me, but a used the shallow instance copy method #dup to create a new
  instance of the labels array.  This takes up more memory, but now the object inside the class,
  the @labels array is its own instance of array with identical values to the labels array, but
  it is not merely a pointer to that other object.  I'm not sure that is totally needed, but it
  feels "safe" because I know that my class instance will not be destructive to the orginal
  data passed in.

What concepts about classes were you able to solidify in this challenge?

  It helped a bit with the notion of abstraction and building in flexibility for future use.
