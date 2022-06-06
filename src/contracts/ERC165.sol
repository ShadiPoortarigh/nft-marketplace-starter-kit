// SPDX-License-Identifier: GPL-3.

/*
Every ERC-721 compliant contract must implement the ERC721 and ERC165 interfaces 
*/

/*
Keccak256 is a cryptographic function built into solidity. 
This function takes in any amount of inputs and converts it 
to a unique 32 byte hash.
*/

pragma solidity ^0.8.4;


import './interfaces/IERC165.sol';


contract ERC165 is IERC165 {
    mapping(bytes4 => bool) private _supportedInterfaces;

    constructor(){
        _registerInterface(bytes4(keccak256('supportsInterface(bytes4)')))
    }


    function supportsInterface(bytes4 interfaceID) external view returns (bool){
        return _supportedInterfaces[interfaceID];
    }


    function _registerInterface(bytes4 interfaceId) internal {
        // ....
    }
}

