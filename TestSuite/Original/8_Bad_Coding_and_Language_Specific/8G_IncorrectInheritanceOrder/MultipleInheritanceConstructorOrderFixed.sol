// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;


contract Top {
    event ConstructorOrder(string, string);
    constructor() {
        emit ConstructorOrder("Top", "None");
    }
   function getName() public virtual returns (string memory) {
        return "Top";
    }
}

contract Sibling1 is Top {
    constructor() {
        emit ConstructorOrder("Sibling1", "None");
    }
    function getName() public override virtual returns (string memory) {
        return "Sibling1";
    }
}

contract Sibling2 is Top {
    constructor() {
        emit ConstructorOrder("Sibling2", super.getName());
    }
    function getName() public override virtual returns (string memory) {
        return "Sibling2";
    }
}

contract MultipleInheritanceConstructorOrderFixed is Sibling1, Sibling2 {
    constructor() {
        emit ConstructorOrder("Bottom", super.getName());
    }

    function getName() pure public override(Sibling1, Sibling2) returns (string memory) {
        return "Bottom";
    }
}