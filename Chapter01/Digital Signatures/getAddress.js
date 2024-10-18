const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
    const slicedKey = publicKey.slice(1);
    const hashKey = keccak256(slicedKey);

    return hashKey.slice(-20);
}

module.exports = getAddress;