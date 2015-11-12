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
//       b. all spaces initialized as EMPTY_SPACE for water/meaning empty
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
GRID_SIZE = 9; // size of the playing area
X_AXIS = 0;
Y_AXIS = 1;
TOP_LABEL = [" ",1,2,3,4,5,6,7,8]; // sets labels for top row of grid
SIDE_LABEL = [' ', 'A','B','C','D','E','F','G','H']; // labels for side of grid
SPACER = "    "; // sets the horizontal spacer that makes it look pretty 
VSPCER = "\n \n"; // set the vertical spacer that makes it look pretty
EMPTY_SPACE = " "; // sets the value to be used for empty spaces in the grid

function posXY(){
	var pos_x = Math.floor(Math.random() * 8) + 1;
	var pos_y = Math.floor(Math.random() * 8) + 1;
	return [pos_x, pos_y];
}

function Fleet() {
	this.battleship = { size: 5, health: 5, sym: "B"};
	this.destroyer = { size: 4, health: 4, sym: "D"};
	this.cruiser = { size: 3, health: 3, sym: "C"};
	this.submarine = { size: 2, health: 2, sym: "S"};
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

// debugging tool for displaying all ships in fleet and size values
function showObjectProp(fleet){
	console.log(fleet)
	for (var key in fleet){
		if (fleet.hasOwnProperty(key)){
			if (key != "isHit") console.log(key + " : " + fleet[key].size);
		}
	}
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
			this.grid[i][j] = EMPTY_SPACE;
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
		process.stdout.write(VSPCER);
	}
}

function fitsHorizontal(x, y, size){
	console.log("x : " + x + "\t size : " + size + " space : " + (GRID_SIZE - x) + "   t/f : " + ((GRID_SIZE - x) > size) );
	var doesFit = ((GRID_SIZE - x) > size);
	if (doesFit) {
		for (var i = 0; i < size; i++){
			if (grid[y][x+i] != EMPTY_SPACE) doesFit = false; 
		}
	}
	return doesFit;
}

function fitsVertical(x, y, size){
	console.log("y : " + y + "\t size : " + size + " space : " + (GRID_SIZE - y) + "   t/f : " + ((GRID_SIZE - y) > size) );
	var doesFit = ((GRID_SIZE - y) > size);
	if (doesFit) {
		for (var i = 0; i < size; i++){
			if (grid[y+i][x] != EMPTY_SPACE) doesFit = false; 
		}
	}
	return doesFit;
}

function findValidPosition(shipsize){
	loc = posXY();      // I am cheating by letting these two variables exist beyond
	horizontal = false; // of this method.  Bad practice, but a quick solution ;)
	if (fitsHorizontal(loc[X_AXIS], loc[Y_AXIS],shipsize)) {
		horizontal = true;
		return [loc, horizontal];
	} else if (fitsVertical(loc[X_AXIS], loc[Y_AXIS], shipsize)){
		horizontal = false;
		return [loc, horizontal];
	} else return [false];
}

function putShipOnGrid(pos, ship, hor, grid){
	if (hor){
		for (var i = 0; i < ship.size; i++){
			grid[pos[Y_AXIS]][pos[X_AXIS]+i] = ship.sym;
		}
	} else {
		for (var i = 0; i < ship.size; i++){
			grid[pos[Y_AXIS]+i][pos[X_AXIS]] = ship.sym;
		}
	}
}
function placeShips(fleet, grid){
	for (var key in fleet){
		if (fleet.hasOwnProperty(key)){
			if (key != "isHit") {
				while (!findValidPosition(fleet[key].size)[0]){}
				console.log(key + " : " + fleet[key].size); //debugging line
				console.log("posXY : " + loc[0] + ", " + loc[1] + " is horizontal? " + horizontal);
				putShipOnGrid(loc, fleet[key], horizontal, grid);	
			}  
		}
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
placeShips(myFleet, grid);
displayGrid(grid);
showObjectProp(myFleet);

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