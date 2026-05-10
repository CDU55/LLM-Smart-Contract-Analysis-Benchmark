// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract DivideByZeroDirect {
    function divide(uint256 number1, uint256 number2)
        public
        pure
        returns (uint256)
    {
        return number1 / (number2 - number2);
    }
}
