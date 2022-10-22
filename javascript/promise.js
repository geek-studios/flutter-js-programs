const samplePromise = ()=>{

    return new Promise((resolve,reject)=>{
        const check =true;
        check?resolve("I was resolved"):reject("I was Rejected")
    })
}

export {samplePromise}