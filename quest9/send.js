var ethers = require('ethers');
const fs = require("fs");
const process = require('process');


const content = fs.readFileSync("data.json");
wallet = new ethers.Wallet(content.toString());
console.log("wallet connected : ", wallet.getAddress())
// console.log(process.argv[2])/

const provider = new ethers.providers.JsonRpcProvider(process.argv[2]);
const walletWithProvider = new ethers.Wallet(wallet.privateKey, provider);

// send a transaction
async function sendTransaction(to, amount) {
    const tx = {
        to: to,
        value: ethers.utils.parseEther(amount)
    };
    const transaction = await walletWithProvider.sendTransaction(tx);
    console.log("Transaction hash: " + transaction.hash);
}

sendTransaction(process.argv[3], process.argv[4])