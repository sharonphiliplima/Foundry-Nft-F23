// SPDX-License-Identifier: MIT

import {Script, console} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "./DeployBasicNft.s.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

pragma solidity ^0.8.18;

contract MintBasicNft is Script {
    //tokenURI
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}
