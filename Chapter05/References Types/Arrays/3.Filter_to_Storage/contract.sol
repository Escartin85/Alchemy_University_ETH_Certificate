// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint[] public evenNumbers;

    function filterEven(uint[] memory _numbers) external{
        
        for(uint i=0; i<_numbers.length; i++){
            // Check if the number is even (remainder when divided by 2 is 0)
            if (_numbers[i] % 2 == 0){
                evenNumbers.push(_numbers[i]);
            }
        }
    }
}