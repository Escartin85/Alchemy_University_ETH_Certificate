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
}
