const { samplePromise } = require("./promise")

samplePromise()
    .then(val => {
        console.log(val)
    })
    .catch(err => {
        console.log(err)
    })
