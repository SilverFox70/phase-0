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
	mode_array = []
	all_only_once = true
	if freq_hash.none? {|k, v| v > 1}
		mode_array = source 
	else freq_hash.each {|k, v| mode_array.push(k) if v > 1}
	end
	mode_array
end

p mode([1,1,2,3,4,5,5])
p mode([1,2,3])

# 3. Refactored Solution




# 4. Reflection