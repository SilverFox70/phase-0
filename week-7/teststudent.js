
// Release 1: Tests to User Stories (Shawn Spears)

// ------ User Stories ------

// As a user, I want to be able to be able to take two ordered lists of integers, and find the
// sum, mean, and median of each (Three different stories).

// The first list contains 7 integers: 1, 2, 3, 4, 5, 5, and 7. Therefore the length of this list is 7,
// which is odd. If I had to name it, I would call it the odd length list.

// The second list contains 8 integers: 4, 4, 5, 5, 6, 6, 6, and 7. Therefore the length of this list
// is 8, which is even. If I had to name it, I would call it the even length list.

// I want to find the sum, mean, and median of each of these lists separately, so separate functions
// would probably be the best way for me to get the results I want:

// ------ Story 1 ------

// In the sum function, if I inputted either the odd length or even length list of integers, it should 
// return the sum of those integers. 

// ------ Story 2 ------

// In the mean function, if I inputted either the odd length or even length list of integers, it should
// return the average of those integers as a decimal point number.

// ------ Story 3 ------

// In the median function, if I inputted either the odd length or even length list of integers, it should
// return the median of those integers as a decimal point number. 

// (If you've forgotten what the median is, it is simply the middle value in a list of values. For an odd
// numbered list of values, there is an obvious middle as the two other halves apart from the middle value 
// can be separated equally. In an even list, there will be two middle values -- the median will be the 
// average of these values.)

// Release 2: User Stories to Pseudocode (Malia Lehrer)

// Input: An ordered list of integers
//   The tests include two lists:
//   An "odd list" of 7 values [1, 2, 3, 4, 5, 5, 7]
//   And an "even list" of 8 values [4, 4, 5, 5, 6, 6, 6, 7]
// Three fucntions are needed.
// Output function 1: The sum of the list
// Output function 2: The mean of the list
// Output function 3: The median of the list

// Sum function
// Input: An ordered list of integers
// Output: The sum of the list
// Set up a For loop
// Set a variable equal to the length of the list
// Set a counter equal to 0
// Set a sum variable = 0
// While the counter is less than the length of the list,
//   add one to the counter each loop
//   add the value at the counter (array[counter]) to the sum variable
// Return the value of the sum variable

// Mean function -- Decimals are ok!
// Input: An ordered list of integers
// Output: The mean of the list
// Set a variable equal to the length of the list
// Sum all the numbers in the array together, perhaps using the above pseudocode, or a better way if you think of one
// Divide the sum of the array by the length variable
// Return the result of this operation

// Median function
// Input: An ordered list of integers
// Output: The median of the list, which will be the middle number in the odd list and the average of the two middle numbers in the even list
// Set a variable equal to the length of the list
// Set a variable equal to the index divided by 2, rounded down (half)
//If the length is not divisible by 2 (odd)
// Return the value at the index of (half + 1)
//Else
//  Set a variable equal to the value at the index of half and index
//  of (half + 1), divided by 2
//  Return the resulting variable

// Release 3: Psuedocode to Code (Jon Clayton)

// inputs will be:
var oddList = [1, 2, 3, 4, 5, 5, 7] 
var evenList = [4, 4, 5, 5, 6, 6, 6, 7]

//Our functions are:
function Sum(list) {
	for (var length = list.length, counter = 0, total = 0; counter < length; counter++) {
		total += list[counter];
	}
	return total
}

function Mean(list) {
	var length = list.length;
	return Sum(list)/length;
}

function Median(list) {
	var length = list.length;
	var half = Math.floor(length/2);
	if (length % 2 != 0) {
		return list[half+1];
	}
	else {
		var result = (list[half]+list[half+1])/2;
		return result;
	}
}

// Tests
console.log(Sum(oddList));
console.log(Sum(evenList));
console.log(Mean(oddList));
console.log(Mean(evenList));
console.log(Median(oddList)); 
console.log(Median(evenList)); 
// I know these medians aren't coming out right. 
// But we aren't allowed to fix it because we have to accept what comes to us.
// That's half the fun of the telephone game!!!!

// Release 4: Refeactor and Translate to User Stories (Trevor Newcomb)

// inputs will be:
// var oddList = [1, 2, 3, 4, 5, 5, 7]
// var evenList = [4, 4, 5, 5, 6, 6, 6, 7]

// //Our functions are:
// function sum(list) {
//   for (var length = list.length, counter = 0, total = 0; counter < length; counter++) {
//     total += list[counter];
//   }
//   return total
// }

// function mean(list) {
//   var length = list.length;
//   return sum(list)/length;
// }

// function median(list) {
//   var length = list.length;
//   var half = Math.floor(length/2);
//   if (length % 2 != 0) {
//     return list[half+1];
//   }
//   else {
//     var result = (list[half]+list[half+1])/2;
//     return result;
//   }
// }

// Refactor was not really possible since the code was already really clean and concise. Great job on that guys!

// User Stories

// As a user, I want to give you two lists of numbers and I want you to run some tests on them. First, I will want 
// to know the sum of each list. Second, I need to know the mean of these same lists. Lastly, I will need the median 
// of the two lists. I think that's how we were supposed to do the user stories, it seems pretty simplistic. If 
// there's anything more you all should think I should add to this feel free to let me know and I'll fiddle with it!

// Release 5: Putting it all together (Shawn Spears)

// Nice work team! Overall, I believe we did a pretty good job considering the game of telephone is designed to make
// things incredibly unorganized and messy. Looks like we did a pretty good job with avoiding that for the most part!
// I'll outline a list of the tests that our code had to pass, and then explain if our code passed each of them!

// ** Note: Initally our code didn't pass tests 1, 4, and 7, however, Jon did note that he realized that he should have
// named the functions using camelCase syntax, and thus I have added this to Release 4 -- the following tests reflect 
// this change **

// Tests:
// 1. sum instanceof Function -- PASS, as the object named "sum" is a function
// 2. sum(oddLengthArray) === 27 -- PASS, as passing the oddLengthArray through sum returned 27
// 3. sum(evenLengthArray) === 43 -- PASS, as passing the evenLengthArray through sum returned 43
// 4. mean instanceof Function -- PASS, as the object named "mean" is a function
// 5. mean(oddLengthArray) === 3.857142857142857 -- PASS, as passing the oddLengthArray through mean returned 3.857142857142857
// 6. mean(evenLengthArray) === 5.375 -- PASS, as passing the evenLengthArray through mean returned 5.375
// 7. median instanceof Function -- PASS, as the object named "median" is a function
// 8. median(oddLengthArray) === 4 -- FAIL, as passing the oddLengthArray through sum returned 5 instead of 4
// 9. median(evenLengthArray) === 5.5 -- FAIL, as passing the evenLengthArray through sum returned 6 instead of 5.5

// Essentially the only tests our code didn't pass were tests 8 and 9 which indicate that the median function did
// not return the correct medians for either array. Other than that, I feel like we did a fantastic job working
// together as a team, and staying true to the rules of telephone! It's supposed to trip you up a bit, as of course
// normally we would have been able to avoid some miscommunications if the rules allowed for this. Go team!

