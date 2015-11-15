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
X_AXIS = 0; // defines the index to be used for the x axis values
Y_AXIS = 1; // defines the index to be used for the y axis values
TOP_LABEL = [" ",1,2,3,4,5,6,7,8]; // sets labels for top row of grid
SIDE_LABEL = [' ', 'A','B','C','D','E','F','G','H']; // labels for side of grid
SPACER = "    "; // sets the horizontal spacer that makes it look pretty 
VSPCER = "\n \n"; // set the vertical spacer that makes it look pretty
EMPTY_SPACE = " "; // sets the value to be used for empty spaces in the grid
HIT_X = "X"; //sets the value to be used for a "hit" on a ship
MISS = "O"; //set the value to be used for a missed shot

// returns two random values in an array. These values are guaranteed
// to be within the playing space of the game grid
function posXY(){
	var pos_x = Math.floor(Math.random() * (GRID_SIZE-1)) + 1;
	var pos_y = Math.floor(Math.random() * (GRID_SIZE-1)) + 1;
	return [pos_x, pos_y];
}

// Define a fleet object
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

// creates an array of arrays whose dimensions are size x size
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

//  populates an square matrix array of GRID_SIZE x GRID_SIZE dimension
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

// Shows the playing grid of either the player or the computer
// The computers grid (when enemy == true) does not display the
// locations of the enemy ships
function displayGrid(grid, enemy) {
	if (enemy) {
		console.log("\t <** Enemy Grid **>");
	} else console.log("\t <** Player Grid **>");
	for (var i = 0; i < GRID_SIZE; i++){
		for (var j = 0; j < GRID_SIZE; j++){
			if ((!enemy)||(i == 0)||(j == 0)) {
				process.stdout.write(grid[i][j] + SPACER);
			} else {
				if ((grid[i][j] != SPACER)||  // create a function to quickly check all of this
					(grid[i][j] != HIT_X)||
					(grid[i][j] != MISS)) {
					process.stdout.write(EMPTY_SPACE + SPACER);
				} else {
					process.stdout.write(grid[i][j] + SPACER);
				}
			}
		}
		process.stdout.write(VSPCER);
	}
}

// ------------------------------------------------------------------------
/* Functions below handle placing and validating locations of fleet ships */
// ------------------------------------------------------------------------

// Checks if there is enough horizontal room in grid to place ship and also
// makes sure that another ship is not in the way
function fitsHorizontal(x, y, size, grid){
	console.log("x : " + x + "\t size : " + size + " space : " + (GRID_SIZE - x) + "   t/f : " + ((GRID_SIZE - x) > size) );
	var doesFit = ((GRID_SIZE - x) > size);
	if (doesFit) {
		for (var i = 0; i < size; i++){
			if (grid[y][x+i] != EMPTY_SPACE) doesFit = false; 
		}
	}
	return doesFit;
}

// Checks if there is enough vertical room in grid to place ship and also
// makes sure that another ship is not in the way
function fitsVertical(x, y, size, grid){
	console.log("y : " + y + "\t size : " + size + " space : " + (GRID_SIZE - y) + "   t/f : " + ((GRID_SIZE - y) > size) );
	var doesFit = ((GRID_SIZE - y) > size);
	if (doesFit) {
		for (var i = 0; i < size; i++){
			if (grid[y+i][x] != EMPTY_SPACE) doesFit = false; 
		}
	}
	return doesFit;
}

// finds a valid position for each ship on the grid
function findValidPosition(shipsize, grid){
	loc = posXY();      // I am cheating by letting these two variables exist beyond
	horizontal = false; // of this method.  Bad practice, but a quick solution ;)
	if (fitsHorizontal(loc[X_AXIS], loc[Y_AXIS],shipsize, grid)) {
		horizontal = true; 
		return [loc, horizontal];
	} else if (fitsVertical(loc[X_AXIS], loc[Y_AXIS], shipsize, grid)){
		horizontal = false;
		return [loc, horizontal];
	} else return [false];
}

// places the symbols for each ship in its location on the grid
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

// master function which iterates over all ships in a fleet, placing them
// in valid positions on the playing grid
function placeShips(fleet, grid){
	for (var key in fleet){
		if (fleet.hasOwnProperty(key)){
			if (key != "isHit") {
				while (!findValidPosition(fleet[key].size, grid)[0]){}
				console.log(key + " : " + fleet[key].size); //debugging line
				console.log("posXY : " + loc[0] + ", " + loc[1] + " is horizontal? " + horizontal);
				putShipOnGrid(loc, fleet[key], horizontal, grid);	
			}  
		}
	}	
}

