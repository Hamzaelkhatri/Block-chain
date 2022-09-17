var ethers = require('ethers');
var crypto = require('crypto');

// check if data.json exists
const fs = require("fs");
var wallet;
// else {
const randomMnemonic = ethers.Wallet.createRandom().mnemonic;
wallet = ethers.Wallet.fromMnemonic(randomMnemonic.phrase);
console.log("your mnemonic is : ", randomMnemonic.phrase)
console.log("your address is : ", wallet.address)
console.log("your private key is : ", wallet.privateKey)
// }

var data = wallet.privateKey

fs.writeFile("data.json", data, function (err) {
    if (err) {
        return console.log(err);
    }
    // console.log("The file was saved!");
})