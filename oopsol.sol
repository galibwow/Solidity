pragma solidity ^0.4.0;

contract Partial {
CallerContact tobeCalled=new CallerContact();
 
 function getNumbers() constant returns(uint) {
 return tobeCalled.getNumber();
}

 function getStrings() constant returns(bytes32) {
     return tobeCalled.getString();
 }

}




contract CallerContact {

uint number=42;
bytes32 hello="Hello galib" ;

function getNumber() constant returns (uint) {
return number;

}

function getString() constant returns (bytes32) {
return hello;

}
}