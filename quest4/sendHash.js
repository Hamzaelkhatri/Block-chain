var ethers = require('ethers');
// var accounts = require('./getAccount')

async function sendHash(text) {

    const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545");//http://localhost:8545
    const signer = provider.getSigner();
    const tx = await signer.sendTransaction({
        to: getAccount(),
        data: ethers.utils.sha256(ethers.utils.toUtf8Bytes(text))
    });
    return tx.hash;
}


console.log(sendHash("hello"));

module.exports = sendHash;