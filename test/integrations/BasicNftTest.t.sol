// SPDX-License-Identifier: MIT

// Import necessary modules and contracts
import {Test, console} from "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";

// Specify the Solidity version
pragma solidity ^0.8.18;

// Define the BasicNftTest contract inheriting from Test
contract BasicNftTest is Test {
    // Declare state variables
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    // Set up function to initialize contracts
    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    // Test case to verify the correct name of the NFT
    function testNameIsCorrect() public {
        // Define expected and actual name strings
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();

        // Assert that the names match using keccak256 hash
        assertEq(
            keccak256(abi.encodePacked(expectedName)),
            keccak256(abi.encodePacked(actualName))
        );
    }

    // Test case to verify minting and balance of NFTs
    function testCanMintAndHaveABalance() public {
        // Prank the virtual machine by impersonating a user
        vm.prank(USER);

        // Mint an NFT
        basicNft.mintNft(PUG);

        // Assert the balance of the user's NFTs and verify tokenURI
        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
