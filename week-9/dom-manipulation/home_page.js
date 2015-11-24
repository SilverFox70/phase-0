// DOM Manipulation Challenge


// I worked on this challenge [with: Shea Munion].


// Add your JavaScript calls to this page:

// Release 0:

// Release 1:
var cName = document.getElementById("release-0");
cName.className = "done";


// Release 2:
document.getElementById("release-1").style.display = "none";



// Release 3:
document.getElementsByTagName("h1")[0].innerHTML = "I completed release 2.";



// Release 4:
document.getElementById("release-3").style.backgroundColor = "#955251";



// Release 5:
var elements = document.getElementsByClassName("release-4");
elements[0].style.fontSize = "2em";
elements[1].style.fontSize = "2em";

// release-6:
var temp = document.getElementById("hidden");
document.body.appendChild(temp.content.cloneNode(true));
