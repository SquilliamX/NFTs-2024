// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    // counts how many tokens there currently are
    uint256 private s_tokenCounter;

    // maps the NFT token ID to its URI (UniForm Resource Indicator)
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Dogie", "Dog") {
        // when this contract is launched it will start at 0
        s_tokenCounter = 0; // whenever we mint a new dog we will update the token counter.
    }

    function mintNft(string memory tokenUri) public {
        // Store the NFT's metadata URI in our mapping, using the current token counter as the key
        // This allows us to retrieve the URI later using the token ID
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        // openZeppelin's mint function takes the address to and the token ID
        _safeMint(msg.sender, s_tokenCounter);
        // increase the counter after every NFT is minted
        s_tokenCounter++;
    }

    // user inputs the tokenId number of the nft he wants to see
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // and this returns the NFT at the tokenID number
        return s_tokenIdToUri[tokenId];
    }
}
