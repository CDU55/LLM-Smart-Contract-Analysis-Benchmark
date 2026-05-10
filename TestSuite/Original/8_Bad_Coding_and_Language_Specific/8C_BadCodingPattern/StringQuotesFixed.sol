// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract StringQuotesFixed {
    function getSecretMessage(string calldata name)
        external
        pure
        returns (string memory)
    {
        return string(abi.encodePacked("Hello", " ", name, "!"));
    }
}
