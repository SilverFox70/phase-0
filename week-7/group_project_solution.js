// Release 1: Tests to User Stories

/*

As as user, I want to be able to do three things:

(1) I want to be able to take a list of numbers and find their sum.

(2) I want to be able to take a list of numbers and find their mean.

(3) I want to be able to take a list of numbers and find their median.

*/

// Release 2: Pseudocode

/*
 1. create an array for your values
 2. set the array to a variable (for now I'll call it List)

SUM
  1. create a function for sum with List as arguemt
  2. create an empty variable set at index 0 (I'll can it Total)
  3. iterate through List and collapse each integer value onto index zero of Total
  4. run until the full length of List is reached
  5. consol log
  
MEAN
`1. create function for mean with List as argument
 2. either repeat steps 2-4 of SUM, or weave sum into MEAN by changing the argument to contain Total and List
 3. var mean = Total/List.length
 4. consol log
 
MEDIAN
`1. create a function for median with List as an argument
 2. sort list using (a,b)
 3. create variable half
 4. set to a math object with a floor rounder for List length divided by 2
    - var half = Math.floor(list.length/2)
 5. if list.length modululous 2 (the division has no remainder) return list[half]
 6. else move down the array and return list[half-1]+list[half]/2.0
 7. consol log
  

*/

function sum(list){
	var total = 0
	for (var i = 0; i < list.length; i++){
		total += list[i]
	}
	return total;
}

function mean(list) {
	var total = sum(list);
	var mean = total/list.length;
	return mean;
}


// driver code
num_array = [1,2,3,4,5,6,7,8,9];
console.log("total is : " + sum(num_array));
console.log("mean is : " + mean(num_array));
