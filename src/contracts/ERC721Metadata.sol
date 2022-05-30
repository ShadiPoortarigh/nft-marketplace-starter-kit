// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;





contract ERC721Metadata {

    string private _name;
    string private _symbol;

    constructor(string memory named, string memory symbolified){
        _name = named;
        _symbol = symbolified;

    }
   
    function name() external view returns (string memory){
        return _name;
    }

   
    function symbol() external view returns (string memory){
        return _symbol;
    }



}
