function randomGen(left, right = 0) {
    const skip = (right === 0 ? 1 : left)
    return (Number((Math.random() * Math.abs((right - left))) + skip).toFixed(0))
}


console.log("Random Number Generated :", randomGen(8, 10))
console.log("Random Number Generated :", randomGen(1000))
console.log("Random Number Generated :", randomGen(1, 2))
console.log("Random Number Generated :", randomGen(9))