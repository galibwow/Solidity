pragma solidity ^0.4.0;

contract CustomerContract {
address client = msg.sender;
bool _switch=false;
event UpdateStatus(string _msg, uint val);

modifier ifclient() {
    
    if(client != msg.sender){
        throw;
    }
    _;
}
function deposit() payable {
    UpdateStatus("User has deposite some money", msg.value);
    
}

function withdraw(uint amount) ifclient returns(uint){
    if(client.send(amount)){
        UpdateStatus('user transfer some money',msg.value);
        _switch=true;
    }
    else{
       _switch;
    }
}

function getamount() ifclient  constant returns (uint){
    
    return this.balance;
}





}

