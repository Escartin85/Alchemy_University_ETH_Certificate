// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Switch {
    address public owner;
    address public recipient;
    uint256 public lastActivity;
    uint256 constant timeout = 52 weeks;

    constructor(address _recipient) payable {
        owner = msg.sender;           // Set the deployer as the owner
        recipient = _recipient;       // Set the recipient address
        lastActivity = block.timestamp; // Record the time of deployment as the last activity
    }

    // Function to ping the contract and reset the last activity time
    function ping() external {
        require(msg.sender == owner, "Only the owner can ping the switch");
        lastActivity = block.timestamp;  // Update the last activity time
    }

    // Function for the recipient to withdraw the funds after the inactivity period
    function withdraw() external {
        require(msg.sender == recipient, "Only the recipient can withdraw the funds");
        require(block.timestamp >= lastActivity + timeout, "52 weeks of inactivity required");
        
        // Transfer all funds to the recipient
        payable(recipient).transfer(address(this).balance);
    }

    // Fallback function to allow contract to receive Ether
    receive() external payable {}
}