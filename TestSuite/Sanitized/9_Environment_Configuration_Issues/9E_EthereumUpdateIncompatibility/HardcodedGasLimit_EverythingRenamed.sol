// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C99E11 {
    function compute(uint input) external pure returns (uint) {
        uint x = input;
        x = x * x;
        x = x / x;
        x = x + 1;
        return x;
    }
}

contract C99E12 {
    C99E11 computer;

    constructor (address compAddr) {
        computer = C99E11(compAddr);
    }

    function doSomeComputation(uint x) external view returns (uint) {
        return computer.compute{gas: 2000}(x);
    }
}
