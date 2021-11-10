// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VolcanoCoin{
    uint totalSupply = 10000;
    address owner;
    event totalSupplyInc(uint);
    
    constructor() {
        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        //top account on JavascriptVM, could be msg.sender
    }
    
    modifier onlyOwner {
        if (msg.sender == owner){ //if condition () is true...
            _; //...then execute the rest of the function
        }
    }
    
    function getTotalSupply() public view returns(uint){
        return totalSupply;
    }
    
    function incTotalSupply() public onlyOwner {
        totalSupply = totalSupply + 1000;
        emit totalSupplyInc(totalSupply);
    }
}
