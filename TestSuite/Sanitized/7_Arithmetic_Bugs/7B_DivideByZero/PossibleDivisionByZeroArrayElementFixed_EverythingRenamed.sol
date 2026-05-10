// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C77B71 {
    uint[] public values;

    constructor () {
        values = [1,2,3,0,5];
    }

    function getSomeResult(uint numerator) external view returns (uint) {
        return numerator / values[2];
    }
}
