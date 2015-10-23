# Leap Years

# I worked on this challenge [by myself].


# Your Solution Below
def leap_year?(year)
	div_by_4 = true if year % 4 == 0
	div_by_100 = true if year % 100 == 0
	div_by_400 = true if year % 400 == 0
	if (div_by_4 && !div_by_100) || (div_by_4 && div_by_100 && div_by_400)
		return true
	else return false
	end
end
