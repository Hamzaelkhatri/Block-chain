var ethers = require('ethers');
var crypto = require('crypto');

// check if data.json exists
const fs = require("fs");


if (fs.existsSync("data.json")) {
    // read the file
    const content = fs.readFileSync("data.json");
    wallet = new ethers.Wallet(content.toString());
    console.log("wallet connected : ", wallet.getAddress())
    // console.log(process.argv[2])/

    const provider = new ethers.providers.JsonRpcProvider(process.argv[2]);
    const walletWithProvider = new ethers.Wallet(wallet.privateKey, provider);

    // get the balance
    async function getBalance() {
        const balance = await walletWithProvider.getBalance();
        console.log("Balance: " + ethers.utils.formatEther(balance));
    }
    console.log("wallet info : ", walletWithProvider)
    getBalance()
    // console
} else {
    console.log("Create wallet first")
    process.exit(1);
}


// getBalance()

