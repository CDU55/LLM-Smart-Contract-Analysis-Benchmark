// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;

contract FunctionOrder {
    function somethingPrivate() private {}

    function somethingInternal() internal {}

    function somethingPublic() public {}

    function somethingExternal() external {}

    receive() external payable {}

    constructor() {}
}
