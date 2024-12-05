// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// Imports the ERC721 contract from OpenZeppelin library for NFT functionality
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Creates a new contract called MoodNft that inherits from ERC721
contract MoodNft is ERC721 {
    // we declare this variable but do not initialize it because its value is going to keep changing
    // Counter to keep track of the number of NFTs minted
    // Private variable with storage prefix (s_) for better gas optimization
    uint256 private s_tokenCounter;

    // Stores the SVG data for the sad mood NFT
    // Private variable with storage prefix (s_)
    string private s_sadSvgImageUri;

    // Stores the SVG data for the happy mood NFT
    // Private variable with storage prefix (s_)
    string private s_happySvgImageUri;

    // when this contract is deployed, it will take the URI of the two NFTs
    // Constructor function that initializes the contract
    // Takes two parameters: SVG data for sad and happy moods
    // Calls the parent ERC721 constructor with name "Mood NFT" and symbol "MN"
    constructor(string memory sadSvg, string memory happySvg) ERC721("Mood NFT", "MN") {
        // Initializes the token counter to 0
        s_tokenCounter = 0;
        // Stores the sad SVG data
        s_sadSvgImageUri = sadSvg;
        // Stores the happy SVG data
        s_happySvgImageUri = happySvg;
    }

    // Public function that allows users to mint new NFTs
    function mintNft() public {
        // Safely mints a new NFT to the caller's address with the current token ID
        _safeMint(msg.sender, s_tokenCounter);
        // Increments the token counter for the next mint
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {}
}
