const Block = require('./Block');

class Blockchain {
    constructor() {
        const genesisBlock = new Block("genesis");
        this.chain = [genesisBlock];
    }

    addBlock(newBlock){
        newBlock.previousHash = this.chain[this.chain.length - 1].toHash();
        newBlock.data = "Jack sent 1eth to Julia";
        this.chain.push(newBlock);
    }

    isValid(){
        let isChainValid = true
        const blockchain = this.chain

        for(let i = 1; i < blockchain.length; i++){
            const previousBlock = blockchain[i - 1];
            const currentBlock = blockchain[i];
            if (
                previousBlock.toHash().toString() !=
                currentBlock.previousHash.toString()
            ) {
                isChainValid = false;
            }
        }
        return isChainValid;
    }
}

module.exports = Blockchain;