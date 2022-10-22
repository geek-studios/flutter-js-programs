/* This simple code snippets can be used to understand the async work flow in javascript */
/* Coded with ❤️ & ☕ by https://github.com/nihalansar */

const https = require('https');

let showAsyncWorkFlowWithoutAwait = (input) => {
  let data = https.get(input, (resp) => {
    // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received. Print out the result.
  resp.on('end', () => {
    console.log('Data from web : ' + data + ' i was called first, but not showed first 😔.')
  });
  })
  console.log('I was called second but showed first 😃')
}

let showAsyncWorkFlowWithAwait = async (input) => {
  let data = await https.get(input)
  console.log('Data from web : ' + data + ' i was called first, and showed first 😃 thanks to await.')
  console.log('I was called second and showed second 🙂')
}


/* Testing the function */
showAsyncWorkFlowWithAwait('https://jsonplaceholder.typicode.com/todos/1')