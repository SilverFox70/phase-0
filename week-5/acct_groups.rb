# Please find Release 1: Pseudocode down at the bottom of this file

# Author: William F Brinkert
# Date: October 27, 2015

##
# This is a logging method which takes any number of
# arguments and then, for each argument assesses 
# whether it is an array or a single object and then
# puts the object(s) out to the console.  This is not
# a functional part of the solution, but rather a 
# helpful debugging type tool
def e_log(*args)
  args.each do |item|
  	if item.is_a?(Array)
  	then item.each {|e| puts "e-log #{e}"} 
    else puts "e-log : #{item}"
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
  group_array = []
  for i in 0..num_of_groups - 1
  	index = i
  	group_max = 1
  	name_array = []
  	while index < student_roster.length
      name_array.push(student_roster[index])
      index += divisor
      group_max += 1
      if group_max > divisor
      	break
      end
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

##
# Given a set of group names as an array and groups of data
# which are also an array, it will merge the two into a hash
# where the KEYs are the group_names and VALUEs are the groups
# of data.
def create_group_hash(group_names, groups)
  group_hash = Hash.new
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
	final_list.shuffle!
end

##
# Given the raw data of a student list as captured off of the Canvas
# website, this method call other methods which extract the student
# names, shuffle their order, determine an optimal group size
# place students into named groups and then return a hash where the
# KEYs are the group names and the VALUEs are arrays containing a
# list of students in that group.
def create_accountability_groups(raw_student_list)
  student_roster = extract_names(raw_student_list)
  number_of_students = student_roster.length
  divisor = find_optimal_divisor(number_of_students)
  num_of_groups = group_count(number_of_students, divisor)
  group_names = get_group_names(num_of_groups)
  groups = build_groups(num_of_groups, student_roster, divisor)
  accountability_groups = create_group_hash(group_names, groups)
end

##
# A convenience method for displaying the various groups and their
# members on the screen
def display_accountability_groups(accountability_groups)
	accountability_groups.each {|k, v| puts "#{k} : #{v}"}
end

##
# Returns a list of all files in the directory specified by filepath
def get_file_list(filepath)
  Dir.entries(filepath)
end 

##
# Will display all files within the directory specified by filepath
def display_file_list(filepath)
  get_file_list(filepath).each {|entry| puts entry}	
end

##
# Takes a hash as an argument and stores that hash in a .txt file
def save_file(acct_groups)
  f = File.new("data_files/group_assignment.txt", "r+") 
  	acct_groups.each {|k, v| puts f.write("#{k} : #{v} \n")}
  f.close
  puts "File successfully saved."
end


filepath = "data_files"
filename = "tester.txt"
thisfile = filepath << "/" << filename

raw_string = File.read(thisfile)

my_groups = create_accountability_groups(raw_string)
display_accountability_groups(my_groups)
display_file_list("data_files")
save_file(my_groups)


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
