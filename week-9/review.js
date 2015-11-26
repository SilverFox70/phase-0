/*
Items to do:
-Create a new list
-Add an item with a quantity to the list
-Remove an item from the list
-Update quantities for items in your list
-Print the list (Consider how to make it look nice!)

Pseudocode

1. Create a constructor for groceryList
	a. list name
	b. item
	c. item qty
	d. item cost - optional
	e. aisle location in store - optional
	e. total items - optional
2. function to "addItem" to the list
	takes an item name and a quantity
	and appends to the list
3. function "updateItem"
	a. given an item already on the list
	   allows you to update the qty.  If 
	   new qty is zero, should remove item
	   from the list.
4. function "removeItem"
	a. given an item name should remove that
	   item from the list.
5. function "displayList"
	a. should display the list in a readable
	   format.

Include driver code to assert that all functions
work properly and as expected
*/

//Initial solution below
/*
function groceryList(listName) {
  if (listName !== undefined) {	
	this.listName = listName;
  } else {
  	this.listName = "My List";
  }
  this.list = {}
  this.addItem = function(itemName, qty) {
  	this.list[itemName] = qty;
  }

  //find item in list and change the quantity to equal qty
  this.updateItem = function(itemName, qty) {
  	if (this.list[itemName] !== undefined){
  		console.log("Found! " + this.list[itemName] + "  " + itemName);
  		this.list[itemName] = qty;
  		console.log("Updating to " + this.list[itemName] + " " + itemName);
  	} else {
  		console.log("Sorry, could not find: " + itemName);
  	}
  }

  //find item in list and delete it
  this.removeItem = function(itemName){
  	if (this.list[itemName] !== undefined){
      delete this.list[itemName];
    }  else {
      console.log("Sorry, could not find: " + itemName);
    }	
  }

  //display the list in a readable format
  this.displayList = function() {
  	console.log(this.listName);
  	for (var item in this.list){
  		if (this.list.hasOwnProperty(item)){
  			console.log("item: " + item + "\t" + "qty: " + this.list[item]);
  		}
  	}
  }
}*/

// Refactored code
function groceryList(listName) {
  if (listName !== undefined) {	
	this.listName = listName;
  } else {
  	this.listName = "My List"; // default list name if none given
  }
  this.list = {}
  this.addItem = function(itemName, qty) {
  	this.list[itemName] = qty;
  }

  //find item in list and change the quantity to equal qty
  this.updateItem = function(itemName, qty) {
  	if (this.list[itemName] !== undefined){
	  this.list[itemName] = qty;
  	} else {
  	  this.notFoundError(itemName);
  	}
  }

  //find item in list and delete it
  this.removeItem = function(itemName){
  	if (this.list[itemName] !== undefined){
      delete this.list[itemName];
    }  else {
      this.notFoundError(itemName);
    }	
  }

  //display the list in a readable format
  this.displayList = function() {
  	console.log(this.listName);
  	for (var item in this.list){
  	  if (this.list.hasOwnProperty(item)){
  		console.log("item: " + item + "\t" + "qty: " + this.list[item]);
 	  }
  	}
  };

  // Show error message to console if item not found
  this.notFoundError = function(itemName) {
  	console.log("Sorry, could not find: " + itemName);
  }
}




// Driver code

newList = new groceryList();
console.log("List name is : " + newList.listName);
anotherList = new groceryList("Tuesday's list");
console.log("List name is : " + anotherList.listName);
anotherList.addItem("eggs", "12");
anotherList.addItem("apples", "4");
anotherList.displayList();
anotherList.updateItem("apples", "5");
anotherList.updateItem("figs");
anotherList.removeItem("eggs");
anotherList.displayList();

