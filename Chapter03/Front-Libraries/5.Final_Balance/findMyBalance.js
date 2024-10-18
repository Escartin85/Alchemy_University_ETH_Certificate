const { Wallet, providers, utils } = require('ethers');
const { ganacheProvider } = require('./config');

const provider = new providers.Web3Provider(ganacheProvider);

async function findMyBalance(privateKey) {
    // retrieve the balance, given a private key
    // Create a wallet instance using the provided private key and provider
    const wallet = new Wallet(privateKey, provider);

    // Get the balance of the wallet's address
    const balance = await provider.getBalance(wallet.address);
    console.log(balance);
    // Convert the balance from Wei (smallest unit of Ether) to Ether for readability
    //const balanceInEther = utils.formatEther(balance);

    // Return the balance in Ether
    //return balanceInEther;
    return balance;
}

module.exports = findMyBalance;