# Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself - could not find a pair that work with my schedule thise week].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: a number that is exactly 16 digits long
# Output: TRUE or FALSE depening on whether the number is a 
#         valid credit card number
# Steps:
# 1. check that the number is 16 digits long and raise an error if not
# 2. split the number into a 16 element array, each element a digit
#    a. name the array "card_array"
# 3. the challenge says to double every other digit starting with the
#    second to last and continuing until you reach the first.  However
#    this is exactly the same as doubling the digits at all of the even
#    indexes of the "card_array"
#    a. iterate throught the array doubling the values at even indexes
# 4. if any values in the array are double digit values (i.e. greater
#	 than 10), split those into two discreet values.  e.g. 13 becomes
#    1 and 3
#    a. iterate throught the array
#       1) IF a value > 10, divide by 10 and then also find the remainder
#       2) remove the old double digit value
#       3) insert the new, two discreet values into the array at the same
#          index the double digit value was at.
# 5. "sum" all of the digits in the "card_array"
# 6. IF the "sum" % 10 equals zero, RETURN TRUE ELSE RETURN FALSE 


# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

class CreditCard
  def initialize(cc_number)
  	num_of_digits = cc_number.to_s.length
  	raise ArgumentError.new("Not a valid credit card number: must be exactly 16 digits!") unless num_of_digits == 16
  	@cc_num_array = get_number_array(cc_number)

  end

  def get_number_array(card_number)
  	char_array = Array.new
  	card_number.to_s.chars.each {|c| char_array << c}
  	char_array.map! {|char| char.to_i}
  end

  def double_every_other_digit
  	@cc_num_array.map!.with_index {|num, index| index.even? ? num *= 2 : num}
  end

  def split_double_digits
    @cc_num_array.map.with_index do |num, index|
    	if num > 9
    		digit_1 = num / 10 #refactor to use divmod?
    		digit_2 = num % 10
    		@cc_num_array.delete_at(index)
    		@cc_num_array.insert(index, digit_1, digit_2)
    	else 
    		num
    	end
    end
    @cc_num_array
  end

  def check_card
  	double_every_other_digit
  	split_double_digits
  	check_sum = @cc_num_array.reduce(:+)
  	check_sum % 10 == 0 
  end

end

#  Original Driver code
# my_card = CreditCard.new(4563960122001999)
# p my_card.double_every_other_digit
# p " split doubles : #{my_card.split_double_digits}"
# p "check card #{my_card.check_card}"
# my_card = CreditCard.new(4408041234567901)
# p my_card.double_every_other_digit
# p " split doubles : #{my_card.split_double_digits}"
# p "check card #{my_card.check_card}"

# Driver code to test Assert Statements
def assert
  raise "Assertion Failed" unless yield
end

my_card = CreditCard.new(4408041234567901)
assert {my_card.double_every_other_digit == [8, 4, 0, 8, 0, 4, 2, 2, 6, 4, 10, 6, 14, 9, 0, 1]}
assert {my_card.split_double_digits == [8, 4, 0, 8, 0, 4, 2, 2, 6, 4, 1, 0, 6, 1, 4, 9, 0, 1]}
assert {my_card.check_card == true}


# Refactored Solution

# Honestly, I ran out of time to do a serious refactoring, although
# I felt as though I was paying attention to effiecient use of methods
# from the get-go.  I spent a lot of time (1+ hours) working on the algorithm
# for split_double_digits.  I woulnd't add much in the way of methods,
# but I would likey restructure some elements of the class.


# Reflection
=begin

What was the most difficult part of this challenge for you and your pair?

  For me it was splitting the double digit numbers.  I knew in English
  what I wanted to do, and I knew it could be done with plain logic and
  the use of temp arrays, but I also knew that it could be done in place,
  so I spent the bulk of time on this project working that out through
  experimentation.

What new methods did you find to help you when you refactored?

  I came across #divmod, which I opted not to use because I don't think it
  confers an advantage.  I know there is a way to map that temporary char_array
  in such a way as to avoid all those separate lines by chaining things together.
  However, when I tried that it simply didn't work, which confused me greatly 
  because it did work in irb.  

What concepts or learnings were you able to solidify in this challenge?

  Break the problem down into discreet steps.  Most of the time those steps
  will then turn into seperate methods in the Class.  Use variable names that 
  are meaningful and informative - it might take a few more seconds to type,
  but will make it far more readable to someone else down the line.
=end
