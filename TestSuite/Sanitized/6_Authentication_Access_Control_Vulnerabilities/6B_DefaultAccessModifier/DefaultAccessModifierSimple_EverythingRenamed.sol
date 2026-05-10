// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.17;

contract C66B11 {
    uint data;

    constructor (uint _data) {
        data = _data;
    }

    function get() external view returns (uint) {
        return data;
    }
}