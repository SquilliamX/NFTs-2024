// SPDX-License-Identifier: MIT

// Declares the Solidity version to be used
pragma solidity 0.8.19;

// Import necessary contracts and libraries:
// Script: Base contract for deployment scripts
// console: For debugging purposes
// MoodNft: Our main NFT contract
// Base64: For encoding SVG data to base64
import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

// Deployment contract that inherits from Forge's Script contract
contract DeployMoodNft is Script {
    // Main deployment function that returns the deployed MoodNft instance
    function run() external returns (MoodNft) {
        // Read SVG files from the local filesystem using Forge's vm.readFile
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");

        // Start recording transactions for deployment
        vm.startBroadcast();
        // Deploy new MoodNft contract with converted SVG URIs
        // svgToImageURI converts raw SVG to base64 encoded data URI
        MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(happySvg));
        // Stop recording transactions
        vm.stopBroadcast();
        // Return the deployed contract instance
        return moodNft;
    }

    // Helper function to convert SVG string to a base64 encoded image URI
    function svgToImageURI(string memory svg) public pure returns (string memory) {
        // Define the base URL prefix for SVG data URIs
        string memory baseUrl = "data:image/svg+xml;base64,";
        // Encode the SVG string to base64:
        // 1. Convert svg to bytes using abi.encodePacked
        // 2. Encode bytes to base64 using Base64.encode
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        // Combine base URL and encoded SVG data
        return string(abi.encodePacked(baseUrl, svgBase64Encoded));
    }
}
