// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract whitsyername{
    
    string name;
    address owner;
    
    constructor() {
        msg.sender = owner; 
    }
    
    event newName(string _newName);
    
    modifier onlyOwner {
        if (msg.sender == owner){
            _;
        }
    }
    
    function getName(string _name) public view returns (string) {
        return _name;
    }
    
    function setName(string memory _newName) public {
        name = _newName;
        emit newName(name);
    }
    
    
}