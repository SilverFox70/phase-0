function ask() {
	var readline = require('readline');

	var rl = readline.createInterface({
	  input: process.stdin,
	  output: process.stdout
	});

	rl.question("What do you think of Node.js? ", function(answer) {
	  // TODO: Log the answer in a database
	  myanswer = answer
	  console.log("Thank you for your valuable feedback:", answer);

	  rl.close();
	});
}

myanswer = "";
ask();

console.log("we've got :" + myanswer);

