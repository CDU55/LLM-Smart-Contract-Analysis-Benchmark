// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract DeadCodeFIxed {
    mapping(address => uint256) private _participants;

    constructor() {
        _participants[msg.sender] = 0;
    }

    function deposit(uint256 option) external {
        _participants[msg.sender] = option;
    }
}
