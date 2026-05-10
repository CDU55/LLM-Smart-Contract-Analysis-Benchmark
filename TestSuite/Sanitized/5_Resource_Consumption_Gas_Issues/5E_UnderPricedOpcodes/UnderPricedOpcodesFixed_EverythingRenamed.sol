// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract C55E21 {
    function performHash(string calldata secret)
        external
        pure
        returns (bytes32 secretHashed)
    {
        return keccak256(abi.encode(secret));
    }
}
