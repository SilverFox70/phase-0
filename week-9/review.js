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
function isValid(str) {
	return str.replace(/^\s+/g,"").length; //boolean = true if str is empty
}
*/

function groceryList(listName) {
  if (listName !== undefined) {	
	this.listName = listName;
  } else {
  	this.listName = "My List";
  }
  this.item = { name: undefined, quantity: undefined}
  this.addItem = function(itemName, qty) {
  	item.name = itemName;
  	item.quantity = qty;
  }
  this.updateItem = function(itemName, qty) {
  	//find item in list and change the quantity to equal qty
  }
  this.removeItem = function(itemName){
  	//find item in list and delete it
  }
  this.displayList = function() {
  	//display the list in a readable format
  }
}


// Driver code

newList = new groceryList();
console.log("List name is : " + newList.listName);
anotherList = new groceryList("Tuesday's list");
console.log("List name is : " + anotherList.listName);
anotherList.addItem("eggs", "12");
console.log("List item : " + anotherList.item.name + "\t" + anotherList.item.quantity);

