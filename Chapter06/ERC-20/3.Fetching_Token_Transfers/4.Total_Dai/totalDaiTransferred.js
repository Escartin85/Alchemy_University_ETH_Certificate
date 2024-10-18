require("dotenv").config();
const { Alchemy, Network } = require("alchemy-sdk");
const { firstTopic, secondTopic } = require('./topics');
// prefix both the topics with 0x
const topics = [firstTopic(), secondTopic()].map((x) => '0x' + x);

const config = {
    apiKey: process.env.API_KEY,
    network: Network.ETH_MAINNET,
};

const alchemy = new Alchemy(config);

async function totalDaiTransferred(fromBlock, toBlock) {
    const logs = await alchemy.core.getLogs({
        address: "0x6b175474e89094c44da98b954eedeac495271d0f", // <-- TODO #1: fill in the dai address here
        fromBlock,
        toBlock,
        topics
    });

    // take a look at the first log in the response
    // console.log(logs[0]);
    // Summing all the DAI transferred
    let totalDai = BigInt(0);

    // <-- TODO #2: return the total dai transferred during this timeframe
    logs.forEach(log => {
        // log.data contains the amount of DAI transferred, which is a 32-byte hexadecimal string
        // Remove the "0x" and parse it as a BigInt
        const daiTransferred = BigInt(log.data); // No need for radix, '0x' already represents hex
        totalDai += daiTransferred; // Use native BigInt addition
    });

    return totalDai;

}

module.exports = totalDaiTransferred;