# Numbers to English Words


# I worked on this challenge [by myself].
# This challenge took me [#] hours.


# Pseudocode
# input : a Fixnum
# output : the translation of that number into English words
# 1. create a hash where key values equal..
#   a. single digits to the value of string representing these numbers
#   b. double digits to the value of string for teens and then 20 through 90
#   c. hundreds place digits to the value of a string
#   d. thousands place digits to the value of a string
# 2. breakdown the number into singles, tens, hundreds, and thousands
#   a. special case for numbers in the teens
# 3. build a result string based on passing the broken down number to
#    the hash in parts to assemble a string answer
#   a. pass the largest value digit to the hash to find its string 
#      equivalent
#   b. recursively call this method until all digits have been
#      "translated"
# 4. return the string answer and display it


# Initial Solution


def in_words(num)
  space = " "
  hundred = " hundred"
  thousand = " thousand"
  to_english = { 1 => "one", 2 => "two", 3 => "three", 4 => "four",
               5 => "five", 6 => "six", 7 => "seven", 8 => "eight",
               9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
               13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
               16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
               19 => "nineteen", 20 => "twenty", 30 => "thirty",
               40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy",
               80 => "eighty", 90 => "ninety"}	
  in_english = ""
  if (num < 21)
  	in_english = to_english[num]
  elsif (num < 100)
  	in_english = to_english[(num/10)*10] 
  	in_english +=  space + to_english[num % 10] if (num % 10) != 0
  elsif (num < 1000)
  	in_english = to_english[(num/100)] + hundred
  	num = num % 100
  	in_english += space + to_english[(num/10)*10] if ((num/10)*10) != 0
  	in_english +=  space + to_english[num % 10] if (num % 10) != 0
  else
  	if ((num/1000) < 100)
  	  temp_num = num / 1000
  	  if (temp_num < 21)
  	    in_english = to_english[temp_num]
  	  else
  	    in_english = to_english[(temp_num/10)*10]
  	  end	
      in_english +=  space + to_english[temp_num % 10] if (temp_num % 10) != 0
      in_english += thousand
    end
  	#in_english = to_english[(num/1000)] + thousand
  	num = num % 1000
  	in_english += space + to_english[(num/100)] + hundred if ((num/100)*100) != 0
  	num = num % 100
  	in_english += space + to_english[(num/10)*10] if ((num/10)*10) != 0
  	in_english +=  space + to_english[num % 10] if (num % 10) != 0
  end
  in_english
end




# Refactored Solution
=begin
class Numbers_to_words
	
	def initialize
	  @space = " "
	  @hundred = " hundred"
	  @thousand = " thousand"
	  @to_english = { 0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four",
	                  5 => "five", 6 => "six", 7 => "seven", 8 => "eight",
	                  9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
	           		  13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
	          		  16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
	         		  19 => "nineteen", 20 => "twenty", 30 => "thirty",
	           		  40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy",
	           		  80 => "eighty", 90 => "ninety"}	
	  @in_english = ""
    end

	def less_than_21(num)
	  @in_english += @to_english[num]	
	end

	def less_than_100(num)
	  @in_english = @to_english[(num/10)*10]  
	  @in_english += @space + @to_english[num % 10] if (num % 10) != 0	
	  @in_english
	end

	def less_than_1000(num)
	  @in_english = less_than_21(num/100) + @hundred
	  num = num % 100   #remove the hundreds place digit
	  puts("test: #{num}")
	  in_words(num) if num != 0
	  #@in_english += less_than_100(num) if num != 0
	  @in_english
	end

	def less_than_HunThous(num)
	  thousands = num/1000 
	  if thousands < 21
	  	@in_english = less_than_21(thousands)
	  else
	  	@in_english = less_than_100(thousands)
	  end
	  @in_english += @thousand
	  num = num % 1000
	  @in_english += @space + less_than_1000(num)
	  num = num % 100
	  @in_english += @space + less_than_100(num)
	end

	def in_words(num)
	  @in_english = " "	
	  case num
	  when 1..20
	  	less_than_21(num)
	  when 21..99
	  	less_than_100(num)
	  when 100..999
	  	less_than_1000(num)
	  when 1000..99999
	  	less_than_HunThous(num)
	  end
	end
end
=end


# driver code

1..100000.times do |x|
  p in_words(x)
end



# Reflection
=begin
	As I was writing the initial code I thought I saw some great opportunities to 
	refactor the code.  However, the reason that the refactored code is commented
	out is because it became a huge mess that just wasn't working, even after 3 hours
	of bashing it around.  A part of me still thinks that there is a sort of recursive
	solution to this problem, but I am not approaching it correctly.  On the other hand,
	it might be just as well to step back from my initial approach and rethink the whole
	thing from scratch.  


	
=end
