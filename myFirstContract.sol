pragma solidity ^0.4.0;
/*
Tutorial on solidity
Tan Li Yang 28/03/18
*/

interface Regulator {
    function checkValue(uint amount) external returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator{
    //internal => Can only be accessed by myFirstContact and not anywhere else
    uint private value;
    //Allows the certain functions to be used only by owner
    address private owner;

    modifier ownerFunc {
        require(owner == msg.sender) ;
            _;
    }

    function Bank(uint amount)  {
        value = amount;
        owner = msg.sender;
    }

    //Adding ownerFunc only accessible by owner
    function deposit(uint amount) ownerFunc {
        value+= amount;
    }
    function withdraw(uint amount) ownerFunc {
        if (this.checkValue(amount)) {
            value-=amount;
        }
    }
    function balance() view returns (uint){
        return value;
    }

    // no abstract class in solidity, a way to get around it
    //function loan() returns (bool);

    function checkValue(uint amount) external returns(bool){
        return amount<=value;
    }

    // no abstract class in solidity, a way to get around it
    function loan() returns (bool){
        return value>0;
    }

}

contract myFirstContact is Bank(10) {
    string private name; //Unlike in Java, where it is private string name
    //signed variable => can be positive and negative
    //unsigned variable => only positive
    uint private age;

    function setName(string newName){
        name = newName;
    }

    function getName() view returns (string){
        return name;
    }

    function setAge(uint newAge){
        age = newAge;
    }

    function getAge() view returns (uint){
        return age;
    }
}
