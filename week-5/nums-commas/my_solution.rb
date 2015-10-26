# Numbers to Commas Solo Challenge

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# 0. Pseudocode

# What is the input?
#    We are given an integer
#
# What is the output? (i.e. What should the code return?)
#    We should return a string representing the number with commas added
#
# What are the steps needed to solve the problem?
	# 1. convert number to string
	# 1.5 declare variable comma_index
	# 2. if string.length is less than comma_index, just return the string
	# 3. Other wise, while string.length >= comma_index
	   # insert comma at comma_index location
	# 4. return string

# 1. Initial Solution
# def separate_comma(num)
	# num = num.to_s
	# comma_index = 4
	# if num.length < 4
		# return num
	# end
	# while num.length >= comma_index
		# num.insert(-comma_index, ",")
		# comma_index += 4
	# end
	# num
# end



# 2. Refactored Solution
def separate_comma(num)
	# So Step by step: we take the number, convert it to a string, convert
	# the string to characters, and then convert that to an array.  Next
	# we revers the order of the array and then slice it into smaller arrays
	# each with only three elements.  Map works on an array in place by
	# iterating over each element and passing it to the block - only we want
	# to use "join", so we use the "&"" to tell Ruby that we want to switch
	# the Procedure join into behaving like a block. Then we join each slice
	# together using join(",") and reverse the string again to put it back in
	# proper order.
	num.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
end





# 3. Reflection
=begin
What was your process for breaking the problem down? What different approaches did you consider?
	I scribble down a bunch of numbers from 1 digit long to 12 digits long and took a moment to analyze
	how the pattern emerged and how adding commas change the overall number of characters as you inserted
	them into the number.  I took notes on the numerical pattern and then developed a simple algorithm to
	insert the commas in the proper places.  I also considered the idea of "slicing" the string into parts
	but at first I thought that would be clumsy, so I avoided it.

Was your pseudocode effective in helping you build a successful initial solution?
	Yes, doing the pseudcode was great and the initial solution passed on the first try.  Woot woot!

What Ruby method(s) did you use when refactoring your solution? What difficulties did you have implementing
it/them? Did it/they significantly change the way your code works? If so, how?
	So I started researching different approaches to this problem and found a wealth of advice.  I avoided
	those solutions or ideas that involved using REGEX.  I made a little tester program and inched through
	adding methods one at time to see what was happening.  I made it all the way to the map call and tried
	several approaches, but none of them was doing exactly what I wanted (I was ending up with a trailing
	",").  I found the "&" function and how it allows you to force a Proc to a Block or vice-verse and tried
	out the syntax to see how it worked.  In short, it did, so I added a very lengthy comment to walk-thru
	what that single line of code is doing in each step to make it more clear.

How did you initially iterate through the data structure?
	Originally I used the humble old "while" loop.  I figured with my first approach that there was no real
	advantage to actually iterating over the object itself since I knew mathmetically speaking where the 
	commas had to be inserted.

Do you feel your refactored solution is more readable than your initial solution? Why?
	At first glance, oh heck no!  But, if you look at it one step at a time, you can follow along with what is
	happening.  Also, that code is more easily modifiable in the future since the frequency and type of delimiter
	are easy to find. 
=end














