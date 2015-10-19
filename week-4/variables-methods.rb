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