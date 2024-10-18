// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint n1, uint n2) public pure returns (bool){
        if(n1 % n2 == 0) return true;
        return false;
    }
}