// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function filterEven(uint[] memory _numbers) external pure returns (uint[] memory) {
        // First, count the number of even numbers to initialize the array size
        uint evenCount = 0;

        for(uint i=0; i<_numbers.length; i++){
            // Check if the number is even (remainder when divided by 2 is 0)
            if (_numbers[i] % 2 == 0){
                evenCount++;
            }
        }

        // Create a new memory array with the exact size for even numbers
        uint[] memory evens = new uint[](evenCount);
        uint j = 0;
        
        // Populate the new array with even numbers
        for (uint i = 0; i < _numbers.length; i++) {
            if (_numbers[i] % 2 == 0) {
                evens[j] = _numbers[i];
                j++;
            }
        }

        // Return the array containing only even numbers
        return evens;
    }
}