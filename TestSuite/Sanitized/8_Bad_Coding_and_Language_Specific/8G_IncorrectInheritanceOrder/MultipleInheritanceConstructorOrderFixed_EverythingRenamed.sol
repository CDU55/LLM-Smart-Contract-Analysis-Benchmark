// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;


contract C88G21 {
    event ConstructorOrder(string, string);
    constructor() {
        emit ConstructorOrder("C88G21", "None");
    }
   function getName() public virtual returns (string memory) {
        return "C88G21";
    }
}

contract C88G22 is C88G21 {
    constructor() {
        emit ConstructorOrder("C88G22", "None");
    }
    function getName() public override virtual returns (string memory) {
        return "C88G22";
    }
}

contract C88G23 is C88G21 {
    constructor() {
        emit ConstructorOrder("C88G23", super.getName());
    }
    function getName() public override virtual returns (string memory) {
        return "C88G23";
    }
}

contract C88G24 is C88G22, C88G23 {
    constructor() {
        emit ConstructorOrder("C88G14", super.getName());
    }

    function getName() pure public override(C88G22, C88G23) returns (string memory) {
        return "C88G14";
    }
}