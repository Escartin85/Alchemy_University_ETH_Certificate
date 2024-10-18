// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint public totalSupply = 0;
    string public name = "escar";
    string public symbol = "src";
    uint8 public decimals = 18;

    mapping(address => uint256) public balances;

    constructor(){
        totalSupply = 1000 * (10**decimals);
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address _account) external view returns (uint) {
        return balances[_account];
    }

    function transfer(address _recipient, uint _amount) public returns (bool) {
        // Ensure that the sender has enough balance
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Subtract the amount from the sender's balance
        balances[msg.sender] -= _amount;

        // Add the amount to the recipient's balance
        balances[_recipient] += _amount;
        // Return true to indicate the transfer was successful
        return true;
    }
}