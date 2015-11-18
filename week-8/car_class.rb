# Create a Car Class from User Stories


# I worked on this challenge [by myself].

# User Stories
=begin

I want to be able to create a new car and set its model and color so I can customize it in the video game.
	"model" and "color" attributes
I need to be able to define a distance to drive so I can follow directions appropriately.
	"drive_distance" attr
I'd like to be able to see the speed I am traveling, so I can properly accelerate or decelerate.
	"speed" attr plus a method to return the value (or attr reader)
I want to be able to turn left or right so I can navigate a city and follow directions.
	"turn" method, also implies a "direction" attr
I want to be able to accelerate and decelerate the car to a defined speed so I can drive following the rules of the road.
	method for accelarating and decelerating
I want to keep track of the total distance I have travelled, so I can get paid for mileage.
	"total distance" attr, might be linked to a "velocity" and "time" attr
I want to be able to stop the car so I can follow traffic signs and signals.
	special case of decelerate or a state achieved through a method
I would like to see output reflecting the latest action of my car so I can see a play-by-play of the pizza delivery.
	a disply function that reports current stats
=end

# 2. Pseudocode
#    1. Create a class Car
#       a. initialize car with a "model" and "color" (set internal defaults)
#          i. set all other dynamic variables to starting values
#          ii. set "speed" with attribute reader status
#       b. accessor to set distance to travel based on user input
#       c. accessor to check speed
#       d. create method to change direction based on user input
#       e. create method to change speed (use attr writer or creat method?)
#       f. create a method to track distance traveled
#          i. use "speed" and "time" variables to calculate?
#       g. create method to stop car, might be special case of change speed method
#       h. display method
#          i. nicely display all of the car and trip info


# 3. Initial Solution
class Car
	
	def initialize(model = "Honda Civic", color = "Gray")
		@model = model
		@color = color
		@speed = 0
		@set_distance = 0
		@total_distance = 0
		@direction = "straight"
	end

	def drive(miles)
		@set_distance = miles
		@total_distance += miles
	end

	def turn(direction)
		@direction = direction
		p "You just turned #{@direction}"
	end

	def check_speed
		p "Speed = #{@speed} mph"
	end

	def set_speed(value)
		@speed = value
		display_car_state
	end

	def distance_traveled
		@total_distance
	end

	def stop_car
		@speed = 0
		display_car_state
	end

	def display_car_state
		if @speed.zero?
		  puts "You are currently stopped.  So far you have traveled #{@total_distance} miles."
		else puts "You're going #{@speed} mph and have traveled #{@total_distance} miles."
		end
	end
end


# Driver Code








# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
my_car = Car.new("Ford Mustang", "Red")
my_car.drive(0.25)
my_car.set_speed(25)
my_car.stop_car
my_car.turn("right")
my_car.drive(1.5)
my_car.set_speed(35)
my_car.check_speed
my_car.set_speed(15)
my_car.drive(0.25)
my_car.stop_car
my_car.turn("left")
my_car.drive(1.4)
my_car.stop_car
my_car.display_car_state





# 5. Reflection