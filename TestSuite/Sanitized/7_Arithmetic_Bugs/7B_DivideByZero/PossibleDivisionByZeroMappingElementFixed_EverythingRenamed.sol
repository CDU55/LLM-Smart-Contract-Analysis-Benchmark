// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C77B121 {
    mapping(bool => uint) public values;

    constructor () {
        values[true] = 1;
        values[false] = 0;
    }

    function divide(uint numerator) external view returns (uint) {
        return numerator / values[true];
    }
}
