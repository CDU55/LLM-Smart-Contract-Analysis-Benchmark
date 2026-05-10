// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11B41 {
    address private provider;

    constructor (address _provider) {
        require(_provider != address(0));
        provider = _provider;
    }

    function foo(string memory data)
        external
        returns (bytes memory)
    {
        (bool success, bytes memory processed) = provider.call(
            abi.encodeWithSignature("process(string)", data)
        );
        require(success, "Call to external contract failed");
        return processed;
    }
}

contract C11B42 {
    event Text(string message);

    function process(string calldata data) external returns (bytes memory) {
        emit Text(data);
        return abi.encodePacked("This is a malicious contract");
    }
}