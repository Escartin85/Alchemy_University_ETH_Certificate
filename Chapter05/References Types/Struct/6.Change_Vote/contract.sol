// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function createVote(Choices choice) external {
		// Ensure the voter hasn't already voted
        require(!hasVoted(msg.sender), "You can only vote once.");
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address _voterAddress) public view returns (bool){
		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == _voterAddress) return true;
		}
		return false;
	}

	function findChoice(address _voterAddress) external view returns (Choices choiceVoter){
		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == _voterAddress){
				return votes[i].choice;
			} 
		}
		// If the voter has not voted, this function should revert
        revert("Voter has not cast a vote.");
	}

	function changeVote(Choices _choice) external{
		for(uint i=0; i<votes.length; i++){
			if(votes[i].voter == msg.sender){
				votes[i].choice = _choice;
			} 
		}
		// If they do not have an existing vote, revert the transaction
        revert("Voter has not cast a vote.");
	}
}