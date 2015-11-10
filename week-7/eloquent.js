// Eloquent JavaScript

// Run this file in your terminal using `node my_solution.js`. Make sure it works before moving on!

// Program Structure
// Write your own variable and do something to it.
var number = 10;
number += 5;
console.log(number)

// Chrome console user input
var food = String(prompt("what's your favorite food?"));
alert("Hey, " + food + " is my favorite, too!");
//console.log("Hey, " + food + " is my favorite, too!");

// Complete one of the exercises: Looping a Triangle, FizzBuzz, or Chess Board
var mark = "#"
for (var count = 0; count < 7; count++){
	console.log(mark);
	mark = mark + "#";
}

for (var n = 1; n <= 100; n++){
	var value = "";
	var div_by_3 = (n % 3 == 0)
	var div_by_5 = (n % 5 == 0)
	if ((div_by_3) && (div_by_5)) {
		value = "FizzBuzz"
	} else if (div_by_3) {
		value = "Fizz"
	} else if (div_by_5) {
		value = "Buzz"
	} else value = n;
	
	console.log(value)
}


// Functions

// Complete the `minimum` exercise.
function minimum(a, b){
	if ( a > b){
		return a
	} else return b;
}

console.log(minimum(9, 7));

// the recursion exercise, just for fun!!!
function isEven(num){
	if (num == 0) {
		return true
	}
	if (num == 1) {
		return false
	} else if (num > 1) {
		num -= 2
		return isEven(num)
	}
}

console.log(isEven(51))

// Data Structures: Objects and Arrays
// Create an object called "me" that stores your name, age, 3 favorite foods, and a quirk below.

var me = { name : "William Brinkert",
            age : 44,
 favorite_foods : ["tacos", "quinoa salad", "chili"],
          quirk : "I like stale licorice."    
}

console.log(me)
console.log(me.name)
