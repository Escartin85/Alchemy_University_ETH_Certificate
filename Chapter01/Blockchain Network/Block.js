const SHA256 = require('crypto-js/sha256');

class Block {
    
    constructor(dataBlock) {
        this.data = dataBlock;
        //this.previousHash = "0";
    }
    previousHash(prevHash){
        this.previousHash = prevHash;
    }
    toHash() {
        
        const hash = SHA256(this.data + this.previousHash);
        return hash.toString();// a hash!
    }
}

module.exports = Block;
