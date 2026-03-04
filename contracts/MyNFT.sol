// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyRobinhoodNFT is ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;

    constructor() ERC721("Robinhood Badge", "RNFT") Ownable(msg.sender) {}

    // バッジを発行し、情報のURL（URI）を紐付ける関数
    function mintBadge(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri); // ここでバッジの中身（画像や説明）を登録します
    }
}