// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity){
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable{}

    function tip() public payable {
        (bool s, ) = owner.call{ value: msg.value }("");
        require(s);
    }

    function donate() public {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to donate");

        (bool s,) = charity.call{ value: contractBalance }("");
        require(s, "Donation to charity failed");
    }
}