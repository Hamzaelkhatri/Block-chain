var crypto = require('crypto');
const fs = require("fs");

function generateAddress() {
    const { privateKey, publicKey } = crypto.generateKeyPairSync('ec', {
        namedCurve: 'secp256k1',
        publicKeyEncoding: {
            type: 'spki',
            format: 'der'
        },
        privateKeyEncoding: {
            type: 'pkcs8',
            format: 'pem'
        }
    });

    const address = crypto.createHash('sha256').update(publicKey).digest('hex')

    fs.writeFileSync("./wallet.pem",privateKey)
    return {
        address: '01' + address
    }

}


function createTransaction(amount, recipient) {
    let sender = generateAddress().address;
    let hexAmount = amount.toString(16);
    var signer = crypto.createSign('SHA256');
    signer.update(sender + recipient + hexAmount);
    var private = fs.readFileSync("./wallet.pem");
    var sign = signer.sign(private,'hex')

    return sender + recipient + hexAmount + sign;
}



let address = generateAddress()
console.log(address)
//
let transaction = createTransaction(200,"01ffa17f4e0bbb2f049f5d1f9d4ab9fad967e6b0ed9a8fc94563d0b4e47b62e169")
console.log(transaction)
