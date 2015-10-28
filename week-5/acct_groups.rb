# Please find Release 1: Pseudocode down at the bottom of this file

# Author: William F Brinkert
# Date: October 27, 2015

def e_log(*args)
  args.each do |item|
  	if item.is_a?(Array)
  	then item.each {|e| puts "e-log #{e}"} 
    else puts "e-log #{item}"
    end
  end
  puts "-----------------------------------"
end


## 
# Takes the argument num_of_students as an integer
# and first checks to see if that number is perfectly
# divisable by either 4 or 5.  If it is, it returns 
# that number, otherwise it checks to see which divisor
# will leave the greatest remainder and it returns that
# value                                                          
def find_optimal_divisor(num_of_students)
  case num_of_students
  when num_of_students % 5 == 0	
  	return 5
  when num_of_students % 4 == 0
  	return 4
  end

  if (num_of_students % 5) > (num_of_students % 4)
  	return 5
  else return 4
  end
end

##
# Takes an integer argument for number of students and
# the divisor and return the number of groups that can
# be made.  If the number of students is divisable by
# the divisor without a remainder, it returns said division,
# otherwise it adds one to the number of groups to handle
# the remaining students
def group_count(num_of_students, divisor)
  num_of_students % divisor == 0 ? num_of_students / divisor : (num_of_students / divisor) + 1
end

##
# Given an integer number of groups, an array of students 
# and a divisor this method will return an array of arrays 
# in which the inner array contains the names of the students 
# in each group.
def build_groups(num_of_groups, student_roster, divisor)
  # e_log("Inside build_groups", num_of_groups, student_roster, divisor)
  group_array = []
  for i in 0..num_of_groups - 1
  	index = i
  	name_array = []
  	while index < student_roster.length
      name_array.push(student_roster[index])
      index += divisor
      # e_log("name_array #{name_array}", "index #{index}")
    end
    group_array[i] = name_array
  end
  group_array
end

##
# Creates group names for the number of groups passed to it
# as an integer
def get_group_names(num_of_groups)
  g_names = []
  for i in 1..num_of_groups
    g_names.push("Group #{i}")
  end
  g_names
end

def create_group_hash(group_names, groups)
  group_hash = Hash.new
  e_log("INSIDE OF CREATE_GROUP_HASH -------------------", group_names,groups)
  for i in 0..group_names.length-1
    group_hash[group_names[i]] = groups[i]
  end
  group_hash
end

##
# This is a very situationally specific method which is designed
# to take a ctrl-c copy of the student roster from the canvas
# website and parse it down into a list of just names by removing
# all of the whitespace and junk we don't need, like cohort name
# and student/ TA information.
def extract_names(str)
	list = str.split(/\n/)
	list = list.reject {|e| e == "\t"}
	list.map {|e| e.strip!}
	final_list = []
	list.each_slice(4) {|a| final_list << a[0]}
	final_list
end

def create_accountability_groups(raw_student_list)
  student_roster = extract_names(raw_student_list)
  # e_log(student_roster)
  number_of_students = student_roster.length
  # e_log("number_of_students", number_of_students)
  divisor = find_optimal_divisor(number_of_students)
  # e_log("divisor", divisor)
  num_of_groups = group_count(number_of_students, divisor)
  # e_log("number of groups", num_of_groups)
  group_names = get_group_names(num_of_groups)
  groups = build_groups(num_of_groups, student_roster, divisor)
  e_log("GROUPS", groups)
  accountability_groups = create_group_hash(group_names, groups)
  accountability_groups
end

def display_accountability_groups(accountability_groups)
	accountability_groups.each {|k, v| puts "#{k} : #{v}"}
end

filename = "tester.txt"

raw_string = File.read(filename)

my_groups = create_accountability_groups(raw_string)
display_accountability_groups(my_groups)

=begin
Pseudocoding 5.6 Creating Accountability Groups

What does the MVP look like?
The program/method should take in a list of names (?in what format)
and then return the names once they have been “assigned” to different
accountability groups. The format of the returned data will be a hash
where the KEYs are the group names and the VALUES are arrays of strings 
of the student's names. The method will also output this hash to the 
screen for viewing.

Starting assumptions:
Let's assume that we pass a list of all students to the program as an array.

Input: an array of student names

Output: a hash of KEYs representing each Accountability group created 
with VALUEs that are an array of the names of students within that group.

Logic:
Check the length of the array of names (student_roster) to see if it is 
more optimal to divide folks into groups of 4 or 5.

We should check that we have at least 3 folks in each group by dividing 
the number of names in the array by 5 and finding the remainder. If the 
remainder is zero, we are good to go. Then we compare that to the remainder 
if we divide the total number of names by 4. Whichever divisor gives us the 
largest remainder we use and assign to the variable DIVISOR

method optimal_divisor
divisor = 4
IF student_roster % divisor = 0
THEN skip other logic checks in this section
ELSE IF student_roster % 5 = 0
THEN divisor = 5 and skip other logic checks in this section
IF student_roster % 5 > student_roster % 4
THEN divisor = 5
return divisor


num_of_groups = divisor + 1 unless student_roster % divisor = 0
Next, we shuffle the order of names.

group_name = method get_group_names(num_of_groups)


get_group_names(num_of_groups)
FOR i 1 to num_of_groups times
add to group_name_array “Group “ + I
return group_name_array

Avoiding the use of internal methods for our initial solution, we iterate 
over student_roster taking every nth name (n = divisor) and copy it to our hash.

FOR i 0 to number of groups - 1
index = i
while index < student_roster length
array_names = student_roster[index]
index = index + divisor
group_hash[group_name[i]] = array_names

Our hash is now populated and we RETURN it to the calling method and display 
the new Groups roster on the screen.
=end
