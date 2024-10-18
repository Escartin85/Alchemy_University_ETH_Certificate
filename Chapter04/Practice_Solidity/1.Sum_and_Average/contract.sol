pragma solidity ^0.8.4;

contract Contract {
    function sumAndAverage(uint n1, uint n2, uint n3, uint n4) pure external returns(uint, uint){
        uint sum = n1 + n2 + n3 + n4;
        uint average = sum / 4;
        return (sum, average);
    }
}