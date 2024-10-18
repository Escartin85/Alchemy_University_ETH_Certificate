// SPDX-License-Identifier: MIT
//pragma solidity 0.7.5;
pragma solidity ^0.8.4;

contract Contract {
	uint public value;

	function modify(uint _value) external {
		value = _value;
	}
}