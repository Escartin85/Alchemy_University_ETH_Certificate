const { providers } = require('ethers');
const { ganacheProvider } = require('./config');

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Given an ethereum address find all the addresses
 * that were sent ether from that address
 * @param {string} address - The hexadecimal address for the sender
 * @async
 * @returns {Array} all the addresses that received ether
 */
async function findEther(address) {
    const latestBlockNumber = await provider.getBlockNumber();
    const uniqueAddresses = new Set(); // Use a Set to ensure uniqueness

    // Iterate through the blocks starting from block 1 to the latest block
    for (let i = 1; i <= latestBlockNumber; i++) {
        const block = await provider.getBlockWithTransactions(i);

        // Iterate through all transactions in the block
        for (let tx of block.transactions) {
            // If the transaction is from the given address, add the recipient to the Set
            if (tx.from.toLowerCase() === address.toLowerCase()) {
                uniqueAddresses.add(tx.to);
            }
        }
    }

    // Convert the Set to an array and return it
    return Array.from(uniqueAddresses);
}

module.exports = findEther;