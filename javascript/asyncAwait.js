const { samplePromise } = require('./promise.js')

const resolve = async () => {
    try {
        const val = await samplePromise()
        console.log(val)
    }
    catch(e){
        console.log(e)
    }
}
resolve()