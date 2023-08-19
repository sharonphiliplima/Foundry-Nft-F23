**MoodNft Contract**
The MoodNft contract is an Ethereum smart contract that allows users to mint NFTs (Non-Fungible Tokens) representing their mood. Each NFT can be in either a "happy" or "sad" state, and the state can be flipped by the owner of the NFT. The contract is built using the ERC721 standard for NFTs and extends the Ownable contract from OpenZeppelin.


*Overview*
The MoodNft contract allows users to create and own NFTs that reflect their mood. Each NFT has a mood state, which can be either "happy" or "sad." The mood of an NFT can be flipped by its owner. The contract also provides metadata for each NFT, including an SVG image representing the NFT's mood.

*Getting Started*
To deploy and interact with the MoodNft contract, you need:

An Ethereum development environment (e.g., Hardhat, Truffle, or Remix).
The required dependencies: ERC721 from OpenZeppelin and Base64 utility from OpenZeppelin.
Functionality
Minting NFTs
Users can mint new NFTs using the mintNft function. Each minted NFT starts with a mood state of "happy." The minting process also increments the token counter.

*Flipping Mood*
NFT owners can change the mood of their NFTs using the flipMood function. If the NFT is in the "happy" state, flipping it changes the mood to "sad," and vice versa. Only the owner of an NFT can change its mood.

*Token Metadata*
Each NFT's metadata is accessible using the tokenURI function. The metadata includes a JSON object containing the NFT's name, description, moodiness attribute, and an SVG image URI representing the mood.

*Usage*
Deploy the MoodNft contract to the Ethereum network.
Call the mintNft function to mint new NFTs, which will be owned by the caller.
Call the flipMood function to change the mood state of an owned NFT.
Retrieve NFT metadata using the tokenURI function.

*License*
This contract is licensed under the MIT License. See LICENSE for more information.

*Note: This project is for educational and informational purposes. Always review and test the code before using it in a production environment.*




