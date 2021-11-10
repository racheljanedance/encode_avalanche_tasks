pragma solidity ^0.8.0;

contract Score { 
    //declare variables
    uint score = 5;
    address owner;
    event Score_set(uint);
    //mapping(KeyType => ValueType) mapping_name;
    mapping(address => uint) score_list;
    
    //Executed only once when the contract is deployed, optional
    constructor() {
        owner = msg.sender;
    }
    
    //Modifiers - mostly to check a condition before executing a function
    modifier onlyOwner {
        if (msg.sender == owner){ //if condition () is true...
            _; //...then execute the rest of the function
        }
    }
    
    modifier Fee(uint fee){ //Modifiers can take arguments too
        if (msg.value == fee) {
            _;
        }
    }
    
    // In Solidity, a getter is a function that returns a value
    function getScore() public view returns (uint) { //view - only read from storage, normal for getters
        return score;
    } //NB pure functions only do calculations, not modify anything (no gas)
    
    //Setter - function that modifies variable value (modifies contract state)
    function setScore(uint new_score) public onlyOwner { //must specify parameters in declaration
        score = new_score;
        emit Score_set(new_score); //call to event
    }  //no returning, just modification.
    
    function getMyScore() public view onlyOwner returns(uint){
        uint myScore = score_list[owner];
        return myScore;
    }
    
    function getUserScore(address user) public view returns (uint){
        return score_list[user]; //get value by using key
    }
    //mapping(address => uint) score_list; - by adding public, solidity automatically makes you a getter function
    
    function getUserCount() public pure returns(uint){
        return 10+10;
    }
    
}