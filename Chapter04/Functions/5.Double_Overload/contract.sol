// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint _number) external pure returns (uint){
        return _number * 2;
    }

    function double(uint _n1, uint _n2) external pure returns (uint, uint){
        return (_n1 * 2, _n2 * 2);
    }
}