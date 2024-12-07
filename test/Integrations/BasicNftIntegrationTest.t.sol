// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNFT.sol";

contract BasicNftTest is Test {
    // Declare a variable to store our deployment script
    // We need this to deploy fresh instances of our NFT contract for each test
    DeployBasicNft public deployer;

    // Declare a variable to store the deployed NFT contract
    // This will be the contract instance that we'll run tests against
    BasicNft public basicNft;

    address public USER = makeAddr("user");

    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    // setUp function runs before each test
    // This ensures each test starts with a fresh contract state
    function setUp() public {
        // Create a new instance of our deployment script
        deployer = new DeployBasicNft();
        // Use the deployment script to deploy a fresh NFT contract
        // This simulates the exact same deployment process we'll use in production
        basicNft = deployer.run();
    }

    // Test to verify the NFT contract was deployed with the correct name
    function testNameIsCorrect() public view {
        // Define the expected name that we set in the constructor
        string memory expectedName = "Dogie";
        // Get the actual name from the deployed contract
        string memory actualName = basicNft.name();
        // We can't directly compare strings in Solidity, so we:
        // 1. Convert both strings to bytes using abi.encodePacked
        // 2. Hash both byte arrays using keccak256
        // 3. Compare the resulting hashes
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    // Test to verify NFT minting works and updates balances correctly
    function testCanMintAndHaveABalance() public {
        // Use Forge's prank function to make subsequent calls appear as if they're from USER
        vm.prank(USER);
        // Mint a new NFT with our test URI (PUG)
        basicNft.mintNft(PUG);

        // Verify the USER now owns exactly 1 NFT
        assert(basicNft.balanceOf(USER) == 1);
        // Verify the token URI was stored correctly for token ID 0
        // Using the same string comparison technique as above since we can't directly compare strings
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
