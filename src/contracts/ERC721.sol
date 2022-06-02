// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;


contract ERC721{

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId

    );

    // who(address) is the owner of this asset
    mapping(uint256 => address) private _tokenOwner; //  _tokenOwner = { tokenId : 'address-of-owner' }
    //how many tokens each owner has
    mapping(address => uint) private _OwnedTokenCount; // _OwnedTokenCount = { 'owner' : balance-of-owner }
    
    
    function balanceOf(address _owner) public view returns (uint256){

        require(_owner != address(0), 'Owner query for non-existing token'); //(condition) If the owner address was entered mistakenly, print this error message
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
    
    
    function _mint(address to, uint256 tokenId ) internal virtual {

        require(to != address(0), "This address is invalid");
        require(!_exists(tokenId), "This token already minted");

        _tokenOwner[tokenId] = to;
        _OwnedTokenCount[to] += 1;

        emit Transfer(address(0) , to, tokenId);  // address(0) is equivalent to msg.sender
    }

}




/* 
address(0):

Within an Ethereum transaction, the zero-account is just a special
case used to indicate that a new contract is being deployed. It is 
literally '0x0' set to the to field in the raw transaction.

If "to" is set to something other than '0x0', this request will result
in transferring ether to the address. The address can either be a 
contract or an external account.
 */