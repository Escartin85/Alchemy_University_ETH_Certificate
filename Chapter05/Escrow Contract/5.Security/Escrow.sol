// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    bool public isApproved;

    constructor(address _arbiter, address _beneficiary)payable{
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
        isApproved = false;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only Arbiter can call this function");
        (bool sent, ) = beneficiary.call{ value: address(this).balance }("");
        require(sent, "Failed to send ether from this Smart Contract to Beneficiary");
        isApproved = true;
    }
}