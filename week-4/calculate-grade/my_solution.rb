# Calculate a Grade

# I worked on this challenge [with Clinton Weber].


# Your Solution Below
def get_grade(val)
	case val
		when 0..59
		 'F'
		when 60..69
		 'D'
		when 70..79
		 'C'
		when 80..89
		 'B'
		when 90..100
		 'A'
	end
end