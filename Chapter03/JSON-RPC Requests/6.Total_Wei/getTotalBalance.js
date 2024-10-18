require('dotenv').config();
const { API_KEY } = process.env;
const axios = require('axios');
const url = `https://eth-mainnet.g.alchemy.com/v2/${API_KEY}`;

async function getTotalBalance(addresses) {
    const batch = addresses.map((address, index) => ({
        jsonrpc: "2.0",
        id: index + 1,
        method: "eth_getBalance",
        params: [address, "latest"] // "latest" gets the current balance
    }));

    try {
        const response = await axios.post(url, batch);

        // Inspect response data if needed
        // console.log(response.data);

        // Calculate the total balance by summing all balances
        const totalBalance = response.data.reduce((total, res) => {
            const balanceInHex = res.result; // Balance in hex
            const balanceInEther = parseInt(balanceInHex, 16); // Convert to integer (Wei)
            return total + balanceInEther; // Sum up
        }, 0);
        console.log('Total balance in Wei:', totalBalance);
        // Convert the total balance from Wei to Ether (Ether = Wei / 10^18)
        return totalBalance;

    } catch (error) {
        console.error('Error fetching balances:', error);
        throw error;
    }
}

module.exports = getTotalBalance;