// Functions below are for gameplay

function checkHit(pos, grid){
	var row = pos[Y_AXIS];
	var column = pos[X_AXIS];
	if ((grid[row][column] != EMPTY_SPACE)&&
	    (grid[row][column] != HIT_X)&&
	    (grid[row][column] != MISS)) {
		return true;
	} else return false;
}

function updateFleet(letter, fleet) {
	switch (letter) {
		case "B":
			fleet.isHit(fleet.battleship);
			console.log("Battleship health: " + fleet.battleship.health);
			break;
		case "C":
			fleet.isHit(fleet.cruiser);
			console.log("Cruiser health: " + fleet.cruiser.health);
			break;
		case "D":
			fleet.isHit(fleet.destroyer);
			console.log("Destroyer health: " + fleet.destroyer.health);
			break;	
		case "S":
			fleet.isHit(fleet.submarine);
			console.log("Submarine health: " + fleet.submarine.health);
			break;
	}
}

function updateGame(fleet, grid, enemy){
	// get firing data
	if (enemy) {
		var pos = posXY();
	} else {
		var pos = posXY(); // real version would get user input
	}
	console.log("row : " + pos[Y_AXIS] + "\t col : " + pos[X_AXIS]);
	if (checkHit(pos, grid)) {
		value_at_pos = grid[pos[Y_AXIS]][pos[X_AXIS]];
		updateFleet(value_at_pos, fleet);
		grid[pos[Y_AXIS]][pos[X_AXIS]] = "X";
	} else grid[pos[Y_AXIS]][pos[X_AXIS]] = "O";
	return grid;
}

// Code below is for getting user input from the console.
// would require fitting all of the game play functions within
// the structure of the callbacks in order to work because
// of the asynchronous nature of JS execution.  The code you
// see in here is just sample/test code put in during my futile
// trouble shooting of this issue.
function getPlayerInput() {
	var readline = require('readline');

	var rl = readline.createInterface({
	  input: process.stdin,
	  output: process.stdout
	});

	rl.question("What do you think of Node.js? ", function(answer) {
	  // TODO: Log the answer in a database
	  process.stdin.pause();
	  console.log("Thank you for your valuable feedback:", answer);

	  rl.close();
	});
	
}
	// var readline = require('readline');
	// var rl = readline.createInterface(process.stdin, process.stdout);
	// rl.setPrompt("Target Coordinates [x, y] : ");
	// rl.prompt();
	// rl.on('line', function(line){
	// 	if (line === "exit") rl.close();
	// 	return line;
	// 	//rl.prompt();
	// }).on('close', function(){
	// 	process.exit(0);



// Driver Code
console.log("Numbers: " + posXY());
var myFleet = new Fleet();
console.log("show health: " + myFleet.battleship.health);
console.log("show hit: " + myFleet.isHit(myFleet.battleship)); 
var enemyFleet = new Fleet();
console.log("show enemy : " + enemyFleet.battleship.health);
myGrid = new Grid();
displayGrid(myGrid);
placeShips(myFleet, myGrid);
displayGrid(myGrid);
enemyGrid = new Grid();
placeShips(enemyFleet, enemyGrid);
displayGrid(enemyGrid, true);
showObjectProp(myFleet);
myGrid = updateGame(myFleet, myGrid, false);
displayGrid(myGrid);

// Refactored Code






// Reflection
// What was the most difficult part of this challenge?


/*
What did you learn about creating objects and functions that interact with one another?

	Wow!  I really miss not being able to creat classes!  It isn't terribly difficult to
	do, but a lot of data is getting passed around between functions.


Did you learn about any new built-in methods you could use in your refactored solution? 
If so, what were they and how do they work?

	I kind of gave up on finding built-in methods to fix issues after looking at some of 
	JS api.  Really, the logic is pretty straight forward and refactoring in my case,
	to do seriously, would amount to reworking the whole thing and creating classes.  But,
	JS doesn't do classes, so maybe restructure to avoid passing so much data around 
	between functions.

How can you access and manipulate properties of objects?

	You can use dot or bracket notation to access object properties.  You can iterate through
	an object's properties using "for (var key in obj)" loop to cycle through properties, 
	although you should include a check for obj.hasOwnProperty in order to avoid capturing
	any properties that might belong to the object Prototype.  You can use functions or direct
	expressions to alter the values of properties of an object.
*/