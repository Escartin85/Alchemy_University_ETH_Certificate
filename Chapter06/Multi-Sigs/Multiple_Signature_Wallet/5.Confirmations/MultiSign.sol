// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;
    uint256 public transactionIndex;

    struct Transaction{
        address destination;
        uint256 value;
        bool executed;
    }

    mapping(uint256 => Transaction) public transactions;
    mapping(uint256 => mapping(address => bool)) public confirmations;

    constructor(address[] memory _owners, uint256 _required){
        // Revert if no owners are provided
        require(_owners.length > 0, "No owner addresses are sent");

        // Revert if required confirmations is zero
        require(_required > 0, "Number of required confirmations is zero");

         // Revert if required confirmations is more than the number of owners
        require(_required <= _owners.length, "Number of required confirmations is more than the total number of owner addresses");
        owners = _owners;
        required = _required;
    }

    function transactionCount() external view returns (uint256){
        return transactionIndex;
    }

    // Function to create a new transaction and store it
    function addTransaction(address _destination, uint256 _value) public returns (uint256) {
        // Add a new transaction to the mapping
        transactions[transactionIndex] = Transaction({
            destination: _destination,
            value: _value,
            executed: false
        });
        // Return the current transaction index and then increment it for the next transaction
        return transactionIndex++;
    }
}
