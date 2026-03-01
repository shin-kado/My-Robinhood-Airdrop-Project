// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title MultiTokenTransfer
 * @dev 複数の異なるERC20トークンを、一括で一つのアドレスに送信するコントラクト
 */

// 外部のトークンとやり取りするための「窓口」の定義
interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract MultiTokenTransfer {
    
    /**
     * @dev 複数トークンを一括送信する関数
     * @param tokens 送信したいトークンのコントラクトアドレスの配列
     * @param amounts それぞれのトークンの送信数量の配列
     * @param recipient 送り先のアドレス（1つ）
     */
    function multiTransfer(
        address[] calldata tokens,
        uint256[] calldata amounts,
        address recipient
    ) external {
        // トークンリストと数量リストの数が一致しているか確認
        require(tokens.length == amounts.length, "Tokens and amounts length mismatch");

        for (uint256 i = 0; i < tokens.length; i++) {
            // IERC20インターフェースを通じて、各トークンコントラクトに「送金」を命令する
            // 実行者のウォレット(msg.sender)から受取人(recipient)へ送る
            bool success = IERC20(tokens[i]).transferFrom(msg.sender, recipient, amounts[i]);
            require(success, "Transfer failed");
        }
    }
}