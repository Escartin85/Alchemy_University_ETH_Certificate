// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    // Array to store all proposals
    Proposal[] public proposals;

    // Mapping to store if a voter has already voted on each proposal
    mapping(uint => mapping(address => bool)) public hasVoted;

    // Mapping to store the voter's actual vote on each proposal
    mapping(uint => mapping(address => bool)) public votes;

    // Mapping to track allowed members who can create proposals and vote
    mapping(address => bool) public isMember;

    // Event triggered when a new proposal is created
    event ProposalCreated(uint proposalId);

    // Event triggered when a vote is cast
    event VoteCast(uint proposalId, address voter);

    // Constructor that takes an array of member addresses and adds them as voting members
    constructor(address[] memory members) {
        // Add the deployer of the contract as a member
        isMember[msg.sender] = true;

        // Add all addresses in the input array as members
        for (uint i = 0; i < members.length; i++) {
            isMember[members[i]] = true;
        }
    }

    // Function to retrieve the total number of proposals
    function getProposalsCount() external view returns (uint) {
        return proposals.length;
    }

    // Function to create a new proposal
    function newProposal(address _targetAddress, bytes memory _calldata) external {
        // Ensure that only members can create proposals
        require(isMember[msg.sender], "Only members can create proposals");

        // Create a new proposal with the given question, creator, and initialize votes
        Proposal memory newProp = Proposal({
            target: _targetAddress,
            data: _calldata,
            yesCount: 0,
            noCount: 0
        });

        // Add the new proposal to the proposals array
        proposals.push(newProp);

        // Emit the ProposalCreated event with the proposal ID
        emit ProposalCreated(proposals.length - 1);
    }

    // External function to cast or change a vote
    function castVote(uint proposalId, bool supportsProposal) external {
        // Ensure that only members can vote
        require(isMember[msg.sender], "Only members can vote");
        
        // Validate that the proposalId is within the array's bounds
        require(proposalId < proposals.length, "Invalid proposalId");

        // Get the reference to the proposal by its ID
        Proposal storage proposal = proposals[proposalId];

        // Check if the voter has already voted
        if (hasVoted[proposalId][msg.sender]) {
            // Get the user's previous vote
            bool previousVote = votes[proposalId][msg.sender];

            // If the previous vote was "yes" and the current vote is "no", decrement yesCount and increment noCount
            if (previousVote == true && supportsProposal == false) {
                proposal.yesCount--;
                proposal.noCount++;
            }
            // If the previous vote was "no" and the current vote is "yes", decrement noCount and increment yesCount
            else if (previousVote == false && supportsProposal == true) {
                proposal.noCount--;
                proposal.yesCount++;
            }
        } else {
            // First-time voting: increment the appropriate vote count
            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }

            // Mark that the user has voted
            hasVoted[proposalId][msg.sender] = true;
        }

        // Record the voter's new vote
        votes[proposalId][msg.sender] = supportsProposal;

        // Emit the VoteCast event with the proposal ID and voter's address
        emit VoteCast(proposalId, msg.sender);
    }

    
}
