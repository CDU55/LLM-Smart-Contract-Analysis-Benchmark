// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract ChecksEffectsInteractionsTransfer {
    mapping(address => uint) private balance;

    function deposit() external payable {
        balance[msg.sender] = msg.value;
    }

    function withdraw() external {
        uint addrBal = balance[msg.sender];
        payable(msg.sender).transfer(addrBal);
        balance[msg.sender] = 0;
    }
}