// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

// Import required testing utilities and contract
import {Test, console} from "forge-std/Test.sol";
// Test provides testing functionality, console for debugging/logging
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
// Import the contract we want to test

// Test contract that inherits from Forge's Test contract
contract DeployMoodNftTest is Test {
    // Instance of our contract to test
    DeployMoodNft public deployer;

    // Setup function that runs before each test
    function setUp() public {
        // Create new instance of the deployment contract
        deployer = new DeployMoodNft();
    }

    // Test function to verify SVG to URI conversion
    function testConvertSvgToUri() public view {
        // Expected URI after base64 encoding the SVG
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgaGVpZ2h0PSI0MDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+IDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0ieWVsbG93IiByPSI3OCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIiAvPiA8ZyBjbGFzcz0iZXllcyI+IDxjaXJjbGUgY3g9IjQ1IiBjeT0iMTAwIiByPSIxMiIgLz4gPGNpcmNsZSBjeD0iMTU0IiBjeT0iMTAwIiByPSIxMiIgLz4gPC9nPiA8cGF0aCBkPSJtMTM2LjgxIDExNi41M2MuNjkgMjYuMTctNjQuMTEgNDItODEuNTItLjczIiBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7IiAvPiA8L3N2Zz4=";

        // Raw SVG data to be converted
        string memory svg =
            '<svg viewBox="0 0 200 200" width="400" height="400" xmlns="http://www.w3.org/2000/svg"> <circle cx="100" cy="100" fill="yellow" r="78" stroke="black" stroke-width="3" /> <g class="eyes"> <circle cx="45" cy="100" r="12" /> <circle cx="154" cy="100" r="12" /> </g> <path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 3;" /> </svg>';

        // Convert the SVG to URI using our contract's function
        string memory actualUri = deployer.svgToImageURI(svg);

        // Verify the conversion matches our expected result
        // Using keccak256 hash comparison for string equality
        assert(keccak256(abi.encodePacked(expectedUri)) == keccak256(abi.encodePacked(actualUri)));

        // Log both URIs for manual verification
        console.log("expectedUri:", expectedUri);
        console.log("actualUri:", actualUri);
    }
}
