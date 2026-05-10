// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C88J31 {
    uint256 constant interestRate = 10;

    function calculateTotalInterest(uint256 amount)
        external
        pure
        returns (uint256)
    {
        uint256 total;
        total = (amount / 100) * interestRate;
        total = (amount / 100) * interestRate;
        return total;
    }
}
