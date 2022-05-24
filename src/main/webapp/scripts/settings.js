/**
 * 
 */

//const emailElement = document.querySelector('#email');
const newPasswordElement = document.querySelector('#password');
const confirmNewPasswordElement = document.querySelector('#confirm-password');
console.log(newPasswordElement);

function emptyLname() {
    var x;
    x = document.getElementById("lname").value;
    if (x.match(/^[^A-Z0-9]*$/i)) {
    	   alert('Veuillez entrer un nom valide.');
    	   return false;
    	} else {
    	   //alert('Valid');
    	}
}

function emptyFname() {
	var y;
    y = document.getElementById("fname").value;
    if (y.match(/^[^A-Z0-9]*$/i)) {
    	   alert('Veuillez entrer un prénom valide.');
    	   return false;
    	} else {
    	   //alert('Valid');
    	}
}