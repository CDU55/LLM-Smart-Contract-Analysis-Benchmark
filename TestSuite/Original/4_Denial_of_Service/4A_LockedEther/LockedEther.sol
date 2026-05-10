// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract LockedEther {
    mapping(address => uint256) private _balance;

    function deposit(uint256 amount) external payable {
        require(msg.value == amount, "Incorrect amount");
        _balance[msg.sender] = amount;
    }
}
