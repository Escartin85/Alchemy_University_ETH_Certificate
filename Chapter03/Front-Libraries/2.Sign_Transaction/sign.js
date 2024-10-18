const ethers = require('ethers');
const { Wallet, utils } = ethers;
const { wallet1 } = require('./wallets');

// TODO: replace all undefined values
const signaturePromise = wallet1.signTransaction({
    value: utils.parseEther("1.0"),
    to: "0xdD0DC6FB59E100ee4fA9900c2088053bBe14DE92", 
    gasLimit: utils.parseUnits('21000', 'wei'),
});

module.exports = signaturePromise;