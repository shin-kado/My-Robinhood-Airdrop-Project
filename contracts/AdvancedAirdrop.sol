// AdvancedAirdrop：個別数量指定の一括送金（2026/02/25作成）

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AdvancedAirdrop
 * @dev 送り先ごとに異なる数量を指定して一括送金できるコントラクト
 * 昨日のコードに「個別数量指定」の機能を追加しました。
 */
contract AdvancedAirdrop is Ownable {

    constructor() Ownable(msg.sender) {}

    /**
     * @notice 複数のアドレスに、それぞれ異なる数量のトークンを一括で送金します
     * @param tokenAddress 操作するトークンのコントラクトアドレス
     * @param recipients 送り先のアドレスの配列
     * @param amounts それぞれに送る数量の配列（recipientsと同じ順番で入力）
     */
    function sendAdvancedTokens(
        address tokenAddress,
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external onlyOwner {
        require(recipients.length == amounts.length, "Recipients and amounts length mismatch");
        
        IERC20 token = IERC20(tokenAddress);

        for (uint256 i = 0; i < recipients.length; i++) {
            require(token.transferFrom(msg.sender, recipients[i], amounts[i]), "Transfer failed");
        }
    }
}
