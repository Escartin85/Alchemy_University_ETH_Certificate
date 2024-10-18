// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    address[] public members;

    function addMember(address _newMember) external {
        members.push(_newMember);
    }

    function isMember(address _member) public view returns (bool){
        bool isMem = false;
        for(uint i = 0; i<members.length; i++){
            if(members[i] == _member){
                isMem = true;
            }
        }

        return isMem;
    }
}