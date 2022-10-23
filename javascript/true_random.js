//Random base on atmospheric noise

limit = 10
min = 1
max = 10

url = `https://www.random.org/integers/?num=${limit}&min=${min}&max=${max}&col=1&base=10&format=plain&rnd=new`
require('https').get(url, (res) => {
    res.setEncoding('utf8');
    res.on('data', function (body) {
        console.log(body);
    });
});