const process = require('process')
var ethers = require('ethers');
var crypto = require('crypto');
const fs = require("fs");
// read the file


// var id = crypto.randomBytes(32).toString('hex');
// var privateKey = "0x" + id;
// console.log("SAVE BUT DO NOT SHARE THIS:", privateKey);

// get the current wallet

// console.log("Address: " + wallet.address);

async function importWallet() {
    if (process.argv.length == 3) {
        const content = fs.readFileSync(process.argv[2]);
        var wallet = new ethers.Wallet(content.toString());
        console.log("wallet imported : ", await wallet.getAddress())
    }
}

importWallet()