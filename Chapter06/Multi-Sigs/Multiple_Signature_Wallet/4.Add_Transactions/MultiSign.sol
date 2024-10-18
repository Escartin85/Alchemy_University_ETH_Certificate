// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;

    constructor(address[] memory _owners, uint256 _required){
        // Revert if no owners are provided
        require(_owners.length > 0, "No owner addresses are sent");

        // Revert if required confirmations is zero
        require(_required > 0, "Number of required confirmations is zero");

         // Revert if required confirmations is more than the number of owners
        require(_required <= _owners.length, "Number of required confirmations is more than the total number of owner addresses");
        owners = _owners;
        required = _required;
    }
}
