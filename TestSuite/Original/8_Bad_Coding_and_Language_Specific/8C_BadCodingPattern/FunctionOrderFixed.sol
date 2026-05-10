// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract FunctionOrder {
    constructor() {}

    receive() external payable {}

    function somethingExternal() external {}

    function somethingPublic() public {}

    function somethingInternal() internal {}

    function somethingPrivate() private {}
}
