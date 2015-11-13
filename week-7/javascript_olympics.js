 // JavaScript Olympics

// I paired [with: Abe Clark] on this challenge.

// This challenge took me [1.0] hours.


// Warm Up




// Bulk Up
var athlete_array = [['Sarah Hughes', 'Ladies Singles'],
                 [ 'John Smith', 'Shuffleboard'],
                 [ 'Carla Hayes', 'Shotput']];

var add_property_win = function() {
  for ( var i = 0 ; i < athlete_array.length; i++){
    athlete_array[i].push(win);
    athlete_array[i][2](athlete_array[i][0], athlete_array[i][1]);
  }
  
};


var win = function(name, event) {
  
  console.log(name + " won the " + event);
  
};

add_property_win();


// Jumble your words
function reverseStr(str) {
  return str.split("").reverse().join('');
};

var str = "Hello world!";
var newstr = reverseStr(str);
console.log(str + " " + newstr);

// 2,4,6,8

function isEven(number) {
  return (number % 2 === 0 || number === 0) 
};

var number_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

var new_number_array = number_array.filter(isEven);
console.log(new_number_array);


// "We built this city"
function Athlete(name, age, sport, quote) {
  this.name = name,
  this.age = age,
  this.sport = sport,
  this.quote = quote
}

var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!")
console.log(michaelPhelps.constructor === Athlete)
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote)



// Reflection
// What JavaScript knowledge did you solidify in this challenge?

//   We had a great moment in understanding how to include and use functions as variables
//   passed to other objects.  Also solidified our understanding of creating constructors.


// What are constructor functions?

//   Constructor functions builds object instances in JS.  Unlike some other OOPs, JS does not
//   have classes, just objects.  Constructors therefore act like the blueprint for making
//   objects in JS just like classes are the blueprint for objects in Ruby, Java, and C#.  This
//   means you can't have true classes methods or class variable, although you can use 
//   'prototype' to add that sort of functionality to your JS objects.

// How are constructors different from Ruby classes (in your research)?

//   Constructors are essentially like the initialization methods inside Ruby classes.  A Ruby 
//   class can have variables and methods outside of its initialization method, but in JS everything
//   must be in the constructors.  You can some classlike functionality by using the word prototype and
//   assigning functions to the prototype of your object.  For example, if you create a Bicycle constructor
//   but you wanted to have a method that was common to all Bicycle's, but not recreated every time
//   the constructor was called, you could declare Bicycle.prototype.myFunction.  myFunction would be available
//   to instances of Bicycle, but not recreated in every instance of that object.


