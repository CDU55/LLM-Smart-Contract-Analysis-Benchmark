// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88J41 {
    uint256 constant interestRate = 10;

    function calculateTotalInterest(uint256 amount)
        external
        pure
        returns (uint256)
    {
        uint256 total = (amount / 100) * interestRate;
        return total;
    }
}
