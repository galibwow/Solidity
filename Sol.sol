pragma solidity ^0.4.0;

contract Helloworldcontract {
    string private world="hello world";


    function setworld(string newworld)returns(string) {
        return world = newworld;

    }
    function getworld() constant returns(string) {
        return world;
    }
}