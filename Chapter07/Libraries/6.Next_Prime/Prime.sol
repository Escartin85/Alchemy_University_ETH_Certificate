// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint n1, uint n2) public pure returns (bool){
        if(n1 % n2 == 0) return true;
        return false;
    }

    // Function to check if a number is prime
    function isPrime(uint number) public pure returns (bool) {
        // Numbers less than 2 are not prime
        if (number < 2) {
            return false;
        }
        
        // Check for divisors from 2 up to sqrt(number)
        for (uint i = 2; i * i <= number; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        
        // If no divisors were found, the number is prime
        return true;
    }
}