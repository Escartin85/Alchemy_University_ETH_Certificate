// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;
    uint256 public transactionIndex;

    struct Transaction{
        address destination;
        uint256 value;
        bool executed;
    }

    mapping(uint256 => Transaction) public transactions;
    mapping(uint256 => mapping(address => bool)) public confirmations;
    // Check if an address is an owner
    mapping(address => bool) public isOwner; 
    constructor(address[] memory _owners, uint256 _required){
        // Revert if no owners are provided
        require(_owners.length > 0, "Owners required, No owner addresses are sent");

        // Revert if required confirmations is zero
        require(_required > 0, "Number of required confirmations is zero");

         // Revert if required confirmations is more than the number of owners
        require(_required <= _owners.length, "Number of required confirmations is more than the total number of owner addresses");
        
        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner address");
            require(!isOwner[owner], "Owner is already added");
            isOwner[owner] = true;
            owners.push(owner);
        }
        required = _required;

    }

    // View function to return the total number of transactions
    function transactionCount() external view returns (uint256){
        return transactionIndex;
    }

    // Function to create a new transaction and store it
    function addTransaction(address _destination, uint256 _value) internal returns (uint256) {
        // Add a new transaction to the mapping
        transactions[transactionIndex] = Transaction({
            destination: _destination,
            value: _value,
            executed: false
        });
        // Return the current transaction index and then increment it for the next transaction
        return transactionIndex++;
    }

    // Confirm a transaction
    function confirmTransaction(uint _transactionId) public {
        require(isOwner[msg.sender], "Only owners can confirm transactions");
        require(transactions[_transactionId].destination != address(0), "Transaction does not exist");
        require(!confirmations[_transactionId][msg.sender], "Transaction already confirmed by this owner");

        // Record the confirmation by this owner
        confirmations[_transactionId][msg.sender] = true;
    }

    // Get confirmation count for a specific transaction
    function getConfirmationsCount(uint _transactionId) public view returns (uint256 count) {
        require(transactions[_transactionId].destination != address(0), "Transaction does not exist");

        // Iterate through all owners and count confirmations
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[_transactionId][owners[i]]) {
                count++;
            }
        }
    }

    function submitTransaction(address _destination, uint256 _value) external {
        confirmTransaction(addTransaction(_destination, _value));
    }

    // Payable receive function to accept funds
    receive() external payable {
        // This function allows the contract to receive Ether
    }
}
