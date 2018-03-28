pragma solidity ^0.4.0;

import "browser/library.sol";

contract TestLibrary {
    using IntExtended for uint;

    function testIncrement(uint _base) returns (uint) {
        //return _base.increment();
        return IntExtended.increment(_base);
    }

    function testDecrement(uint _base) returns (uint) {
        //return _base.decrement();
        return IntExtended.decrement(_base);
    }

    function testIncrementbyValue(uint _base, uint _value) returns (uint) {
        return _base.incrementbyValue(_value);
    }

    function testDecrementbyValue(uint _base, uint _value) returns (uint) {
        return _base.decrementbyValue(_value);
    }


}
