const crypto = require('crypto');
const elliptic = require('elliptic');
/*
- Create a function `init()` that generates a cryptographic key pair on any elliptic curve and returns the public key in any format.

- Create a function `signer(message)` that takes as arguments a message and returns the signature of the message (using the `sha256` algorithm).

- create a function `verifier(message, pubKey, signature)` that takes as arguments a message, a public key and a signature and returns a boolean if the signature is valid.

const message = "This is a message to sign"
const pubKey = init()
const signature = signer(message)
console.log(verifier(message, pubKey, signature))
*/

// init()

function init() {
    //generates a cryptographic key pair on any elliptic curve
    const ec = new elliptic.ec('secp256k1');
    const key = ec.genKeyPair();
    return key.getPublic('hex');
}
// const { privateKey, publicKey } = 

// signer(message)
function signer(message) {
    //signature of the message (using the `sha256` algorithm).
    const sign = crypto.createSign('SHA256');
    sign.write(message);
    sign.end();
    //crypto.SignKeyObjectInput
    privateKey = crypto.sign('SHA256', message);
}

// verifier(message, pubKey, signature)
function verifier(message, pubKey, signature) {
    const verify = crypto.createVerify('SHA256');
    verify.write(message);
    verify.end();
    return verify.verify(pubKey, signature, 'hex');
}

const message = "This is a message to sign"
const pubKey = init()
const signature = signer(message)
console.log(verifier(message, pubKey, signature))