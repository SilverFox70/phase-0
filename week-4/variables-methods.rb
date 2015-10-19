puts "What's your first name? "
first_name = gets.chomp
puts "What's your middle name? "
middle_name = gets.chomp
puts "What's your last name? "
last_name = gets.chomp
puts "Well hello there, #{first_name} #{middle_name} #{last_name}"

puts "What is your favorite number? "
fav_num = gets.chomp.to_i
fav_num += 1
puts "I think #{fav_num} is a bigger, better number, don't you?"

=begin
	
##How do you define a local variable?

Local variables start with a lower case letter or an underscore.  Unlike global or instance variables
which have a "nil" value before initialization, local variable do not; therefore, if you try to use or
access a local variable before a value has been assigned, you will get an "undefined local variable or 
method" error.  So, it is good practice to declare a local variable's value when you create it.  For
example my_var = 4

##How do you define a method?

Methods are wrapped between a 'def' and an 'end'.  For example:

def my_method_name(args)
	#do something
end

The key word 'def' tells the compiler that you are creating a method. Above, the method will be named
'my_method_name'. Methods can accept arguments if you want to pass data into the method.  Using an
'*' before the last arg name will allow you to a have variable number of arguments passed into the
method.  The key word 'end' lets the compiler know that is the end of the method body.  The last value
before the 'end' keyword will be returned regardless of whether you explicitly use the keyword 'return'

##What is the difference between a local variable and a method?

Variables hold data, such as strings, integers, booleans, and floats.  Methods are like functions: they
perform an action.  Methods can be written to perform calculations on data, or to print out data or 
messages.

##How do you run a ruby program from the command line?

type: ruby program_name.rb

##How do you run an RSpec file from the command line?

type: rspec rspec_filename.rb

##What was confusing about this material? What made sense?

This has all been very easy review for me a this point.

=end