# Factorial

# I worked on this challenge [by myself, with: ].


# Your Solution Below
def factorial(number)
  # Your code goes here
  result = 1
  counter = number
  while counter > 0
  	result *= counter
  	counter -= 1
  end
  return result
end



=begin
def factorial(n)
	if n == 0
		return 1
	else
		answer = n * factorial(n-1)
		return answer
	end
end=end


