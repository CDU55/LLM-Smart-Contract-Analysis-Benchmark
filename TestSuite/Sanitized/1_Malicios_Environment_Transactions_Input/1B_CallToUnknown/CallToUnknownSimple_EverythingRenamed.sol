// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11B31 {

    function foo(string memory data, address provider)
        external
        returns (bytes memory)
    {
        require(provider != address(0));
        (bool success, bytes memory processed) = provider.call(
            abi.encodeWithSignature("process(string)", data)
        );
        require(success, "Call to external contract failed");
        return processed;
    }
}

contract C11B32 {
    event Text(string message);

    function process(string calldata data) external returns (bytes memory) {
        emit Text(data);
        return abi.encodePacked("This is a malicious contract");
    }
}