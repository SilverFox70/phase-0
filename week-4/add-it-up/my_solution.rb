# Add it up!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge [with: Micheal Whelpley ].

# 0. total Pseudocode
# make sure all pseudocode is commented out!

# Input:array of numbers
# Output: sum of all numbers in the array
# Steps to solve the problem.
# declare a variable sum and set it equal to 0
# iterate through array and do sum += element
# return sum


# 1. total initial solution
def total(array)
	sum = 0
	array.each {|number| sum += number}
	sum
end


# 3. total refactored solution
def total(array)
	array.inject(0) {|sum, num| sum += num}
end

def total(array)
	array.reduce(:+)
end

# 4. sentence_maker pseudocode
# make sure all pseudocode is commented out!
# Input: an array of words
# Output: a sentence, properly capitalized and with a period at the end
# Steps to solve the problem.
# Combine all the words in the array, putting a space between them, and assign to a variable (sentence)
# use .capitalize to  capitalize the sentence
# append a "." to the end of the sentence

# 5. sentence_maker initial solution

def sentence_maker(word_array)
  sentence = word_array.inject(" "){|words,element| words += element.to_s + " "}
  sentence.strip!.capitalize!
  sentence << "."
end



# 6. sentence_maker refactored solution

