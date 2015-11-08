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

  # store the number of baking units needed in serving_size
  serving_size = food_units_needed[item_to_make]
  # find the number of baking units left over after making item
  leftovers = ingredients_available % serving_size

  baking_report =  "Calculations complete: Make #{ingredients_available/serving_size} of #{item_to_make}"
  
  leftover_plan =  ", you have #{leftovers} leftover ingredients. Suggested baking items: TODO: MAKE THIS FEATURE" 
  leftovers.zero? ? baking_report : baking_report + leftover_plan
end

#p quantity_possible("cookie", 3)
p quantity_possible("pie", 8)
#p quantity_possible("cake", 5)
# p quantity_possible("cake", 7)
# p quantity_possible("cookie", 1)
# p quantity_possible("cookie", 10)
# p quantity_possible("THIS IS AN ERROR", 5)

#  Reflection

# NOT complete: will turn in the added feature on Sunday.