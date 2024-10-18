// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {

    address public owner;

    constructor() payable{
        require(msg.value >= 1 ether, "You must send at least 1 ether");
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw funds"); // Solo el propietario puede retirar

        uint256 contractBalance = address(this).balance; // Obtener el balance del contrato
        require(contractBalance > 0, "No funds available to withdraw"); // Asegurar que haya fondos

        (bool success, ) = owner.call{ value: contractBalance }("");
        require(success, "Withdrawal failed");
    }
}