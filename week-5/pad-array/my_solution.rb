# Pad an Array

# I worked on this challenge [with:  Karla King ]

# I spent [] hours on this challenge.


# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.



# 0. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 1. Initial Solution
def pad!(array, min_size, value = nil) #destructive
  diff = min_size - array.length 
  if diff <= 0 
    return array 
  else diff.times {array.push(value)}
    return array 
  end
end

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
def pad(array, min_size, value = nil) #non-destructive
  new_array = array.dup
  diff = min_size - array.length
  diff <= 0 ? new_array : diff.times {new_array.push(value)}
  new_array
end

# 4. Reflection