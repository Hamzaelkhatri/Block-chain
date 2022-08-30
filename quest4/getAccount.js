const ethers = require('ethers');
const getAccount = require('./getAccount');


async function sendEther(amount, address) {
    const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545");
    const accounts = await getAccount()
    const signer = provider.getSigner(accounts);
    const tx = await signer.sendTransaction({
        to: address,
        value: ethers.utils.parseEther(amount.toString())
        
    });
    await tx.wait();
    return tx;
}

module.exports = sendEther
