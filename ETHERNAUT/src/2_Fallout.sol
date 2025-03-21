// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "openzeppelin-contracts-06/math/SafeMath.sol";

contract FalloutChall {
    using SafeMath for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    function Fal1out() public payable {
        owner = msg.sender;
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }
    // just keep adding money
    function allocate() public payable {
        allocations[msg.sender] = allocations[msg.sender].add(msg.value);
    }
    // ?q? looks like withdraw
    // takes address >> mush have allocated sth before >> 
    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0); // must have allocated sth
        // allocation[allocator] retuns amount.  ||  allocator.transfer(amount);
        allocator.transfer(allocations[allocator]);
    }
    // owner withdrawing contract balance.
    function collectAllocations() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
    // check balance
    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}