// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;

import './ERC721Connector.sol';


contract Greenbox is ERC721Connector {
    
    constructor() ERC721Connector('Greenbox', 'Gbox'){
        
    }

    
}

