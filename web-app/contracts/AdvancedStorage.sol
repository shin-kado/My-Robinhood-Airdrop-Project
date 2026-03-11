// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedStorage {
    address public owner;

    // データの箱（4種類）
    uint256 public anyNumber;           // 1. 数値（誰でも）
    uint256 public ownerNumber;         // 2. 数値（Ownerのみ）
    string public anyText;              // 3. 文字（誰でも）
    string public ownerText;            // 4. 文字（Ownerのみ）

    constructor() {
        owner = msg.sender; // デプロイした人をOwnerに設定
    }

    // 1. 数値：誰でも書き換え
    function setAnyNumber(uint256 _num) public {
        anyNumber = _num;
    }

    // 2. 数値：Ownerのみ
    function setOwnerNumber(uint256 _num) public {
        require(msg.sender == owner, "Not the owner");
        ownerNumber = _num;
    }

    // 3. 文字：誰でも書き換え
    function setAnyText(string memory _text) public {
        anyText = _text;
    }

    // 4. 文字：Ownerのみ
    function setOwnerText(string memory _text) public {
        require(msg.sender == owner, "Not the owner");
        ownerText = _text;
    }
}