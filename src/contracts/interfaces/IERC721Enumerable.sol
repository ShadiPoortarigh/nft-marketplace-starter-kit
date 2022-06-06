// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;


contract IERC721Enumerable{

    function totalSupply() external view returns (uint256);

    function tokenByIndex(uint256 _index) external view returns (uint256);

    function tokenOfOwnerByIndex(address _owner, uint _index) external view returns (uint256);


}