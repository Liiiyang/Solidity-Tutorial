pragma solidity ^0.4.0;

contract DataTypes {
    int8 myInt = -128;
    uint8 myUInt = 255;

    string myString;
    uint8[] myStringArr;

    byte myValue;
    bytes1 myBytes1;
    bytes32 myBytes32;

    //Finanical System use fix point number, not floating number
 //   fixed256x1 myFixed = 1; //255.0
  //  ufixed myfixed = 1;

  enum Action {ADD,REMOVE,UPDATE}

  Action myAction = Action.ADD;

  address myAddress;

  function assignAddress() {
      myAddress = msg.sender;
      //Find out balance of address
      myAddress.balance;
      //transfer amount of ether
      myAddress.transfer(10);
  }

  uint[] myIntArr = [1,2,3];

  function arrFunc() {
      myIntArr.push(1);
      myIntArr.length;
      myIntArr[0];
  }

  uint[10] myfixedArr;

  struct Account {
      uint balance;
      uint dailylimit;
  }

  Account myAccount;

  function structFunc() {
      myAccount.balance = 100;
  }

  mapping (address => Account) _accounts;

  //When make a payable function call to mappingFunc, pass any value into the balance, do not create a wallet
  //using this method, make sure the wallet is secure.
  //function mappingFunc() payable {
     // _accounts[msg.sender].balance += msg.value;
  //}

  function () payable {
      _accounts[msg.sender].balance += msg.value;
  }

  function getBalance() returns (uint) {
      return _accounts[msg.sender].balance;
  }

}
