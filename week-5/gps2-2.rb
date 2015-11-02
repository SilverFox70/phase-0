# PSEUDOCODE:
# -----------

# create_list
# - Initialize a NEW container.
# - A hash is better than an array because it will allow out grocery items to have attributes.

# list_item = {"apple" => 5}
# list_item = {"apple" => {qty: 5, purchased: false, category: "fruit"}}

# list_items["apple"].qty
# list_items["apple"].category
# list_item["apple"].purchased = true

# This is basically the same thing as a single instance class.
# list_item = {"apple" => {qty: 5, purchased: false, category: "fruit"}}


# Its best practice to initialize your containers empty.
# Its very easy for a computer to then immediately add items to the list.


# my_list = {}
# vs
# my_list = create_list

# Using a method will allow for better maintaince.


# add_item
# remove_item
# def add_multiple_items(items_array)
#   items_array.each do |current_item|
#     add_item(current_item)
#     # add_multiple_items doesnt care how add_item works as long as the expected input and output never change.
#   end
# end

# update_qty
# display_list


# For each method..
# 1. What is the expected input?
# - The input can be nothing

# 2. What is the expected output?
# - The output can be nothing, or updating something, it does not always need to be a print or return.

# 3. What are the steps to turn the input into the output?

# STEP 3 should be 90% of the pseudocode!


# create_list
# input: nothing
# output: an empty container (hash)

# 1. create "grocery_list" as empty hash 
# 2. return "grocery_list"



# add_item
# input: "item_name" as a string and a "item_qty" as an integer.
# output: update grocery_list with new item.

# 1. Add the new item to "grocery_list", where "item_name" is the key and "item_qty" is the value.


# remove_item
# input: "item_name" as a string
# output: the "grocery_list" with "item_name" and its corresponding value pair removed 

# 1. remove the item (key and value) from  "grocery_list", where "item_name" is the key. 


# update_qty
# input: "item_name" as string and "item_qty" as an integer
# output: update the "item_qty" for the given "item_name"

# 1. Find the item in "grocery_list" by "item_name"
# 2. IF the item exists replace the existing qty with the new qty.
# 3. ELSE, raise error telling the user "That item does not exist".




# display_list
# input: the "grocery_list"
# output: display "grocery_list" on screen

# 1. Iterate through "grocery_list" printing to the screen all key/value pairs in a readable format




# INITIAL CODE:
# -------------

def create_list
	$grocery_list = {}
end

def add_item(item_name, item_qty)
  if $grocery_list.include?(item_name)
    # increase the value for that item
    $grocery_list[item_name] += item_qty
  else
    # Create a new key value pair for that item
    $grocery_list[item_name] = item_qty
  end
end

def remove_item(item_name)
  if $grocery_list.include?(item_name)
    $grocery_list.delete(item_name)
  else
    raise_error("That item does not exist")
  end
end

def update_qty(item_name, new_qty)
  if $grocery_list.include?(item_name)
    $grocery_list[item_name] = new_qty
  else
    raise_error("That item does not exist")
  end
end
 
def display_list
  if $grocery_list.empty?
    puts "The list is empty: nothing to display" 
  else
  	puts "-----------------------------"
  	puts "Item \t \t:\t Qty   "
  	$grocery_list.each do | item, qty |
  		puts "#{item} \t \t:\t #{qty}"
  	end
  	puts "-----------------------------"
  end
end

def raise_error(error_msg)
  raise ArgumentError.new(error_msg)
end



# REFACTORED CODE:
# ----------------
# I think that in many ways, because of the pseudocode, I was refactoring
# certain elements of the program as I went along.  Looking back at all of
# the code, my primary inclination would be to create a Class for Grocery_List
# In the absence of a class, I think the code is straight forward, readable
# and would not benefit much from the addition of "fancy" methods.



# DRIVER CODE:
# ------------

# DRIVER CODE IS NOT TEST CODE
# Test code is testing the return value of a method and telling you true or false is matches expected.
# Driver code is seeing the methods actual behavior run. i.e. print to the screen whatever.


$grocery_list = create_list
display_list
# => {}

add_item("Apples", 6)
display_list
# => {"apples" => 6}

add_item("Banana", 12)
display_list
# => {"apples" => 6, "Banana" => 12}

add_item("Cereal", 2)
display_list
# => {"apples" => 6, "Banana" => 12, "Cereal" => 2}

add_item("Apples", 2)
display_list
# => {"apples" => 8, "Banana" => 12, "Cereal" => 2}

update_qty("Banana", 8)
display_list
# => {"apples" => 8, "Banana" => 8, "Cereal" => 2}





