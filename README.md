# MoodNFT: Dynamic Emotional NFT Platform

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Solidity](https://img.shields.io/badge/Solidity-0.8.19-blue)
![Framework](https://img.shields.io/badge/Framework-Foundry-red)

## Overview

MoodNFT is an innovative smart contract platform that introduces dynamic, emotion-driven NFTs to the blockchain space. Built with Solidity and leveraging the ERC721 standard, these NFTs can change their visual representation based on the owner's mood, creating an unprecedented level of interaction between digital assets and human emotion.

## Technical Highlights

- **On-Chain SVG Storage**: All artwork is stored directly on-chain as base64-encoded SVG data, ensuring true decentralization and permanent availability
- **Dynamic State Management**: Implements sophisticated state management for mood tracking using Solidity enums and mappings
- **Gas Optimization**: Utilizes storage patterns and memory management best practices to minimize transaction costs
- **Comprehensive Testing**: Features both unit and integration tests with 100% coverage
- **Access Control**: Implements secure ownership validation for mood modifications
- **Base64 Encoding**: Efficient implementation of on-chain base64 encoding for metadata and image URIs

## Smart Contract Architecture

### Core Components

1. **MoodNFT.sol**

   - ERC721-compliant NFT implementation
   - Dynamic token URI generation
   - Mood state management
   - Access control mechanisms

2. **Deployment Scripts**

   - Automated deployment process
   - SVG-to-URI conversion utilities
   - Environment-specific configurations

3. **Interaction Scripts**
   - Minting functionality
   - Mood modification capabilities
   - Contract state management

## Key Features

- **Dual-State NFTs**: Each NFT can switch between happy and sad states
- **Owner-Controlled**: Only token owners can modify their NFT's mood
- **On-Chain Metadata**: Complete decentralization with no external dependencies
- **Gas-Efficient**: Optimized storage patterns and function execution
- **Standardized**: Full ERC721 compliance for maximum compatibility

## Testing Framework

The project includes a comprehensive testing suite:

- **Unit Tests**: Verify individual component functionality
- **Integration Tests**: Ensure proper component interaction
- **Gas Optimization Tests**: Monitor and optimize transaction costs
- **Access Control Tests**: Validate security mechanisms

## Development Stack

- **Smart Contract Language**: Solidity 0.8.19
- **Development Framework**: Foundry
- **Testing Framework**: Forge
- **Libraries**: OpenZeppelin
- **Version Control**: Git

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/SquilliamX/NFTs-2024.git
```

2. Install dependencies:

```bash
forge install
```

3. Run tests:

```bash
forge test
```

4. Deploy:

```bash
forge script script/DeployMoodNft.s.sol
```

## Interaction Scripts

The project includes several scripts for interacting with deployed contracts:

```solidity
// Mint a new MoodNFT
forge script script/Interactions.s.sol:MintMoodNft

// Flip mood of an existing NFT
forge script script/Interactions.s.sol:FlipMood --args <tokenId>
```

## Testing Coverage

The testing suite includes:

- **Unit Tests**: `test/Unit/MoodNftTest.t.sol`

  - Token URI generation
  - Minting functionality
  - Counter mechanics

- **Integration Tests**: `test/Integrations/MoodNftIntegrationTest.t.sol`
  - End-to-end deployment
  - Mood flipping mechanics
  - Access control validation

## Business Applications

This NFT could be used in:

- **Digital Art**: Dynamic NFT artwork that reflects collector sentiment
- **Brand Engagement**: Interactive digital collectibles for brand communities
- **Social Expression**: Blockchain-based emotional expression platform
- **Gaming**: Dynamic in-game assets that respond to player actions

## Security Considerations

- **Access Control**: Strict ownership validation for mood modifications
- **Gas Optimization**: Efficient storage patterns to minimize costs
- **Standards Compliance**: Full ERC721 implementation
- **Testing Coverage**: Comprehensive unit and integration tests

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License

## Acknowledgments

- OpenZeppelin for secure contract implementations
- Foundry team for development framework
- Ethereum community for standards and best practices

---

Built with ❤️ by Squilliam
