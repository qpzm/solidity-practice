// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
import "../lib/forge-std/src/console2.sol";

//  O
// A B
//  X
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
        // override(B, A) 이 순서는 의미가 없다.
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

    function bar() public override(B, A) {
        console2.log("bar: X2");
        super.bar();
    }
}

// L(B) = [B, O]
// L(A) = [A, O]
// X3 is B, A 에서 solidity는 A -> B 순서이므로 L(A), L(B), [A, B] 로 넣는다.
// L(X3) = [X3] + merge(L(A), L(B), [A, B])
//       = [X3] + merge([A, O], [B, O], [A, B])
//       = [X3, A] + merge([O], [B, O], [B]))
//       = [X3, A, B, O]
contract X3 is B, A {
    function foo() public override(B, A) {}

    function bar() public override(B, A) {
        console2.log("bar: X3");
        A.bar(); // A -> B -> O
        B.bar(); // B -> O
    }
}
