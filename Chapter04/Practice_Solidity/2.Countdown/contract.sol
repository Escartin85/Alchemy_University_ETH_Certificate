// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;
    uint8 public ticks = 0;

    constructor(){
        owner = msg.sender;

    }
    function tick() external {
        ticks++;
        if(ticks >= 10){
            selfdestruct(payable(owner));
        }
    }
}