// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.29;

contract C66B21 {
    uint private data;

    constructor (uint _data) {
        data = _data;
    }

    function get() external view returns (uint) {
        return data;
    }
}