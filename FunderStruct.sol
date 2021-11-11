// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract FunderStruct {
    
    struct Funder { 
        address addr; 
        uint amount; 
    }   

    Funder giver;
    
    function getFunderAdd() public returns(address){
        _address = giver.addr;
        return _address;
    }
    
    
    function getFunderAmt(address _giverAdd) public returns(uint){
        _funderAmt = _giverAdd.amount;
        return _funderAmt;
    }
}
