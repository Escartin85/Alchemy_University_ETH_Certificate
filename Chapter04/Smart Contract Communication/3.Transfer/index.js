/**
 * Transfer funds on the contract from the current signer 
 * to the friends address
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @param {string} friend - a string containing a hexadecimal ethereum address
 * @return {promise} a promise of the transfer transaction
 */
function transfer(contract, friend) {
    const tx = contract.transfer(friend, 1000);
    console.log(tx);
    return tx;
}

module.exports = transfer;