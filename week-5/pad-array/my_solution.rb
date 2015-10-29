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