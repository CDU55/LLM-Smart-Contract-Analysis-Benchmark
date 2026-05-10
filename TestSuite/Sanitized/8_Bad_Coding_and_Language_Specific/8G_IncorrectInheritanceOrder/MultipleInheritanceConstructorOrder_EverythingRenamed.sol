// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;


contract C88G11 {
    event ConstructorOrder(string, string);
    constructor() {
        emit ConstructorOrder("C88G11", "None");
    }
   function getName() public virtual returns (string memory) {
        return "C88G11";
    }
}

contract C88G12 is C88G11 {
    constructor() {
        emit ConstructorOrder("C88G12", "None");
    }
    function getName() public override virtual returns (string memory) {
        return "C88G12";
    }
}

contract C88G13 is C88G11 {
    constructor() {
        emit ConstructorOrder("C88G13", super.getName());
    }
    function getName() public override virtual returns (string memory) {
        return "C88G13";
    }
}

contract C88G14 is C88G12, C88G13 {
    constructor() C88G13() C88G12() {
        emit ConstructorOrder("C88G14", super.getName());
    }

    function getName() pure public override(C88G12, C88G13) returns (string memory) {
        return "C88G14";
    }
}