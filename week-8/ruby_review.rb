# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
#    On line 13 we call the method "assert" with the block of code
#    { name == "bettysue"}. This begins executing the assert method
#    on line 8.  Line 9 will raise an error UNLESS the block of code
#    returns TRUE.  Since it is true, we get no error message
#    On line 14 we again call the method assert with a new block
#    of code, but this time when we get to line 9 and YIELD invokes
#    our block, the return value is false, and therefore we get the
#    error message:

#      ruby_review.rb:9:in `assert': Assertion failed! (RuntimeError)
# 	   from ruby_review.rb:14:in `<main>'


# 3. Copy your selected challenge here




# 4. Convert your driver test code from that challenge into Assert Statements





# 5. Reflection