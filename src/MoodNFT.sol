// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// Imports the ERC721 contract from OpenZeppelin library for NFT functionality
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// We need ERC721 as the base contract for NFT functionality
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
// Base64 is needed to encode our NFT metadata on-chain

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

    enum Mood {
        HAPPY,
        SAD
    }

    // Map token IDs to their current mood
    // This allows each NFT to have its own mood state
    mapping(uint256 => Mood) private s_tokenIdToMood;

    // when this contract is deployed, it will take the URI of the two NFTs
    // Constructor function that initializes the contract
    // Takes two parameters: SVG data for sad and happy moods
    // Calls the parent ERC721 constructor with name "Mood NFT" and symbol "MN"
    constructor(string memory sadSvg, string memory happySvg) ERC721("Mood NFT", "MN") {
        // Start counter at 0 for first token ID
        s_tokenCounter = 0;
        // Store SVGs that are passed in deployment in contract storage for permanent access
        s_sadSvgImageUri = sadSvg;
        s_happySvgImageUri = happySvg;
    }

    // Public function allowing users to mint new NFTs
    // No access control as this is meant to be open for anyone
    function mintNft() public {
        // Use OpenZeppelin's safe minting function to prevent tokens being lost
        _safeMint(msg.sender, s_tokenCounter);
        // Set initial mood to HAPPY
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        // Increments the token counter for the next mint
        s_tokenCounter++;
    }

    // Override base URI to return base64 data URI prefix
    // This is needed for on-chain SVG storage
    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    // Generate and return the token URI containing metadata and SVG
    // This function must be public and override the parent contract (OpenZeppelin's ERC721)
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // Select appropriate SVG based on token's current mood
        string memory imageURI;
        if (s_tokenIdToMood[tokenId] == Mood.HAPPY) {
            imageURI = s_happySvgImageUri;
        } else {
            imageURI = s_sadSvgImageUri;
        }

        // Construct and encode the complete metadata JSON
        // We use abi.encodePacked for efficient string concatenation
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name": "',
                            name(), // Get name from ERC721 parameter that we passed
                            '", "description": "An NFT that reflects the owners mood.", "attributes": [{"trait_type": "moodiness", "value": 100}], "image": "',
                            imageURI,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function getNftCount() external view returns (uint256) {
        return s_tokenCounter;
    }
}
