// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
	uint256 public depositAmount;
    mapping(address => bool) public hasRSVPed;
    address[] public members;  // Store the addresses of RSVP'd members
    address public owner;      // Store the address of the contract deployer (owner)

    // Constructor to set the deposit amount
    constructor(uint256 _amount){
        depositAmount = _amount;
        //owner = msg.sender;
        //members.push(owner);  // Add the owner as the first member
        //hasRSVPed[owner] = true;
    }

    // Function to RSVP to the party
    function rsvp() external payable{
        // Ensure the exact deposit amount is sent
        require(msg.value == depositAmount, "Incorrect deposit amount");

        // Ensure the address has not already RSVP'd
        require(!hasRSVPed[msg.sender], "You have already RSVP'd");

        // Add the new member to the members array
        members.push(msg.sender);  
        // Mark the address as having RSVP'd
        hasRSVPed[msg.sender] = true;
        
    }

    // Function to pay the bill and distribute remaining funds
    function payBill(address _venue, uint _billAmount) external {
        // Ensure there are enough funds in the contract
        require(address(this).balance >= _billAmount, "Insufficient funds");

        // Pay the venue the bill amount
        (bool success, ) = _venue.call{ value: _billAmount }("");
        require(success, "Payment to the venue failed");

        // Calculate the amount left to be refunded
        uint256 remainingBalance = address(this).balance;
        uint256 refundPerMember = remainingBalance / members.length;
        
        // Refund the remaining balance equally among the members
        for (uint256 i = 0; i < members.length; i++) {
            (bool refundSuccess, ) = members[i].call{value: refundPerMember}("");
            require(refundSuccess, "Failed to refund a member");
        }
    }

    // Helper function to get the balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}