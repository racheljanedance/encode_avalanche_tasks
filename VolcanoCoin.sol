// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VolcanoCoin is ERC20{

    //set variables
    uint totalSupply = 10000;
    address owner;
    event totalSupplyInc(uint);
    // event Transfer(address indexed sender, address indexed receiver, uint256 amount);
    
    struct usersBalances { 
        address user;
        uint balance;
    }
    
    mapping(address => usersBalances) balances; //(Q1b)
    address[] public userList; //this has an automatic getter

    uint numUsers;
    
    constructor() ERC20("TOKEN", "TKN") {
        //Set owner statically, once.
        owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
        // add the owner to the array, and set the owner balance = total supply
        userList.push(owner); 
        balances[msg.sender].balance = totalSupply; 
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

    //Get user balance from balances mapping (Q2b)
    function getUserBalance() public view returns(uint){
        return balances[msg.sender].balance;
    }
     
    function newUser() public {
        // push msg.sender to the array
        userList.push(msg.sender);
        // set new user balance to 0 in mapping!
        balances[msg.sender].balance = 0;
        // increment number of users
        // numUsers++; 
    }
    
    function numberOfUsers() public view returns (uint) { 
        // return length of dynamic array 
        return userList.length; 
    }
    
    //Get total supply
    function getTotalSupply() public view returns(uint){
        return totalSupply;
    }
    
    // Increment total supply by 1000 tokens - owner only    
    function incTotalSupply() public onlyOwner {
        totalSupply = totalSupply + 1000;
        //Should increment the balance of the owner with 1000 here?
        emit totalSupplyInc(totalSupply); 
    }
    
    function transferTokens(address _recipient, uint256 _amount) public payable {
        require(_recipient != address(0));
        require(balances[msg.sender].balance >= _amount);
        require(_recipient != msg.sender);
        
        balances[msg.sender].balance = balances[msg.sender].balance - _amount;
        balances[_recipient].balance = balances[_recipient].balance + _amount; //SafeMath???
        emit Transfer(msg.sender, _recipient, _amount);
    }
    
}