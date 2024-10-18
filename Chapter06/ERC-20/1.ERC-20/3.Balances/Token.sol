// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint public totalSupply = 0;
    string public name = "escar";
    string public symbol = "src";
    uint8 public decimals = 18;

    mapping(address => uint256) public balances;

    function balanceOf(address _account) external view returns (uint) {
        return balances[_account];
    }
}