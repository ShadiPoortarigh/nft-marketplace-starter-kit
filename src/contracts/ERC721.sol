// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;


contract ERC721{

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint) private _OwnedTokenCount;




    function balanceOf(address _owner) public view returns (uint256){

        require(_owner != address(0), 'Owner query for non-existing token') //(condition) If owner address was entered mistakenly, print this error message
        return _OwnedTokenCount[_owner];


    }
    
    function ownerOf(uint256 _tokenId) external view returns(address){
        return _tokenOwner[_tokenId];
    }

}