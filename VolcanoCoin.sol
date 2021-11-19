// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
contract VolcanoCoin{
    
    //set variables
    uint totalSupply = 10000;
    address owner;
    event totalSupplyInc(uint);
    
    struct usersBalances { 
        address user;
        uint balance;
    }
    mapping(address => usersBalances) balances;
    address[] public userList;

    uint numUsers;

    constructor() {
        //Set owner statically, once.
        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        //top account on JavascriptVM, could be msg.sender
        
        //initialise number of users to 0
        // numUsers = 0;
    }

    //Only owner permissions
    modifier onlyOwner {
        if (msg.sender == owner){ //if condition () is true...
            _; //...then execute the rest of the function
        }
    }
    
    //Only your OWN permissions 
    modifier onlyMsgSender(address _address) {
        if (_address == msg.sender){ //if condition () is true...
            _; //...then execute the rest of the function
        }
    }
    
    //require that the msg.sender isnt in the list of users already

    //Get user balance from balances mapping
    function getUserBalance(address _address) public view returns(uint){
        return balances[_address].balance;
    } 
    
    function newUser() public {
        // push msg.sender to the array
        userList.push(msg.sender);
        // set new user balance to 0 in mapping!
        balances[msg.sender].balance = 0;
        // increment number of users
        // numUsers++; 
    }
    
    //Get total supply
    function getTotalSupply() public view returns(uint){
        return totalSupply;
    }
    
    // Increment total supply by 1000 tokens - owner only    
    function incTotalSupply() public onlyOwner {
        totalSupply = totalSupply + 1000;
        emit totalSupplyInc(totalSupply);
    }
}