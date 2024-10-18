// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;
    // Function to create a new proposal
    function newProposal(address _targetAddress, bytes memory _calldata) external {
        // Create a new proposal with the given question, creator, and initialize votes
        Proposal memory newProp = Proposal({
            target: _targetAddress,
            data: _calldata,
            yesCount: 0,
            noCount: 0
        });

        // Add the new proposal to the proposals array
        proposals.push(newProp);
    }

    // External function to cast a vote
    function castVote(uint proposalId, bool supportsProposal) external {
        // Validate that the proposalId is within the array's bounds
        require(proposalId < proposals.length, "Invalid proposalId");

        // Get the reference to the proposal by its ID
        Proposal storage proposal = proposals[proposalId];

        // Increment yesCount if supportsProposal is true, otherwise increment noCount
        if (supportsProposal) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }
    }

    // Function to retrieve the total number of proposals
    function getProposalsCount() external view returns (uint) {
        return proposals.length;
    }
}
