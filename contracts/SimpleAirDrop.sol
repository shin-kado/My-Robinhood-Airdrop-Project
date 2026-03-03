// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// 管理者制限機能を追加するためのライブラリをインポート
import "@openzeppelin/contracts/access/Ownable.sol";

// Ownableを継承することで、管理者（Owner）の概念が追加されます
contract SimpleAirdrop is Ownable {

    // コンストラクタで、デプロイした人を初期のオーナーとして設定します
    constructor() Ownable(msg.sender) {}

    /**
     * @dev 指定したトークンを複数人に一括送金する（管理者のみ実行可能）
     * `onlyOwner` という修飾子を付けることで、オーナー以外が実行するとエラーになります
     */
    function sendTokens(
        address tokenAddress, 
        address[] calldata recipients, 
        uint256 amount
    ) external onlyOwner {
        IERC20 token = IERC20(tokenAddress);
        
        for (uint256 i = 0; i < recipients.length; i++) {
            // トークンを送付元（オーナー）から受取人へ移動
            token.transferFrom(msg.sender, recipients[i], amount);
        }
    }
}
