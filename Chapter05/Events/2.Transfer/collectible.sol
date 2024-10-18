// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;

    event Deployed(address whoDeployed);
    event Transfer(address, address);

    constructor(){
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address _recipient) external {
        require(msg.sender == owner, "Only the current owner can transfer the collectible");

        // Emit the Transfer event with the original owner's address and the new owner's address
        emit Transfer(owner, _recipient);

        // Transfer the ownership to the recipient
        owner = _recipient;
    }
}