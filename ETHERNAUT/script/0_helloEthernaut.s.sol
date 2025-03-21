// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/0_helloEthernaut.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract lvl0 is Script{
    // Get address form OpenZepplin `contract.address()` or `instance`.
    Instance public instance = Instance()

    function run() external {
        // extract password form storage
        string memory pass = instance.password();
        console.log("Passcode is: ", pass);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        instance.authenticate(pass);
        vm.stopBroadcast();

    }

}

