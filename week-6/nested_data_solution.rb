# RELEASE 2: NESTED STRUCTURE GOLF
# Hole 1
# Target element: "FORE"
#  Kevin Corso and William Brinkert

array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]

# attempts: 1
#
p array[1][1][2][0]

#===========================================================



# ============================================================

# Hole 2
# Target element: "congrats!"

hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}

# attempts:2 
#p hash[outer:][inner:]["almost"][3]

p hash[:outer][:inner]["almost"][3]

#============================================================



# ============================================================


# Hole 3
# Target element: "finished"

nested_data = {array: ["array", {hash: "finished"}]}

# attempts: 1
p nested_data[:array][1][:hash]

# ============================================================



# ============================================================

# RELEASE 3: ITERATE OVER NESTED STRUCTURES

number_array = [5, [10, 15], [20,25,30], 35]

number_array.map! do |e|
  if e.kind_of?(Array)
    e.map! {|inner| p inner += 5}
  else p e += 5
  end
end
p number_array

# Bonus:

startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

def recursive_method(array)
  array.map! do |e|
    if e.kind_of?(Array)
      recursive_method(e)
    else e << "ly"
    end
  end
end

recursive_method(startup_names)
p startup_names

# Reflection
=begin

What are some general rules you can apply to nested arrays?
  I'm not sure what this question is really asking, but in general
  you can expect to either have to use many brackets to directly
  access a specific element within a nested array, or if you are
  iterating over them, you will have to use nested iterator structures.


What are some ways you can iterate over nested arrays?
  First, you have to know what it is that you want to retrieve from the 
  nested arrays or what you want to do with the data.  If you know the depth
  of the nesting, you can simply nest your iterative methods to the same extent
  to access each element of all of the arrays.  If you don't know how deeply
  the data structures might be nested you can use recursion to drill down to the
  deepest level.  In either case, you will want to check to see if an element of 
  the parent array is an array itself, or just an element of data.



Did you find any good new methods to implement or did you re-use 
one you were already familiar with? What was it and why did you 
decide that was a good option?
  We decided to use #map! since it seemed like the logical choice for a 
  destructive method.  Now #map! is not new to us, and we didn't spend much 
  time considering other options because #map! seemed perfectly suited to 
  the task at hand.
=end
