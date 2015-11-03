# Build a simple guessing game


# I worked on this challenge [by myself].
# I spent [#] hours on this challenge.

# Pseudocode

# Input: GuessingGame take an integer and stores it in the instance variable "answer"
# Output: different instance methods provide different output.
# 	1. #guess will return the symbols :high, :low, or :correct depending on whether
# 	   the value passed into the method is high, low, or matches the value of "answer"
#   2. #solved will return either true or false depending on whether a guess has been
#      made that returned a value of correct.

# Steps:

#  1. initialize "answer" as an instance variable using the value passed in during
#     creation of the class instance.
#     a. set "solved" = false
#  2. #guess will accept an integer as "guess"
#     a. compare "guess" to "answer"
#        i.  if "guess" > "answer" return :high
#        ii. if "guess" < "answer" return :low
#        iii.if "guess" = "answer" return :correct and update "solved" to true
#  3. #solved will return the value of "solved"

# Initial Solution
=begin

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(num)
  	if num > @answer
  		@solved = false
  		return :high
  	elsif num < @answer
  		@solved = false
  		return :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	@solved
  end

end
=end

# DRIVER CODE

=begin
game = GuessingGame.new(10)
p game.guess(5)
p game.guess(20)
p game.solved?
p game.guess(10)
p game.solved?
=end



# Refactored Solution
# I toyed with the idea of having another instance variable to store 
# the latest symbol returned by #guess, and that would have meant 
# re-writing #solved? to check for the value of that new instance
# variable, but it turns out that would result in more code, not less.
# I made this version a bit more DRY by moving where I reset @solved
# in the #guess method.
class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(num)
  	@solved = false
  	if num > @answer
  		return :high
  	elsif num < @answer
  		return :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	@solved
  end

end


# Reflection
=begin

How do instance variables and methods represent the characteristics and 
behaviors (actions) of a real-world object?

  Instance variables are like the attributes of a real-world object and
  methods represent the functions and capabilites of that object.  Of course
  some methods merely access data from the object, and don't add to its
  behaviors.

When should you use instance variables? What do they do for you?

  You should use instance variables whenever an instance of your class (an
  object) has attributes that belong to the class as a whole.  For exmample,
  if you were to create a Rectangle Class, it needs to have length and width,
  and these values should be stored as instance variable so that anyone who
  needs to know these attributes of this particular instance of Rectangle can
  find them.

Explain how to use flow control. Did you have any trouble using it in this 
challenge? If so, what did you struggle with?

  Sometimes flow control can be tricky, and I am really glad I took the time
  to pseudocode this step by step, because that helped me to see what the
  flow control needed to be.  Had I jyst dived in, I am sure that I would have
  made mistakes about the flow of the program.  Flow control is about figuring
  out where your program should go next depening on certain conditions.  It is
  also about knowing when you have to iterate over collections, and what to do
  as you step through that collection.

Why do you think this code requires you to return symbols? What are the benefits of using symbols?

  Symbols are immutable and unique.  They take up less memory than using strings,
  and since they can't be changed, you can avoid unpleasant surprises in having
  values change unexpectedly.
=end
