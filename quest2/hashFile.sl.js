var fs = require('fs');
var crypto = require('crypto');

function hashFile(filename) {
    var file = fs.readFileSync(filename);
    var hash = crypto.createHash('sha256');
    hash.update(file);
    return hash.digest('hex');
}

console.log(hashFile('textfile.txt'));