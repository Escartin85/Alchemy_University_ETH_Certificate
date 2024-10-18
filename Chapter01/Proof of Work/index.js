const SHA256 = require('crypto-js/sha256');
const TARGET_DIFFICULTY = BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    // TODO: add transaction to mempool
    mempool.push(transaction);
}

function mine() {
    // TODO: mine a block
    const newBlock = new Object();
    newBlock.id = blocks.length;

    
    
    newBlock.transactions = [];
    let cont = 0;
    for (let i = 0; i < mempool.length; i++) {
        if (cont === MAX_TRANSACTIONS){
            break;
        }
        
        const transactionPool = mempool[i];
        newBlock.transactions.push(transactionPool);
        
        cont = cont + 1;
    }
    newBlock.nonce = -1;

    
    let blockString;
    let hashBlock = 0;

    while (BigInt(`0x${hashBlock}`) > TARGET_DIFFICULTY){
        newBlock.nonce = newBlock.nonce + 1;
        blockString = JSON.stringify(newBlock);
        hashBlock = SHA256(blockString);
        
    }
    newBlock.hash = hashBlock;
    //console.log(newBlock);
    blocks.push(newBlock);
    cont = 0;
    const max = mempool.length;
    for (let i = 0; i < max; i++) {
        if (cont === MAX_TRANSACTIONS) {
            break;
        }
        mempool.pop();
        cont = cont + 1;
    }

    //mempool.length = 0;
}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction, 
    mine, 
    blocks,
    mempool
};