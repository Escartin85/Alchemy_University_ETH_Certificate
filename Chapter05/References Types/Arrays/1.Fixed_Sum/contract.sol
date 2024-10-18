// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function sum(uint[5] memory _numbers) external pure returns(uint){
        uint totalSum = 0;
        for(uint i = 0; i<5; i++){
            totalSum = totalSum + _numbers[i];
        }
        return totalSum;
    }
}