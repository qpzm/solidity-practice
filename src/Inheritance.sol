// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
import "../lib/forge-std/src/console2.sol";

contract O {
    function bar() public virtual {
        console2.log("bar: O");
    }
}

contract A is O {
    function foo() public virtual {
        console2.log("foo: A");
    }

    function bar() public virtual override {
        console2.log("bar: A");
        super.bar();
    }
}

contract B is O {
    function foo() public virtual {
        console2.log("foo: B");
    }

    function bar() public virtual override {
        console2.log("bar: B");
        super.bar();
    }
}

contract X1 is A, B {
    function foo() public override(A, B) {
        console2.log("foo: X1");
        super.foo();
    }

    function bar() public override(B, A) {
        console2.log("bar: X1");
        super.bar();
    }
}

// contract X2 is A, O {
contract X2 is B, A {
    function foo() public override(B, A) {
        console2.log("foo: X2");
        super.bar();
    }

    function bar() public override(A, B) {
        console2.log("bar: X2");
        super.bar();
    }
}

contract X3 is B, A {
    function foo() public override(B, A) {}

    function bar() public override(A, B) {
        console2.log("bar: X3");
        A.bar();
        B.bar();
    }
}
