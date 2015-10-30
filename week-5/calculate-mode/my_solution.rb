# Calculate the mode Pairing Challenge

# I worked on this challenge [with: Clinton Weber]

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.



# 0. Pseudocode

# What is the input? An array of either numbers or strings
# What is the output? An array of the most frequently occuring values in the source array
# What are the steps needed to solve the problem?
# 1. define a method to create a hash whose keys are the elements of the source array
#    and whose values represent the frequency of occurences of said element
# 2. if all values in our hash = 1, return the orginal array else
# 3. if some values in our hash are greater than 1, return only those keys whose
#    values are greater than 1, omitting the rest


# 1. Initial Solution
def frequencies(source)
	freq = Hash.new
	source.each do |e|
		freq[e] = 0
		source.each do |w|
			freq[e] += 1 if e == w 
		end
	end
	freq
end

def mode(source)
	freq_hash = frequencies(source)
	highest_frequency = 0
	freq_hash.each {|k, v| highest_frequency = v if v > highest_frequency}
	mode_hash = freq_hash.select {|k, v| v == highest_frequency}
	mode_array = [] 
	mode_hash.each {|k, v| mode_array.push(k)}
	mode_array
end


p mode([1,1,2,3,4,5,5])
p mode([1,2,3])

# 3. Refactored Solution




# 4. Reflection