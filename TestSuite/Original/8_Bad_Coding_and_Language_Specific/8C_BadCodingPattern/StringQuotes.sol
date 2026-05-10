// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract StringQuotes {
    function getSecretMessage(string calldata name)
        external
        pure
        returns (string memory)
    {
        return string(abi.encodePacked('Hello', ' ', name, '!'));
    }
}
