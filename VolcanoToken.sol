// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; 

contract volcanoToken is Ownable, ERC721("TOKEN", "TKN") {
    
    // Token name
    string private _name;

    // Token symbol
    string private _symbol;
    
    // 
    constructor(string memory name_, string memory symbol_) {
        _name = name_; 
        _symbol = symbol_; 
    }
    
}