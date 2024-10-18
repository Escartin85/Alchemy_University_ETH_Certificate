const { keccak256 } = require("ethereum-cryptography/keccak");
const { toHex, utf8ToBytes } = require("ethereum-cryptography/utils");

function firstTopic() {
    //const eventSignature = ""; // <-- TODO #1: fill in the event signature!
    // The stripped down event signature for the Transfer event
    const eventSignature = "Transfer(address,address,uint256)";
    const bytes = utf8ToBytes(eventSignature);
    const digest = keccak256(bytes);
    return toHex(digest);
}

function secondTopic() {
    // TODO #2: add the address and left-pad it with zeroes to 32 bytes
    // then return the value
    // Replace with the actual address
    const address = "0xYourAddressHere"; 

    // Remove the 0x prefix, pad with leading zeros to 32 bytes (64 hex characters)
    const paddedAddress = address.replace("0x", "").padStart(64, "0");
    return "0x" + paddedAddress;
}

module.exports = { firstTopic, secondTopic }