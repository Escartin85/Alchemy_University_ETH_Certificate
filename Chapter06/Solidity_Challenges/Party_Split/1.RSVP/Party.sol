// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
	uint256 public depositAmount;
    mapping(address => bool) public hasRSVPed;

    // Constructor to set the deposit amount
    constructor(uint256 _amount){
        depositAmount = _amount;
    }

    // Function to RSVP to the party
    function rsvp() external payable{
        // Ensure the exact deposit amount is sent
        require(msg.value == depositAmount, "Incorrect deposit amount");

        // Ensure the address has not already RSVP'd
        require(!hasRSVPed[msg.sender], "You have already RSVP'd");

        // Mark the address as having RSVP'd
        hasRSVPed[msg.sender] = true;
    }
}