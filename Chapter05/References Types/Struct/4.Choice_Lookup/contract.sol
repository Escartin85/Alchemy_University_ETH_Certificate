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
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address _voterAddress) external view returns (bool){
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
	}
}