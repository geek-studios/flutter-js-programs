/* This simple code snippets can be used to print patterns in console using javascript */
/* Coded with ❤️ & ☕ by https://github.com/nihalansar */

/*
1
22
333
4444
*/
let numberMountainDown1 = (input) => {
  let out = ''
  for(let i=1;i<=input;i++){
    for(let j=1;j<=i;j++){
      out += i
    }
    out += (i == input) ? '' : '\n'
  }
  console.log(out)
}

/*
1111
222
33
4
*/
let numberMountainUp1 = (input) => {
  let out = ''
  for(let i=1;i<=input;i++){
    for(let j=1;j<=input - i + 1;j++){
      out += i
    }
    out += (i == input) ? '' : '\n'
  }
  console.log(out)
}

/*
1
12
123
1234
*/
let numberMountainDown2 = (input) => {
  let out = ''
  for(let i=1;i<=input;i++){
    for(let j=1;j<=i;j++){
      out += j
    }
    out += (i == input) ? '' : '\n'
  }
  console.log(out)
}

/*
1234
123
12
1
*/
let numberMountainUp2 = (input) => {
  let out = ''
  for(let i=1;i<=input;i++){
    for(let j=1;j<=input - i + 1;j++){
      out += j
    }
    out += (i == input) ? '' : '\n'
  }
  console.log(out)
}

/* Testing the function */
numberMountainUp2(4)