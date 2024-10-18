// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	enum Choices { Yes, No }

	// TODO: create a vote struct and a public state variable
	struct Vote {
		Choices choice;
		address voter;
	}

	// Public state variable to store the current vote
	Vote public vote;
	
	// Function to create a new vote with the given choice
	function createVote(Choices _choice) external {
		// TODO: create a new vote
		vote = Vote({
			choice: _choice,
			voter: msg.sender
		});
	}
}