 // Design Basic Game Solo Challenge

// This is a solo challenge

// Your mission description: Sink all of your enemies ships before they sink yours!
// Overall mission:
// Goals: Find enemy ships on the grid and sink them before the computer finds and
//        sinks all of your ships
// Characters: You will have a number of ships positioned on a grid; the computer
//             playing as the enemey will have the same
// Objects: Computer Players (CP) grid; players grid
//          CP collection of ships; your collection of ships
// Functions: attack a square
//            determine if there was a hit and report it
//            update grids to show hits and misses
//            get user input
//            check to see if a ship is sunk
//            check to see if anyone has won
// Pseudocode
// Create "fleet" objects
//    Each fleet consists of ships with a size and a health (same number) 
//       :battleship 5
//       :destroyer  4
//       :cruiser    3
//       :submarine  2
// Randomly fill two grids with "ships"
//    1. Starting with the battleship, randomly place ship in grid
//       a. grid is an array of arrays
//       b. all spaces initialized as "w" for water/meaning empty
//       c. randomly generate two numbers for the starting position of the ship
//       d. check if the ship can fit horizontally or vertically without going
//          out of bounds of the array grid
//       e. (for additional ships) check that ship will not intersect a ship
//          already placed in the array grid
//       f. place the ship by changing the array values to "B" for example, to 
//       g. indicate the ship type
//       h. iterate through fleet until all ships have been succesfully placed
//          by returning to "c."
// Display grids (with update)
//    1. Call a function to display an empty enemy grid and your own filled grid
//       a. iterate through enemy array grid; on initial display it will be empty
//          but on subsequent rounds it will display an "X" for where you have made
//          a hit and an "O" for where you missed.
//    2. Call the above function but with player info so that it will show the locations
//       of your ships as well as hit and miss data
// Get User attack
//  ** Check for valid input!!!
//    1. prompt user for a grid position to attack
//    2. check if that space is occupied by an enemy ship
//       a. IF it is, THEN replace that element in the enemy grid with an "X"
//       b. ELSE place an "O" in that space on the enemy grid
//    3. check if ship is sunk
//       a. IF yes, let the user know, ELSE continue as normal
//          i. if YES THEN check if all ship have been sunk. If true, you win!
//             unless of course it is all of your ships that have been sunk
// Get computer attack
//    1. generate two random numbers 
//    2. check the element in the grid at the above location
//       a. check through the same steps in Get User Attack to update the player's
//          board and to see if the computer won.
//

// Initial Code
GRID_SIZE = 9;
TOP_LABEL = [" ",1,2,3,4,5,6,7,8];
SIDE_LABEL = [' ', 'A','B','C','D','E','F','G','H'];
SPACER = "    ";

function posXY(){
	var pos_x = Math.floor(Math.random() * 9);
	var pos_y = Math.floor(Math.random() * 9);
	return [pos_x, pos_y];
}

function Fleet() {
	this.battleship = { size: 5, health: 5};
	this.destroyer = { size: 4, health: 4};
	this.cruiser = { size: 3, health: 3};
	this.submarine = { size: 2, health: 2};
	this.isHit = function(ship) {
		ship.health -= 1;
		return ship.health;
	}
}

function createArray(size) {
	arr = new Array(size);
	for (var i = 0; i < size; i++){
		arr[i] = new Array(size);
	}

	return arr;
}

// mainly a debugging tool for diplaying a row at a time
function show_row(arr){
	for (var i = 0; i < arr.length; i++){
		process.stdout.write("i: " + arr[i] + "\t");
	}
	console.log("");
}

function Grid() {
	this.grid = createArray(GRID_SIZE);
	for (var i = 0; i < GRID_SIZE; i++){
		if (i == 0) {
			this.grid[i] = TOP_LABEL;
			continue;
		}
		for (var j = 0; j < GRID_SIZE; j++){
			if (j == 0){
				this.grid[i][j] = SIDE_LABEL[i];
			} else {
			this.grid[i][j] = "w";
			}
		}
	}
	return this.grid;
}

function displayGrid(grid) {
	for (var i = 0; i < GRID_SIZE; i++){
		for (var j = 0; j < GRID_SIZE; j++){
			process.stdout.write(grid[i][j] + SPACER);
		}
		process.stdout.write("\n \n");
	}
}

// Code below is for getting user input from the console.
// var readline = require('readline');
// var rl = readline.createInterface(process.stdin, process.stdout);
// rl.setPrompt("Guess > ");
// rl.prompt();
// rl.on('line', function(line){
// 	if (line === "right") rl.close();
// 	rl.prompt();
// }).on('close', function(){
// 	process.exit(0);
// })

// Driver Code
console.log("Numbers: " + posXY());
var myFleet = new Fleet();
console.log("show health: " + myFleet.battleship.health);
console.log("show hit: " + myFleet.isHit(myFleet.battleship)); 
var enemyFleet = new Fleet();
console.log("show enemy : " + enemyFleet.battleship.health);
grid = new Grid();
displayGrid(grid);



// Refactored Code






// Reflection
//
//
//
//
//
//
//
//