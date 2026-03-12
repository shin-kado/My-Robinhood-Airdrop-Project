// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedStorage {
    address public owner;

    uint256 public anyNumber;
    uint256 public ownerNumber;
    string public anyText;
    string public ownerText;

    // 履歴を記録するための「イベント」を定義
    event DataUpdated(
        address indexed sender, // 実行者のアドレス
        string userName,        // 入力された名前
        string label,           // どの項目を更新したか（"Any Number"など）
        string newValue,        // 更新後の値（文字として記録）
        uint256 timestamp       // 更新時刻
    );

    constructor() {
        owner = msg.sender;
    }

    // 1. 数値：誰でも書き換え
    function setAnyNumber(uint256 _num, string memory _userName) public {
        anyNumber = _num;
        // イベントを発行（数値を文字に変換して記録）
        emit DataUpdated(msg.sender, _userName, "Any Number", uint2str(_num), block.timestamp);
    }

    // 2. 数値：Ownerのみ
    function setOwnerNumber(uint256 _num, string memory _userName) public {
        require(msg.sender == owner, "Not the owner");
        ownerNumber = _num;
        emit DataUpdated(msg.sender, _userName, "Owner Number", uint2str(_num), block.timestamp);
    }

    // 3. 文字：誰でも書き換え
    function setAnyText(string memory _text, string memory _userName) public {
        anyText = _text;
        emit DataUpdated(msg.sender, _userName, "Any Text", _text, block.timestamp);
    }

    // 4. 文字：Ownerのみ
    function setOwnerText(string memory _text, string memory _userName) public {
        require(msg.sender == owner, "Not the owner");
        ownerText = _text;
        emit DataUpdated(msg.sender, _userName, "Owner Text", _text, block.timestamp);
    }

    // 数値を文字に変換するためのヘルパー関数
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}