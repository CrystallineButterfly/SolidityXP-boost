// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./IERC20Permit.sol";

contract GaslessTokenTransfer {
    function send(
        address token,
        address sender,
        address receiver,
        // Amount to send to receiver
        uint256 amount,
        // Fee paid to msg.sender
        uint256 fee,
        // Deadline for permit
        uint256 deadline,
        // Permit signature
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        // Permit
        IERC20Permit(token).permit(
            sender,
            address(this),
            amount + fee, 
            deadline,
            v, r, s);
         // Send amount to receiver
         IERC20Permit(token).transferFrom(sender, receiver, amount);
         // Take fee - send fee to msg.sender
         IERC20Permit(token).transferFrom(sender, msg.sender, fee);
            
    }
}