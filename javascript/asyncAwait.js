const { samplePromise } = require('./promise.js')

const resolve = async () => {
    try {
        const resp = await samplePromise()
        console.log(resp)
    }
    catch(e){
        console.log(e)
    }
}
resolve()