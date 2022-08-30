// var http = require('http');
var Buffer = require('Buffer');

function increment(value) {

    // value to hex from sbuffertring
    var buf = Buffer.from(value, 'hex');
    var len = buf.length, i

    for (i = len - 1; i >= 0 && buf[i] === 255; i--) buf[i] = 0
    if (~i) buf[i] = buf[i] + 1
    if (buf[0] === 0) buf = Buffer.concat([Buffer.from([1]), buf])
    return buf
}
console.log(increment("ff"));