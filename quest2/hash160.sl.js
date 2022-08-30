var crypto = require('crypto');
var hash160 = function (data) {
    var dt = Buffer.from(data);
    return crypto.createHash('ripemd160').update(crypto.createHash('sha256').update(dt).digest()).digest();
}

console.log(hash160('Ducks'));