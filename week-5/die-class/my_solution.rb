# Die Class 1: Numeric

# I worked on this challenge [by myself]

# I spent [] hours on this challenge.

# 0. Pseudocode

# Input: A call to the Die class to create a new instance using an argument
#        passed to the constructor
# Output: The ability to "roll" the die and get a random number returned.
# Steps:
#  Define a new class, Die
#  set the initialize method of Die to accept an integer argument for the
#  number of side of the die.
#  create a method (sides) which returns the number of sides of the Die we created
#  create a method (roll) which generates a random numbers between 1 and the
#  total number of sides of the instance.


# 1. Initial Solution

class Die
  def initialize(sides)
  	unless sides >= 1
  		raise ArgumentError.new("You must have at least 1 side")
  	end
    @sides = sides
  end

  def sides
    p @sides
  end

  def roll
    p (rand(@sides) + 1) # We add +1 otherwise we would get 0-n 
  end
end



# 3. Refactored Solution
# I really don't see anything to refactor in this case.  No fancy methods
# were required for any of this.


# 4. Reflection
=begin

What is an ArgumentError and why would you use one?

  ArgumentErrors are used for when the arguments are wrong and there isn't a more specific
  Exception class that applies.  If you write a method that takes two integers as nominator
  and denominator and then divides those numbers, you can't accept a zero as the denominator
  argument since it will make your program crash.  Now, in that particular case an actual
  Exception would be thrown, but you could also raise an ArgumentError to let the user
  of your method or class know what they did wrong.  In general you use it to guard against
  users trying to feed inappropriate data into your methods.

What new Ruby methods did you implement? What challenges and successes did you have in 
implementing them?

  I used the rand() method with a range so as to return integer values.  At first I 
  misunderstood how the range worked, but I quickly figured that out.

What is a Ruby class?

  A Class is like a blueprint for an object.  It is the outline of what information and methods
  an object of that class can contain.  Classes can inherit properties and methods from their
  parent, or superclass.  Child classes can, however, override methods of their parent class
  by defining their wn version of a method using the same name as the parent class's method.

Why would you use a Ruby class?

	Classes allow you to create one blueprint that can make thousands of objects which all share
	the same data structure and methods.  A good real life example would be of a Customer Class,
	where you could have many instances of Customer for each person who comes to your site
	to purchase things.  

	Classes and OOP in general allow for data encapsulation and abstraction, inheritance, and 
	polymorphism.  You can restrict access to data and methods within a class so that end users
	can't muck up your program or gain access to sensitive information.  

What is the difference between a local variable and an instance variable?

  	Local variables only exist within their current scope, and as soon as the program moves along
  	and out of that scope, that variable and its data get marked for GC (garbage collection).  On
  	the other hand, instance variables will exist as long as their is a reference to the instance
  	of the object or that instance variable is in use somewhere in the program.  It should be noted
  	that ANY object that is created is automatically allocated a minimum of 8mb of memory.

Where can an instance variable be used?

	An instance variable can be "viewed" using accessor methods from anywhere in the program so 
	long as the instance of the object exists.  Properly speaking in terms of OOP, it should only
	be "used" inside of the Class/Object itself.  Although you could access the instance variable
	directly from out of the scope of the object, this is considered bad form since you would be
	undermining the principles of data encapsulation.
=end
