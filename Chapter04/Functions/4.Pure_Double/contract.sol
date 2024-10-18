// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint _number) external pure returns (uint){
        return _number * 2;
    }
}