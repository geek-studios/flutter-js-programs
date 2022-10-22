/* This simple code snippets can be used to validate a form inputs javascript */
/* Coded with ❤️ & ☕ by https://github.com/nihalansar */

let emailValidate = (input) => {
  let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  return regex.test(input);
}

let internationalNumberValidate = (input) => {
  let regex = /^\+[1-9]{1}[0-9]{3,14}$/;
  return regex.test(input);
}

let indianNumberValidate = (input) => {
  let regex = /^[6-9]{1}[0-9]{9}$/;
  return regex.test(input);
}

/* Password should have atleast one Uppercase, Lowercase, Special Character & a Number. The password should be minimum 8 characters */
let passwordValidate = (input) => {
  let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  return regex.test(input);
}

/* Testing the function */
console.log(emailValidate('nihalansar9008@gmail.com'))