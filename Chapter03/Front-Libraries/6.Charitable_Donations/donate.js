const { utils, providers, Wallet } = require('ethers');
const { ganacheProvider } = require('./config');

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Donate at least 1 ether from the wallet to each charity
 * @param   {string} a hex string private key for a wallet with 10 ETH
 * @param   {array} an array of ethereum charity addresses 
 *
 * @returns {Promise} a promise that resolves after all donations have been sent
 */
async function donate(privateKey, charities) {
    // TODO: donate to charity!
    // Create a wallet instance using the provided private key and provider
    const wallet = new Wallet(privateKey, provider);

    // Get the current nonce for the wallet address
    let currentNonce = await provider.getTransactionCount(wallet.address);

    // Iterate over the array of charity addresses and send at least 1 ether to each
    const donationPromises = charities.map(async (charityAddress, index) => {
        // Create a transaction to send 1 Ether (in wei)
        const tx = {
            to: charityAddress,
            value: utils.parseEther('1.0'), // Convert 1 ether to wei
            gasLimit: 21000, // Standard gas limit for a simple ETH transfer
            gasPrice: await provider.getGasPrice(), // Get current gas price from the network
            nonce: currentNonce + index // Set the correct nonce for each transaction
        };

        // Send the transaction using wallet.sendTransaction
        const transaction = await wallet.sendTransaction(tx);

        // Wait for the transaction to be mined
        await transaction.wait();

        console.log(`Donated 1 Ether to ${charityAddress} - Transaction: ${transaction.hash}`);
    });

    // Return a promise that resolves once all donations are processed
    return Promise.all(donationPromises);
}

module.exports = donate;