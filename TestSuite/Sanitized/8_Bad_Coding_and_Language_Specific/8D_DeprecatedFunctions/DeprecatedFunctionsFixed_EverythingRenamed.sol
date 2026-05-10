// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88D21 {
    mapping(address => uint256) private _applicants;
    uint256 public deadlineTimestamp;

    constructor(uint256 _deadlineTimestamp) {
        deadlineTimestamp = _deadlineTimestamp;
    }

    function receiveApplication() external {
        require(
            block.timestamp < deadlineTimestamp,
            "The deadline for applications has been reached"
        );
        _applicants[msg.sender] = 1;
    }
}
