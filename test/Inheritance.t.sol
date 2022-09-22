pragma solidity 0.8.9;

import "forge-std/Test.sol";
import "../src/Inheritance.sol";

contract InheritanceTest is Test {
    X1 x1;
    X2 x2;
    X3 x3;

    function setUp() public {
        x1 = new X1();
        x2 = new X2();
        x3 = new X3();
    }

    function testFoo() public {
        console2.log("x1.foo()");
        x1.foo();
        console2.log("x2.foo()");
        x2.foo();
    }

    function testBar() public {
        console2.log("x1.bar()");
        x1.bar();
        console2.log("x2.bar()");
        x2.bar();
        console2.log("x3.bar()");
        x3.bar();
    }
}
