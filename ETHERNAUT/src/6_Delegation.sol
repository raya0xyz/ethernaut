// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
    // # whoever call this funciton is owner.
    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    // small 'd' is the above contract ;
    Delegate delegate;
    // # whoever deployed this contract is owner here.
    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }
    // ## If we can triggre this fallback with msg.data = pwn()
    // ## Then we can change this contract owner var. (actually the index 0 of storage variable) via delegatecall.
    fallback() external {
        (bool result,) = address(delegate).delegatecall(msg.data);
        if (result) {
            this;
        }
    }
}