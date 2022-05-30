// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;


contract ERC721{

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId

    );

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint) private _OwnedTokenCount;
    
    function balanceOf(address _owner) public view returns (uint256){

        require(_owner != address(0), 'Owner query for non-existing token'); //(condition) If owner address was entered mistakenly, print this error message
        return _OwnedTokenCount[_owner];

    }
    
    function ownerOf(uint256 _tokenId) external view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'Owner query for non-existing token'); 
        return owner;
    }

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }
    
    
    function _mint(address to, uint256 tokenId ) internal {

        require(to != address(0), "This address is invalid");
        require(!_exists(tokenId), "This token already minted");

        _tokenOwner[tokenId] = to;
        _OwnedTokenCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

}