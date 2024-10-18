// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _member) external {
        members[_member] = true;
    }

    function isMember(address _member) view external returns(bool){
        bool isM = members[_member];
        return isM;
    }

    function removeMember(address _member) external{
        members[_member] = false;
    }
}