# Your Names
# 1)
# 2)

# We spent [#] hours on this challenge.

# Bakery Serving Size portion calculator.
##
# Calculates the number of item_to_make possible
# with the given ingredients_available and how many left 
# over units, if any
def quantity_possible(item_to_make, ingredients_available)
  # initialize values: food_units_needed defines how many baking
  # units needed for each item (key). Initialize variable
  # error_counter at 3
  food_units_needed = {"cookie" => 1, "cake" =>  5, "pie" => 7}

  # Check to see if the item_to_make exists in the food_units_needed
  fail ArgumentError, "#{item_to_make} is not a valid input" unless food_units_needed.include?(item_to_make)

  # store the number of baking units needed in baking_units_needed
  baking_units_needed = food_units_needed[item_to_make]
  # find the number of baking units left over after making item
  leftovers = ingredients_available % baking_units_needed
  qty_possible = ingredients_available/baking_units_needed

  baking_report =  "Calculations complete: Make #{qty_possible} of #{item_to_make}"
  leftover_plan =  ", you have #{leftovers} leftover ingredients. Suggested baking items:" 

  if leftovers > 4
    num_of_cakes = leftovers / 5
    leftover_plan << " #{num_of_cakes} cakes "
    num_of_cookies = leftovers % 5
    leftover_plan << " #{num_of_cookies} cookies " unless num_of_cookies.zero?
  else
    leftover_plan << " #{leftovers} cookies"
  end

  leftovers.zero? ? baking_report : baking_report + leftover_plan
end

#p quantity_possible("cookie", 3)
p quantity_possible("pie", 19)
#p quantity_possible("cake", 5)
# p quantity_possible("cake", 7)
# p quantity_possible("cookie", 1)
# p quantity_possible("cookie", 10)
# p quantity_possible("THIS IS AN ERROR", 5)


# Pseudocode for new feature

# Add a feature which suggests set of items to bake based upon the availability
# of leftover ingredients.  

# INPUT: the number of leftover ingredients 
# OUTPUT: a hash listing the suggested quantities of each item to make 

# Steps
# 1 


#  Reflection
What did you learn about making code readable by working on this challenge?
  
  Oh , plenty!  Choices of variable and method names is very important and should
  reflect something meaningful and understandable. Use the appropriate tools for
  the job, such as choosing the correct methods to implement.  Finally, write Your
  ruby code to be so clear and readable that you almost don't need comments, but 
  do comment items where the code might be unclear or the reasoning behind the code
  might be abstruse.  

Did you learn any new methods? What did you learn about them?

  I can't say that I learned any new methods, but I was reminded to always be thinking
  of the possibilities - is there a simpler or more clear way to do something?

What did you learn about accessing data in hashes? 

  I already knew that if you iterate through a hash passing only a single variable
  to the block, that variable will represent the full key/value pair, but this was
  a good reminder of that.

What concepts were solidified when working through this challenge?

  This was a great exercise in interpreting code, thinking through variable names and
  their importance, and thinking about structure and purpose.  Be only as felxible as you
  need to be, be DRY, and make your program read as much like English as possible so
  that it is very clear and readable.