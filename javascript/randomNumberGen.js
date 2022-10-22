function randomGen(left,right=0){
    const skip = (right===0?1:left)
    return (Number((Math.random()*Math.abs((right-left)))+skip).toFixed(0))
}


console.log(randomGen(8,10))
console.log(randomGen(1000))
console.log(randomGen(1,2))