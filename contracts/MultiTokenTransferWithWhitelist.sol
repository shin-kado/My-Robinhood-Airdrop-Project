// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract MultiTokenTransfer {
    address public owner;
    
    // ホワイトリスト：アドレスごとに許可(true)か拒否(false)を記録
    mapping(address => bool) public whitelist;

    // オーナーだけが実行できる制限
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // ホワイトリストに載っている人だけが実行できる制限
    modifier onlyWhitelisted() {
        require(whitelist[msg.sender] || msg.sender == owner, "Not whitelisted");
        _;
    }

    constructor() {
        owner = msg.sender; // デプロイした人をオーナーに設定
    }

    // ホワイトリストにアドレスを追加・削除する関数（オーナー専用）
    function updateWhitelist(address _user, bool _status) external onlyOwner {
        whitelist[_user] = _status;
    }

    // 送金関数に onlyWhitelisted を追加
    function multiTransfer(
        address[] calldata tokens,
        uint256[] calldata amounts,
        address recipient
    ) external onlyWhitelisted {
        require(tokens.length == amounts.length, "Tokens and amounts length mismatch");

        for (uint256 i = 0; i < tokens.length; i++) {
            bool success = IERC20(tokens[i]).transferFrom(msg.sender, recipient, amounts[i]);
            require(success, "Transfer failed");
        }
    }
}
