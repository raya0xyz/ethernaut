// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }
    /*
    * Transfer more Eth to King 
    * THen I will become the new king
    * now prize is update.
    * so, 
    * If someone wants to be king they have to pay more than the new prize 
    * But owner can bypass that and make themself as new king.
    */
    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        // # this line transfer eth, but what if we refuse taking money
        // # no one can replace us. because next line is never gonna execute
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}