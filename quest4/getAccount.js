async function getAccount() {
    const ethers = require('ethers');
    const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545");
    // return the first account
    const accounts = await provider.listAccounts();
    return accounts[0];
}
module.exports = getAccount
