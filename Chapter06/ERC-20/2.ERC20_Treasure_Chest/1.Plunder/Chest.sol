// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Chest {
    // Function to plunder all tokens from Chest to msg.sender
    function plunder(address[] calldata tokenAddresses) external {
        // Iterate over each token address in the array
        for (uint i = 0; i < tokenAddresses.length; i++) {
            // Create an instance of the ERC20 token at this address
            IERC20 token = IERC20(tokenAddresses[i]);
            
            // Get the balance of the Chest contract in this token
            uint256 chestBalance = token.balanceOf(address(this));
            
            // Transfer the entire balance to the msg.sender
            if (chestBalance > 0) {
                token.transfer(msg.sender, chestBalance);
            }
        }
    }
}
