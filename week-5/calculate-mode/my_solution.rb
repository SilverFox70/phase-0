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
=begin
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
=end


#p mode([1,1,2,3,4,5,5])
#p mode([1,2,3])

# 3. Refactored Solution
def frequencies(source)
	freq = Hash.new
	source.each do |e| 
	    freq[e] = source.count(e)
    end
    freq
end

def mode(source)
	freq_hash = frequencies(source)
	highest_frequency = freq_hash.max_by {|k, v|  v }[1]
	mode_array = freq_hash.collect {|k, v| k if v == highest_frequency}.reject{|x| x == nil}
end



# 4. Reflection
=begin
Which data structure did you and your pair decide to implement and why?

	We ended up using a hash, although at first we were thinking of using an 
	multi-dimensional array. It quickly became clear that using a hash would 
	be easier because we would be able to access the data ultimately wanted 
	more directly and easily.

Were you more successful breaking this problem down into implementable pseudocode 
than the last with a pair? 
	This challenge was much more difficult for us.  Although we wrote the pseudocode
	in plain English style, I think we would have benefited from calling out more
	specific variable names and actions.  It was one of those, it seemed simple 
	enough at first...

What issues/successes did you run into when translating your pseudocode to code?
	We had a bear of a time doing it.  Our pseudocode was not nearly explicit
	enough and we quickly found ourselve lost as we started to actually code the
	solution.  We should probably have put down the coding and returned to rework
	the pseudocode once we saw that our ideas were not explicit enough.

What methods did you use to iterate through the content? Did you find any good ones 
when you were refactoring? Were they difficult to implement?
	#select was probably the fanciest method we used in the initial solution, and a
	few #each iterators.  To refactor we used #max_by, #collect, and #reject.  It 
	took a bit of banging around to get #max_by to work properly until we realized
	that we could treat the whole expression as if it were an array, since that is
	its return type.  Collect is super handy, but at first we got array filled with
	nil values, so we used #reject to git rid of them.  There is probably a more
	elegant way to do what we did there, but we couldn't find a method that seemed
	perfect.
=end




