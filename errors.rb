# Analyze the Errors

# I worked on this challenge [by myself].
# I spent [#] hours on this challenge.

# --- error -------------------------------------------------------

cartmans_phrase = "Screw you guys " + "I'm going home." 

# This error was analyzed in the README file.
# --- error -------------------------------------------------------

=begin
def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
  end  
end
=end

# This is a tricky error. The line number may throw you off.

# 1. What is the name of the file with the error?
#     The file name is errors.rb
# 2. What is the line number where the error occurs?
#     It says that the error occurs on line 170
# 3. What is the type of error message?
#     syntax-error
# 4. What additional information does the interpreter provide about this type of error?
#     unexpected end-of-input, expecting keyword_end
# 5. Where is the error in the code?
#     The way the code is indented you get the impression that the method has been closed
#     using the keyword 'end'.  In reality, the while statement has not been closed, so we
#     need to add an end for that and insert it between lines 15 and 16. Another problem
#     is that the while loop will never end because its condition is set to true.
# 6. Why did the interpreter give you this error?
#

# --- error -------------------------------------------------------

south_park = 5

# 1. What is the line number where the error occurs?
#     It occurs on line 41
# 2. What is the type of error message?
#     Undefined local variable or method
# 3. What additional information does the interpreter provide about this type of error?
#     Object (NameError)
# 4. Where is the error in the code?
#     Local variable must be assigned a value when created.
# 5. Why did the interpreter give you this error?
#     There was no value assigned to this variable

# --- error -------------------------------------------------------

# cartman()

# 1. What is the line number where the error occurs?
#     It happens on line 56
# 2. What is the type of error message?
#     undefined method `cartman'
# 3. What additional information does the interpreter provide about this type of error?
#     Object (NoMethodError)
# 4. Where is the error in the code?
#     The method 'cartman() has not been defined anywhere
# 5. Why did the interpreter give you this error?
#     Methods need to be defined before they are called

# --- error -------------------------------------------------------

def cartmans_phrase
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase()

# 1. What is the line number where the error occurs?
#     The error occurs on line 75
# 2. What is the type of error message?
#     wrong number of arguments (1 for 0)
# 3. What additional information does the interpreter provide about this type of error?
#     (ArgumentError) from errors.rb:75
# 4. Where is the error in the code?
#     cartmans_phrase should be called without any arguments
# 5. Why did the interpreter give you this error?
#     We attempted to pass an argument to a method which does not accept arguments

# --- error -------------------------------------------------------

def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says("You guys $&$^*!")

# 1. What is the line number where the error occurs?
#     On line 94
# 2. What is the type of error message?
#     wrong number of arguments (0 for 1)
# 3. What additional information does the interpreter provide about this type of error?
#     (ArgumentError)from errors.rb:94
# 4. Where is the error in the code?
#     There is no argument present in the call to the method on line 94
# 5. Why did the interpreter give you this error?
#     The method requires that we pass it exactly one argument



# --- error -------------------------------------------------------

def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!', 'Kyle')

# 1. What is the line number where the error occurs?
#     On line 111
# 2. What is the type of error message?
#     wrong number of arguments (1 for 2)
# 3. What additional information does the interpreter provide about this type of error?
#     (ArgumentError)from errors.rb:115
# 4. Where is the error in the code?
#     On line 115 where we attempt to make a call to the method without enough arguments
# 5. Why did the interpreter give you this error?
#     The number of arguments passed to a method must match the number of args the method 
#     is looking for.  There is a way around this using '*' in the args list.  For example:
#     method_name(*args) would allow you to pass at least one but as many args as you want
#     to the method.  Even better: method_name(arg1=:some_value, *args) allows you pass
#     zero up to as many args as you want, with at least one arg having a default value.

# --- error -------------------------------------------------------

"Respect my authoritay!" * 5

# 1. What is the line number where the error occurs?
#     On line 134
# 2. What is the type of error message?
#     String can't be coerced into Fixnum
# 3. What additional information does the interpreter provide about this type of error?
#     (TypeError)from errors.rb:134:in `<main>'
# 4. Where is the error in the code?
#     On line 134, a number cannot precede a string like this
# 5. Why did the interpreter give you this error?
#     If you wish to print out a string a number of times, the string must come first, followed 
#     by the number.  

# --- error -------------------------------------------------------

amount_of_kfc_left = 20/20


# 1. What is the line number where the error occurs?
#     On line 150
# 2. What is the type of error message?
#     divided by 0
# 3. What additional information does the interpreter provide about this type of error?
#     (ZeroDivisionError)from errors.rb:150:in `<main>'
# 4. Where is the error in the code?
#     Right there on line 150, where we attempted to divide anything by zero.
# 5. Why did the interpreter give you this error?
#     It doesn't make any mathematical sense to divide anything by zero.  It is an undefined
#     number/concept.

# --- error -------------------------------------------------------

# require_relative "cartmans_essay.md"

# 1. What is the line number where the error occurs?
#     On line 167
# 2. What is the type of error message?
#     `require_relative': cannot load such file
# 3. What additional information does the interpreter provide about this type of error?
#     /Users/WFB/phase0/phase-0/cartmans_essay.md (LoadError)
# 4. Where is the error in the code?
#     There is no such file in the path it is looking in
# 5. Why did the interpreter give you this error?
#     The file could not be found.


# --- REFLECTION -------------------------------------------------------
# Write your reflection below as a comment.

=begin
Which error was the most difficult to read?

All of these errors were very straight forward to read an understand.

How did you figure out what the issue with the error was?

In the case of these errors, I could tell very easily by looking at the code what was going on
and where the actual error was in the syntax.

Were you able to determine why each error message happened based on the code? 

Yes, again, these were simple errors.  Maybe the trickiest was the missing key word 'end',
because that error almost blended in perfectly.  It was also stacked with an infinite loop,
which while not technically pu tof the error, could have caused some problems.

When you encounter errors in your future code, what process will you follow to help you debug?

It is helpful to note if there are two different line numbers as sometimes the error call be in 
the call to a method, or in the method itself.  Read what the error message is, and if it 
doesn't make sense after reviewing the code, I'll try looking it up online.

=end
