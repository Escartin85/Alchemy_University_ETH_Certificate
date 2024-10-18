// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Prime.sol";

contract PrimeGame {
    // Function to determine if the current block number is prime
    function isWinner() public view returns (bool) {
        uint currentBlockNumber = block.number; // Get the current block number
        return Prime.isPrime(currentBlockNumber); // Use the Prime library to check if it's prime
    }
}