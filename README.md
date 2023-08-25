Foundry NFT


We go through creating 2 different kinds of NFTs.

An IPFS Hosted NFT
An SVG NFT (Hosted 100% on-chain)

NFT Pug NFT Happy NFT Shiba NFT Frown NFT St.Bernard


Foundry NFT
Getting Started
Requirements
Quickstart
Optional Gitpod
Usage
Start a local node
Deploy
Deploy - Other Network
Testing
Test Coverage
Deployment to a testnet or mainnet
Scripts
Base64
Estimate gas
Formatting
Thank you!
Getting Started
Requirements
git
You'll know you did it right if you can run git --version and you see a response like git version x.x.x
foundry
You'll know you did it right if you can run forge --version and you see a response like forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)
Quickstart
git clone https://github.com/Cyfrin/foundry-nft-f23
cd foundry-nft-f23
forge install
forge build
Optional Gitpod
If you can't or don't want to run and install locally, you can work with this repo in Gitpod. If you do this, you can skip the clone this repo part.

Open in Gitpod

Usage
Start a local node
make anvil
Deploy
This will default to your local node. You need to have it running in another terminal in order for it to deploy.

make deploy
Deploy - Other Network
See below

Testing
We talk about 4 test tiers in the video.

Unit
Integration
Forked
Staging
This repo we cover #1 and #3.

forge test
or

forge test --fork-url $SEPOLIA_RPC_URL
Test Coverage
forge coverage
Deployment to a testnet or mainnet
Setup environment variables
You'll want to set your SEPOLIA_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in .env.example.

PRIVATE_KEY: The private key of your account (like from metamask). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can learn how to export it here.
SEPOLIA_RPC_URL: This is url of the goerli testnet node you're working with. You can get setup with one for free from Alchemy
Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on Etherscan.

Get testnet ETH
Head over to faucets.chain.link and get some tesnet ETH. You should see the ETH show up in your metamask.

Deploy (IPFS NFT)
make deploy ARGS="--network sepolia"
Deploy (SVG NFT)
make deploySvg ARGS="--network sepolia"
Scripts
After deploy to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

cast send <RAFFLE_CONTRACT_ADDRESS> "enterRaffle()" --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
or, to create a ChainlinkVRF Subscription:

make createSubscription ARGS="--network sepolia"
Base64
To get the base64 of an image, you can use the following command:

echo "data:image/svg+xml;base64,$(base64 -i ./images/dynamicNft/happy.svg)"
Then, you can get the base64 encoding of the json object by placing the imageURI into happy_image_uri.json then running:

echo "data:application/json;base64,$(base64 -i ./images/dynamicNft/happy_image_uri.json)"
Estimate gas
You can estimate how much gas things cost by running:

forge snapshot
And you'll see and output file called .gas-snapshot

Formatting
To run code formatting:

forge fmt
Thank you!