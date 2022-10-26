var crypto = require('crypto');


function generateAddress() {

    const { privateKey, publicKey } = crypto.generateKeyPairSync('ec', {
        namedCurve: 'secp256k1',
        publicKeyEncoding: {
            type: 'spki',
            format: 'pem'
        },
        privateKeyEncoding: {
            type: 'pkcs8',
            format: 'pem'
        }
    });

    const address = crypto.createHash('sha256').update(publicKey).digest('hex')

    return {
        privateKey,
        publicKey,
        address: '01' + address
    }
}
  
