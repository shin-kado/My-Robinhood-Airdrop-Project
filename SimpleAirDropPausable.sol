// # SimpleAirDropPausable 緊急停止機能付き・管理者限定（Ownable）一括送金機能 (2026/02/28作成)
// # SimpleAirDropPausable 最終検証済みフラット化コード (2026/02/28作成)
// # Verified Address: 0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleAirDropPausable is Ownable {

    // 1. 停止状態を管理する変数（false = 稼働中 / true = 停止中）
    bool public paused;

    constructor() Ownable(msg.sender) {}

    // 2. 停止・再開を切り替える関数（オーナーのみ実行可能）
    function setPaused(bool _state) external onlyOwner {
        paused = _state;
    }

    /**
     * @dev 指定したトークンを複数人に一括送金する（管理者のみ実行可能）
     */
    function sendTokens(
        address tokenAddress, 
        address[] calldata recipients, 
        uint256 amount
    ) external onlyOwner {
        // 3. 実行前に「停止中でないこと」を確認する検問
        require(!paused, "Contract is paused");

        IERC20 token = IERC20(tokenAddress);
        
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transferFrom(msg.sender, recipients[i], amount);
        }
    }
}