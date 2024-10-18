// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint public x;

    constructor(uint _number){
        x = _number;
    }

    function increment() external {
        x = x + 1;
    }
}