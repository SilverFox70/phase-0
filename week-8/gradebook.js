/*
Gradebook from Names and Scores
I worked on this challenge with Nicola Beuscher.
This challenge took me [1] hours.
You will work with the following two variables.  The first, students, holds the names of four students.
The second, scores, holds groups of test scores.  The relative positions of elements within the two
variables match (i.e., 'Joseph' is the first element in students; his scores are the first value in scores.).
Do not alter the students and scores code.
*/

var students = ["Joseph", "Susan", "William", "Elizabeth"]

var scores = [ [80, 70, 70, 100],
               [85, 80, 90, 90],
               [75, 70, 80, 75],
               [100, 90, 95, 85] ]
// __________________________________________
// Write your code below.
/*
var testScores;
var gradebook = {};
for (var name in students) {
  gradebook[students[name]] = {testScores: scores[name]}
};


gradebook.addScore = function(name, score){
  gradebook[name].testScores.push(score)
};

gradebook.getAverage = function(name) {
  return average(gradebook[name].testScores)
};

var average = function(array) {
  var sum = 0;
  for (var i in array) {
    sum += array[i]
  };
  return sum/array.length
};
*/
// __________________________________________
// Refactored Solution
var testScores;
var gradebook = {  
  addScore: function(name, score){
  gradebook[name].testScores.push(score)},
  getAverage: function(name) {
  return average(gradebook[name].testScores)},  
};

for (var name in students) {
  gradebook[students[name]] = {testScores: scores[name]}
};

var average = function(array) {
  return array.reduce( ( prev, curr) => prev + curr) / array.length; 
};

// __________________________________________
/* Reflect
What did you learn about adding functions to objects?
   There are a couple of approaches that you can use to add functions
   to an object.  Of course, you can define them within the constructor,
   or you can add them later using dot notation.  It is possible to
   iterate through an array, or an object, add properties or functions
   to an object.

How did you iterate over nested arrays in JavaScript?
   Although I got some practice with that in Challenge 8.3, we didn't 
   actually have to really dig deep here.  But the concept is simple:
   set a for...in loop to iterate through the outer array, and then 
   inside of that use another for...in loop to iterate through the
   inner array.  You could create a recursive method to "drill" all the
   way down to the innermost array in situations where you are unclear
   on how deep the nesting goes.  One thing of note is that you need
   to check to make sure that the object has it's own property of the
   type that you are iterating through in order to avoid iterating over
   properties that might be a part of that object's prototype.  But that
   applies to object, not arrays.

Were there any new methods you were able to incorporate? If so, what were 
they and how did they work?
   We found the "reduce" method, but it took us a while to get it to
   function properly.  It was interesting, because most of the code examples
   that we tried to cut and paste to test out reduce didn't work at all
   until we stumbled upon one form, that looks a little bit like Ruby, that
   DID work.
*/

// __________________________________________
// Test Code:  Do not alter code below this line.


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}



assert(
  (gradebook instanceof Object),
  "The value of gradebook should be an Object.\n",
  "1. "
)

assert(
  (gradebook["Elizabeth"] instanceof Object),
  "gradebook's Elizabeth property should be an object.",
  "2. "
)

assert(
  (gradebook.William.testScores === scores[2]),
  "William's testScores should equal the third element in scores.",
  "3. "
)

assert(
  (gradebook.addScore instanceof Function),
  "The value of gradebook's addScore property should be a Function.",
  "4. "
)

gradebook.addScore("Susan", 80)


assert(
  (gradebook.Susan.testScores.length === 5
   && gradebook.Susan.testScores[4] === 80),
  "Susan's testScores should have a new score of 80 added to the end.",
  "5. "
)

assert(
  (gradebook.getAverage instanceof Function),
  "The value of gradebook's getAverage property should be a Function.",
  "6. "
)

assert(
  (average instanceof Function),
  "The value of average should be a Function.\n",
  "7. "
)
assert(
  average([1, 2, 3]) === 2,
  "average should return the average of the elements in the array argument.\n",
  "8. "
)

assert(
  (gradebook.getAverage("Joseph") === 80),
  "gradebook's getAverage should return 80 if passed 'Joseph'.",
  "9. "
)