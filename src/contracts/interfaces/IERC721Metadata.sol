// SPDX-License-Identifier: GPL-3.

pragma solidity ^0.8.4;



interface IERC721Metadata{
    function name() external view returns(string memory _name);

    function symbol() external view returns (string memory _symbol);
}