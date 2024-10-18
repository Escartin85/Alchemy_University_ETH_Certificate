// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract StackClub {
    address[] public members;

    // Constructor that adds the deployer as the first member of the club
    constructor(){
        members.push(msg.sender);
    }

    // Modifier to check if the caller is an existing member
    modifier onlyMember() {
        bool isMem = false;
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == msg.sender) {
                isMem = true;
                break;
            }
        }
        require(isMem, "Caller is not a member");
        _;
    }

    // External function to add a new member (can only be called by an existing member)
    function addMember(address _newMember) external onlyMember{
        members.push(_newMember);
    }

    // Getter function to check if a specific address is a member
    function isMember(address _member) public view returns (bool){
        for(uint i = 0; i<members.length; i++){
            if(members[i] == _member){
                return true;
            }
        }

        return false;
    }

    // External function to remove the last member (can only be called by an existing member)
    function removeLastMember() external {
        require(members.length > 0, "No members to remove");
        members.pop();
    }

    // Getter function to retrieve the total number of members
    function getMembersCount() external view returns (uint) {
        return members.length;
    }
}