// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;

import "./ERC721.sol";
import "./interfaces/IERC721Enumerable.sol";

contract ERC721Enumerable is ERC721, IERC721Enumerable {
    uint256[] private _allTokens; // It stores all of my tokens

    mapping(uint256 => uint256) private _allTokensIndex; // it outputs indexes of all tokens

    mapping(address => uint256[]) private _ownedTokens; // IF the token is mine

    mapping(uint256 => uint256) private _ownedTokensIndex; // Index of my tokens

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId);

        _addTokensToTotalSupply(tokenId);
        _addTokensToOwnerEnumeration(to, tokenId);
    }

    function _addTokensToTotalSupply(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

    // function tokenByIndex(uint256 index) public view returns (uint256) {
    //     require(index < totalSupply(), "global index out of bound!");
    //     return _allTokens[index];
    // }
    

    // function tokenOfOwnerByIndex(address owner, uint256 index)
    //     public
    //     view
    //     returns (uint256)
    // {
    //     require(index < balanceOf(owner), "owner index out of bound!");
    //     return _ownedTokens[owner][index];
    // }


    // function totalSupply() public view returns (uint256) {
    //     return _allTokens.length;
    // }
}
