// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint _number) public pure returns (bool) {
        uint res = _number % 2;
        if(res == 0) return true;
        return false;
    }
}