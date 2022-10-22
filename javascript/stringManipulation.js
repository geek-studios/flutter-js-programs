/* This simple code snippets can be used to manipulate a input string in javascript */
/* Coded with ❤️ & ☕ by https://github.com/nihalansar */

let standardTitleCase = (input) => {
  let sentence = input.trim().replace(/\s\s+/g, ' ').toLowerCase().split(" ");
  for (var i = 0; i < sentence.length; i++) {
    sentence[i] = sentence[i][0].toUpperCase() + sentence[i].slice(1);
  }
  return sentence.join(' ');
}

let removeMultipleSpaceToSingle = (input) => {
  return input.trim().replace(/\s\s+/g, ' ');
}

let stringToArray = (input, seperator) => {
  return input.trim().replace(/\s\s+/g, ' ').split(seperator);
}

let stringToLowerCaseArray = (input, seperator) => {
  return input.trim().replace(/\s\s+/g, ' ').toLowerCase().split(seperator);
}

let stringToUpperCaseArray = (input, seperator) => {
  return input.trim().replace(/\s\s+/g, ' ').toUpperCase().split(seperator);
}


/* Testing the function */
console.log(stringToUpperCaseArray('sajh shjj      aahja2 As A',' '))