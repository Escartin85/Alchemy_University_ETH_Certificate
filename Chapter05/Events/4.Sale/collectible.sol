// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    address public owner;
    uint public price;
    bool public isForSale;
    
    event Deployed(address whoDeployed);
    event Transfer(address, address);
    event ForSale(uint price, uint currentBlock);
    event Purchase(uint purchaseAmount, address indexed buyer);

    constructor(){
        isForSale = false;    // Initially not for sale
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function transfer(address _recipient) external onlyOwner{
        // Emit the Transfer event with the original owner's address and the new owner's address
        emit Transfer(owner, _recipient);

        // Transfer the ownership to the recipient
        owner = _recipient;
    }

    // Function to mark the collectible for sale at a specific price
    function markPrice(uint _price) external onlyOwner{
        require(_price > 0, "Price must be greater than zero");
        price = _price;
        isForSale = true;  // Mark the collectible as for sale
    }

    // Function to purchase the collectible
    function purchase() external payable{
        require(isForSale, "The collectible is not for sale");
        require(msg.value == price, "Incorrect price sent");

        // Transfer the purchase amount to the owner
        (bool success, ) = owner.call{ value: msg.value }("");
        require(success, "Transfer to the seller failed");

        // Emit the Purchase event
        emit Purchase(msg.value, msg.sender);

        // Transfer ownership and mark the collectible as not for sale
        owner = msg.sender;
        isForSale = false;  // The collectible is no longer for sale
        price = 0;          // Reset the price
    }

}