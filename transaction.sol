pragma solidity ^0.4.0;

contract Transaction {

    event SenderLogger(address);
    event ValueLogger(uint);

    address private owner;

    modifier isOwner {
        require (owner == msg.sender);
        _;
    }

    //Transaction must have at least 1 ether
    modifier validValue {
        assert(msg.value>=1 ether);
        _;
    }

    function Transaction(){
        owner = msg.sender;
    }

    //fallback function
    //Only works if the owner is doing the Transaction and must have a valid value
    function () payable isOwner validValue {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
    }
}
