
var ethers = require('ethers');
const fs = require("fs");
const process = require('process');

// read the file
const content = fs.readFileSync("data.json");
wallet = new ethers.Wallet(content.toString());
// console.log("wallet imported : ", wallet.getAddress())

const provider = new ethers.providers.JsonRpcProvider(process.argv[2]);
const walletWithProvider = new ethers.Wallet(wallet.privateKey, provider);

// get the balance
async function getBalance() {
    const balance = await walletWithProvider.getBalance();
    console.log("Balance: " + ethers.utils.formatEther(balance));
}

getBalance()