var ethers = require('ethers');

async function checkDocument(text, txID) {
    const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545");//http://localhost:8545
    try {
        const txx = await provider.getTransaction(txID);
        if (txx == null) {
            return 0;
        }
    } catch (error) {
        return 0;
    }
    const tx = await provider.getTransaction(txID).then(tx => {
        if (tx != undefined) {
            if (tx.data == ethers.utils.sha256(ethers.utils.toUtf8Bytes(text))) {
                return tx;
            } else {
                return null
            }   
        }
        return null
    });

    if (tx == null) {
        return 0
    }
    let numberBlock = tx.blockNumber;
    console.log(numberBlock);
    let timestampBlock = await provider.getBlock(numberBlock).then(block => {
        return block.timestamp;
    }
    );
    console.log(timestampBlock);
    return new Date(timestampBlock).getTime();
}

console.log(checkDocument("hello", "0x875d205887913148a02c0315aff6f309f529da551f88fd10df33e8f610ef0af9"))


module.exports = checkDocument;