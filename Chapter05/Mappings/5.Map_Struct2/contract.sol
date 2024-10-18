// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		require(!users[msg.sender].isActive, "User already exists");
		
		users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
	}

	function transfer(address _recipient, uint _amount) external {
		// Check that the sender has an active user
        require(users[msg.sender].isActive, "Sender does not have an active user");
        // Check that the recipient has an active user
        require(users[_recipient].isActive, "Recipient does not have an active user");
        // Check that the sender has sufficient balance
        require(users[msg.sender].balance >= _amount, "Insufficient balance");
		
		// Perform the transfer
        users[msg.sender].balance -= _amount; // Subtract the amount from the sender
        users[_recipient].balance += _amount;   // Add the amount to the recipient
	}
}