// SPDX-License-Identifier: MIT

// Declares the Solidity version to be used
pragma solidity 0.8.19;

// Import necessary contracts and libraries
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNFT.sol";
// DevOpsTools helps us interact with already deployed contracts
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

// Contract for minting NFTs on an already deployed BasicNft contract
contract MintBasicNft is Script {
    // Define a constant IPFS URI for the PUG NFT metadata
    // This URI points to a JSON file containing the NFT's metadata (image, attributes, etc.)
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    // Main function that will be called to mint an NFT
    function run() external {
        // Get the address of the most recently deployed BasicNft contract on the current chain
        // This allows us to interact with the contract without hardcoding addresses
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        // Call the function to mint an NFT on this contract
        mintNftOnContract(mostRecentlyDeployed);
    }

    // Function that handles the actual minting process
    function mintNftOnContract(address contractAddress) public {
        // Start recording transactions for broadcasting to the network
        vm.startBroadcast();
        // Cast the address to our BasicNft contract type and call the mint function
        // This creates a new NFT with the PUG metadata
        BasicNft(contractAddress).mintNft(PUG);
        // Stop recording transactions
        vm.stopBroadcast();
    }
}
