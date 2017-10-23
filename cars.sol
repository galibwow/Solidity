2500,"Nissan","GT-500","45-op"

pragma solidity ^0.4.0;

contract converters{
    
   function stringToBytes32(string memory source) returns (bytes32 result) {
    assembly {
        result := mload(add(source, 32))
    }
} 
   
    function bytes32ToString(bytes32 x) constant returns (string) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
 
}




contract Cars is converters {
address public owner=msg.sender;

event LogCarDeposit(address deliveredTo, uint amount,uint dayofdeposit);

event LogCoinsSent(address sentTo, uint amount,uint dataofsent);
event LogOwnerInfo(bytes32 ManufactorName,bytes32 ProductName,bytes32 ProductSerialNumber);
mapping (address=>uint) public CarAmount;
event Logshowbyte(bytes32  mName,bytes32 pName, bytes32 pSName);
event Logshow(string  mName,string pName, string pSName);

bytes32 ownername;
bytes32 ownerproductname;
bytes32 ProductSerialNumber;



function Cars (uint amount,string memory _ManufactorName,string memory _ProductName,string memory _Productserial) {
CarAmount[owner] = amount;

ownername=stringToBytes32(_ManufactorName);
ownerproductname=stringToBytes32(_ProductName);
ProductSerialNumber=stringToBytes32(_Productserial);
LogOwnerInfo(ownername,ownerproductname,ProductSerialNumber);

}


modifier isNotOwner(){
   require(owner==msg.sender);
   _;
}

function depositBalance(uint depo) {
    CarAmount[owner] += depo;
    LogCarDeposit(msg.sender,depo, now);
}
function carSend(address reciver,uint amount)  returns (bool saficiant){
if(owner==tx.origin){
if (CarAmount[owner]<amount) {
    return false; 
    
    }

CarAmount[owner] -= amount;
CarAmount[reciver] += amount;
LogCoinsSent(reciver,amount,now);
return true;    
}

else{
    if(CarAmount[msg.sender]<amount){
        return false;
    }
    CarAmount[msg.sender] -= amount;
CarAmount[reciver] += amount;
LogCoinsSent(reciver,amount,now);
return true; 
}
}
//function checkBalance(address add) constant returns(uint) {
//return CarAmount[add];
    
//}

/*function getname(string g) returns (bytes32){
    bytes32 a= stringToBytes32(g);
    return a;
   
}*/

function getnamesss(){
    string memory a=bytes32ToString(ownername);
    string memory bc= bytes32ToString(ownerproductname);
    string memory cd= bytes32ToString(ProductSerialNumber);
    Logshowbyte(ownername,ownerproductname,ProductSerialNumber);
   Logshow(a,bc,cd);
   
}

}



