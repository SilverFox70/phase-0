# Research Methods

# I spent [] hours on this challenge.

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

# Person 1's solution: Chris Gomes
def my_array_finding_method(source, thing_to_find)
  result = [] # result is the output array
  source.each do |word|
    word_array = word.to_s.split(//) # This creates an array of charaters of 'word'
    if word_array.include?(thing_to_find)
      result.push(word)
    end
  end
  return result
end

def my_hash_finding_method(source, thing_to_find)
  result = [] # result is the output array
  source.each do |key, value|
    if value == thing_to_find
      result.push(key)
    end
  end
  return result
end

# Identify and describe the Ruby method(s) you implemented.
=begin
For the first method my_array_finding_method(source, thing_to_find),
I used .each to iterate over the words in the array 'source'.
For each string 'word' in 'source', I had to use .to_s to make 'word' into a string
since the types of the words in source are not determined. Once 'word' is a string, then
we can apply the string method .split(//), which takes the string and returns an array whose 
elements are the letter of the string. Finally, I apply the array-method .include?('thing_to_find')
to determine if 'thing_to_find' is an element of the array.
After checking each word, we returned the array 'result'.
For the second method my_hash_finding_method(source, thing_to_find),
I used .each to iterate over the pairs {key, value} in the hash 'source'.
For each value, I checked if 'value' equaled 'thing_to_find'.
If true, then I pushed 'key' onto the array 'result.
After checking each value, we returned the array 'result'.
=end


# Person 2
def my_array_modification_method!(array, increase)
  array.map! do |x| 
    if x.is_a? Integer
      x += increase
    else 
      x
    end
  end
end



def my_hash_modification_method!(hash, years)
  hash.each {|name, age| hash[name] = age + years}
end
# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 3 - William Binkert
def my_array_sorting_method(source) 
  # sorted = source.dup
  sorted_array = source.sort {|a, b| a.to_s <=> b.to_s}
end

def my_hash_sorting_method(source)
   sorted_hash = source.sort_by {|name, age| age}
end

def my_better_hash_sorting_method(source)
   sorted_hash = source.sort_by {|name, age| age}
end

# Identify and describe the Ruby method(s) you implemented.
# For the array:
# I used the Enumerables method #sort to return an 
# array of values sorted by alphabet.  I needed to add the
# block after sort to avoid comparing Fixnum to String.
# By converting all elements to string before comparing
# the sort method is able to work properly
# For the hash:
# Since we need to sort by age I used the #sort_by method
# so that I could identify which (the key or the value) 
# was to be used to sort the data.  


# Person 4
def my_array_deletion_method!(source, thing_to_delete)
  source.reject! {|word| word.to_s.rindex(thing_to_delete) != nil}
  return source
end

def my_hash_deletion_method!(source, thing_to_delete)
  source.reject! {|key| key == thing_to_delete}
  return source
end

# Identify and describe the Ruby method(s) you implemented.
#
#
#


# Person 5
def my_array_splitting_method(source)
  divide = source.sort_by{|x| x.to_s}
    total = divide.find_all{|item| item % 1 == 0 }.count 
    total -= 1
  divide.partition.with_index { |_, index| index <= total }
end

def my_hash_splitting_method(source, age)
  new_hash = source.clone
  new_hash.partition { |_, v| v.to_i <= age}
end

# Identify and describe the Ruby method(s) you implemented.
#.sort_by = sorts the input by a parameter
#.to_s = converts item into a string
#.find_all = searches your parameter under a condition
#.count = counts the number of key&value pairs unless indicated otherwise
#.partition = splits a matrix into groups within itself
#.with_index = includes the index in parameter
#.clone = coppies existing item
#.to_i = converts item to integer

# Release 1: Identify and describe the Ruby method you implemented. Teach your
# accountability group how to use the methods.
=begin
  In order to use my array splitting method one must simply input the name of the array they which to divide into two groups.
  The method is used to divide(partition) the original into two arrays within a clone array. The first array will display integers while the
  second shows strings. This is done by sorting the clone as a single array, then dividing(partioning) them where the strings begin. 
  To reiterate, both of these arrays are contained in a total array. This is a non destructive method, and the
  output is a clone of the original.
  In order to use my has splitting method one inputs the title of a previously created hash and the age by which to sort. The hash 
  is cloned and then partioned from where the value of the key is less than until equal to the age input as an integer. 
=end


# Release 3: Reflect!
# What did you learn about researching and explaining your research to others?
#
#
#
#