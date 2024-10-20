const ethers = require('ethers');

/**
 * Deposit at least 1 ether into the contract 
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @return {promise} a promise of the deposit transaction 
 */
function deposit(contract) {
    const tx = contract.deposit({
        value: ethers.utils.parseEther("5")
    });
}

module.exports = deposit;