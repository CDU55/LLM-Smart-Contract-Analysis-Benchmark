// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C99E21 {
    function compute(uint input) external pure returns (uint) {
        uint x = input;
        x = x * x;
        x = x / x;
        x = x + 1;
        return x;
    }
}

contract C99E22 {
    C99E21 computer;

    constructor (address compAddr) {
        computer = C99E21(compAddr);
    }

    function doSomeComputation(uint x) external view returns (uint) {
        return computer.compute{gas: gasleft()}(x);
    }
}
