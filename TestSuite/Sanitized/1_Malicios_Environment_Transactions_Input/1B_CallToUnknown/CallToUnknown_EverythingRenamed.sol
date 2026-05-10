// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C11B11 {
    mapping(address => bytes) public messages;
    mapping(address => address) private encryptionProviders;

    function encryptMessage(string memory message, address encryptionProvider)
        external
        returns (bytes memory)
    {
        require(encryptionProvider != address(0));
        (bool success, bytes memory encryptedText) = encryptionProvider.call(
            abi.encodeWithSignature("encrypt(string)", message)
        );
        require(success, "Call to external contract failed");
        messages[msg.sender] = encryptedText;
        encryptionProviders[msg.sender] = encryptionProvider;
        return encryptedText;
    }

    function decryptMessage(string memory message)
        external
        returns (bytes memory)
    {
        require(encryptionProviders[msg.sender] != address(0));
        (bool success, bytes memory decryptedText) = encryptionProviders[
            msg.sender
        ].call(abi.encodeWithSignature("decrypt(string)", message));
        require(success, "Call to external contract failed");
        return decryptedText;
    }
}

contract C11B12 {
    event Text(string message);

    function encrypt(string calldata message) external returns (bytes memory) {
        emit Text(message);
        return abi.encodePacked("This is a malicious contract");
    }

    function decrypt(bytes calldata) external pure returns (string memory) {
        return "This is not malicious contract";
    }
}
