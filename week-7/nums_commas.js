// Separate Numbers with Commas in JavaScript **Pairing Challenge**


// I worked on this challenge with: Bernice and Bill.

// Pseudocode
// input: a number as an integer
// output: number separated with commas as string
/*
1. PLace holder variable ("result") to hold the result
2. convert number to a string
3. go backwards in a loop through string by 3's
  a. insert a comma after 3rd number
  b. store string of numbers and comma in "result"
4. return the result
*/


// Initial Solution
function separateComma(number){
  var result = [];
  var numArray = number.toString().split("").reverse();
  for (var i = 0 ; i < numArray.length; i++){
    if ((i % 3 === 0)&&( i !== 0)){
      result.push(",");
    }
    result.push(numArray[i]);
    console.log(result);
  }
  return result.reverse().join('');
}



// Refactored Solution
// without using regex we couldn't find a better way to do this, which is not
// to say that we didn't try a few other options, but they actually required
// more code.


// Your Own Tests (OPTIONAL)
var numCom = separateComma(1569743456);
console.log(numCom + " == "  + "1,569,743,456");



// Reflection
/*What was it like to approach the problem from the perspective of JavaScript? 
Did you approach the problem differently?

  Knowing that we didn't have all of the built in methods of Ruby we approached
  more from a pure logic, algorithmic perspective.  You have to do a lot more of
  your own footwork when working with JS.

What did you learn about iterating over arrays in JavaScript?

  We could have used the FOR...IN syntax but it was just as easy to use a regular
  old FOR loop to iterate over the array.  Again, Ruby offers some nice, compact
  shortcuts for dealing with arrays that were not available to us in JS.

What was different about solving this problem in JavaScript?

  Like I said above, you really have to break it down into more discreet steps of
  logic and build your own functions to handle the bulk of the work.

What built-in methods did you find to incorporate in your refactored solution?

  If REGEX had been available, we could have done this quite simply using JS
  built in moethods, but without access to that we couldn't find any better methods
  to help us solve the problem.
  
*/