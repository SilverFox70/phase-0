# Pad an Array

# I worked on this challenge [with:  Karla King ]

# I spent [1.0] hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.



# 0. Pseudocode

# What is the input? an array, size of integer, possible value to pad the array, any class
# What is the output? an array 
# What are the steps needed to solve the problem?
# Check length of the array to see if it is less than min_size
# If it is not, we pass back the array
# If it is less, we must pad the array 
  # Find the difference between elements in the array and the min_size
  # Create a variable to pad the array 
  # Add the variable to the array until it equals the min_size
# Return modified array 
# End 

# 1. Initial Solution
=begin
def pad!(array, min_size, value = nil) #destructive
  diff = min_size - array.length 
  if diff <= 0 
    return array 
  else diff.times {array.push(value)}
    return array 
  end
end
=end


=begin
def pad(array, min_size, value = nil) #non-destructive
  new_array = array.dup
  diff = min_size - array.length
  if diff <= 0 
  	return new_array
  else diff.times {new_array.push(value)}
  	return new_array
  end
end
=end


# 3. Refactored Solution
def pad!(array, min_size, value = nil) #destructive
  diff = min_size - array.length 
  diff <= 0 ? array : diff.times {array.push(value)}
  array
end

def pad(array, min_size, value = nil) #non-destructive
  new_array = array.dup
  diff = min_size - array.length
  diff <= 0 ? new_array : diff.times {new_array.push(value)}
  new_array
end

# 4. Reflection
Were you successful in breaking the problem down into small steps?
    Yes!  I think we did a good job of working through the pseudocode portion 
    and breaking the logic down into discreet steps.  It made it very easy to
    construct the initial solution.

Once you had written your pseudocode, were you able to easily translate it into code? 
What difficulties and successes did you have?
    Like I said above, this time around breaking the problem down into discreet steps 
    in our pseudocode made it easy to translate into actual code.  What I did notice
    is that the order of some of the steps changed as we actually put the code into
    place.  It was something we realized and reacted to in real time as we wrote the
    code.

Was your initial solution successful at passing the tests? If so, why do you think 
that is? If not, what were the errors you encountered and what did you do to resolve them?
    If I remember correctly it failed initially because we forgot to return the value
    (or place a reference to it) at the end of the method.  We also learned that merely
    setting a variable = to another_variable only makes the new variable point to the
    initial variable; it does not create a another instance of that object.  So, we had
    to use .dup to create a new instance of the array for the non-destructive method.

When you refactored, did you find any existing methods in Ruby to clean up your code?
    Our refactoring didn't bring up any new methods for use, but we did find a way to
    sweeten up our logic statements to make it cleaner and more readable.

How readable is your solution? Did you and your pair choose descriptive variable names?
    The refactored version is very easy to read as far as I can tell.  I think the 
    variable names we choose are terse, yet understandable.

What is the difference between destructive and non-destructive methods in your own words?
    A destructive method changes the actual object that is passed to it, meaning you lose
    whatever it was before the method was called.  Non-destructive methods do NOT affect
    the object passed to them but instead return a new object instance.
