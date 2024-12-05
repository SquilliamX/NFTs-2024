// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// Import the Forge scripting utilities and our NFT contract
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNFT.sol";

// Contract for deploying our BasicNft, inheriting from Forge's Script contract
contract DeployBasicNft is Script {
    // This is the main function that will be called to deploy the contract
    // When deployed to a real network, msg.sender will be the wallet address that runs this script
    // In tests, msg.sender is a test address provided by Forge's testing environment
    // This difference occurs because:
    // 1. Real deployments: vm.startBroadcast() uses the private key from your wallet or environment
    // 2. Tests: Forge's VM creates a test address and uses that as msg.sender
    function run() external returns (BasicNft) {
        // Start recording transactions for broadcasting to the network
        vm.startBroadcast();
        // Create a new instance of our BasicNft contract
        // This will initialize it with "Dogie" name and "Dog" symbols
        BasicNft basicNft = new BasicNft();
        // Stop recording transactions
        vm.stopBroadcast();
        // Return the deployed contract instance
        return basicNft;
    }
}
