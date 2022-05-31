// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;

import './ERC721Connector.sol';


contract Greenbox is ERC721Connector {

    mapping(string => bool) _greenBoxExists;

    // store the NFts
    string[] public greenBox;

    function mint(string memory _greenBox) public{

        require(!_greenBoxExists[_greenBox], 'Error - nft already exists');

        greenBox.push(_greenBox);
        uint _id = greenBox.length - 1;

        _mint(msg.sender, _id);

        _greenBoxExists[_greenBox] = true;

    }
    
    constructor() ERC721Connector('Greenbox', 'Gbox'){
        
    }

    
}

