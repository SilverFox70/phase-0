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
// function separateComma(number){
//   var result = [];
//   var numArray = number.toString().split("").reverse();
//   for (var i = 0 ; i < numArray.length; i++){
//     if ((i % 3 === 0)&&( i !== 0)){
//       result.push(",");
//     }
//     result.push(numArray[i]);
//     console.log(result);
//   }
//   return result.reverse().join('');
// }



// Refactored Solution



// Your Own Tests (OPTIONAL)
var numCom = separateComma(1569743456);
console.log(numCom + " == "  + "1,569,743,456");



// Reflection