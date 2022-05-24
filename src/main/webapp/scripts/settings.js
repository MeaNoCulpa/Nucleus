/**
 * 
 */

//const emailElement = document.querySelector('#email');
const passwordElement = document.querySelector('#new-password');
const confirmPasswordElement = document.querySelector('#confirm-password');

const form = document.querySelector('#passwordForm');

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

const checkEmail = () => {
    let valid = false;
    const email = emailElement.value.trim();
    if (!isRequired(email)) {
        showError(emailElement, 'Le courriel ne peut pas être vide');
    } else if (!isEmailValid(email)) {
        showError(emailElement, 'Le courriel n\'est pas valide')
    } else {
        showSuccess(emailElement);
        valid = true;
    }
    return valid;
};

const checkPassword = () => {
    let valid = false;

    const password = passwordElement.value.trim();
    console.log(password);
    
    if (!isRequired(password)) {
        showError(passwordElement, 'Le mot de passe ne peut pas être vide');
    } else if (!isPasswordSecure(password)) {
        showError(passwordElement, 'Le mot de passe doit comporter au moins 8 caractères, dont au moins 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial dans (!@#$%^&*)');
    } else {
        showSuccess(passwordElement);
        valid = true;
    }

    return valid;
};

const checkConfirmPassword = () => {
    let valid = false;
    // check confirm password
    const confirmPassword = confirmPasswordElement.value.trim();
    const password = passwordElement.value.trim();

    if (!isRequired(confirmPassword)) {
        showError(confirmPasswordElement, 'Veuillez entrer à nouveau le mot de passe');
    } else if (password !== confirmPassword) {
        showError(confirmPasswordElement, 'Le mot de passe ne correspond pas');
    } else {
        showSuccess(confirmPasswordElement);
        valid = true;
    }

    return valid;
};

const isEmailValid = (email) => {
    const regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regEx.test(email);
};

const isPasswordSecure = (password) => {
    const regEx = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
    return regEx.test(password);
};

const isRequired = value => value === '' ? false : true;

const showError = (input, message) => {
    // get the form-field element
    const formField = input.parentElement;
    // add the error class
    formField.classList.remove('success');
    formField.classList.add('error');

    // show the error message
    const error = formField.querySelector('small');
    error.textContent = message;
};

const showSuccess = (input) => {
    // get the form-field element
    const formField = input.parentElement;

    // remove the error class
    formField.classList.remove('error');
    formField.classList.add('success');

    // hide the error message
    const error = formField.querySelector('small');
    error.textContent = '';
}

form.addEventListener('submit', function(e) {
	// validate fields
    let isPasswordValid = checkPassword(),
    	isConfirmPasswordValid = checkConfirmPassword();

    let isFormValid = isPasswordValid && isConfirmPasswordValid;

    // stop the submission to the server if the form is invalid
    if (!isFormValid) {
		e.preventDefault();
    }
});

const debounce = (fn, delay = 500) => {
    let timeoutId;
    return (...args) => {
        // cancel the previous timer
        if (timeoutId) {
            clearTimeout(timeoutId);
        }
        // setup a new timer
        timeoutId = setTimeout(() => {
            fn.apply(null, args)
        }, delay);
    };
};

form.addEventListener('input', debounce(function (e) {
    switch (e.target.id) {
        case 'new-password':
            checkPassword();
            break;
        case 'confirm-password':
            checkConfirmPassword();
            break;
    }
}));