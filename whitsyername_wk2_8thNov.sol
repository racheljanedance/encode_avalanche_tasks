// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract whitsyername{
    
    constructor() {
        msg.sender == owner; 
    }
    
    string name;
    address owner;
    
    event newName(string _newName);
    
    modifier onlyOwner() {
        if (msg.sender == owner) {
            _;
        }
    }
    
    function getName() public view returns (string memory) {
        return name;
    }
    
    function setName(string memory _newName) public {
        name = _newName;
        emit newName(name);
    }
    
    
}
