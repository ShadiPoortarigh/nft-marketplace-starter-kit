// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;



interface IERC721{
    
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);


    function balanceOf(address _owner) external view returns (uint256);

    function ownerOf(uint256 _tokenId) external view returns (address); // whose token is it

    function transferFrom(address _from, address _to, uint _tokenId) external; 


}