// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "openzeppelin-contracts-06/math/SafeMath.sol";

contract Reentrance {
    using SafeMath for uint256;

    mapping(address => uint256) public balances;
    // # call{value: msg.value}("_to) >> donate Eth 
    function donate(address _to) public payable {
        balances[_to] = balances[_to].add(msg.value);
    }
    // # check balance
    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }
    // # withdraw(_amount) 
    function withdraw(uint256 _amount) public {
        // _amount must be greater or eq to my current balance
        if (balances[msg.sender] >= _amount) {
            // @audit when true send money.
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
}