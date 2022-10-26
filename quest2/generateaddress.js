/*
Create a function generateAddress() that generates a pair of cryptographic keys using the elliptic curve secp256k1. The return value is an object with members:

privateKey, a private key as a string (pkcs8/pem format)
publicKey, the corresponding public key as a string (spki/pem)
address, an address to identify this account. The address is the hash sha256 of the publicKey (in format spki/der) prepended with '01'
*/

const { createHash } = require("crypto")
const { createECDH, createPublicKey, createPrivateKey } = require("crypto")


const generateAddress = () => {

    const ec = createECDH('secp256k1')
    ec.generateKeys()

    const privateKey = ec.getPrivateKey('hex')
    const publicKey = ec.getPublicKey('hex')

    const address = createHash('sha256').update(publicKey, 'hex').digest('hex')

    return {
        privateKey,
        publicKey,
        address
    }
}
