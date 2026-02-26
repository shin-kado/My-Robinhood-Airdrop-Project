// TimeLockAirdrop：条件付き自動送金（タイムロック）機能 （2026/02/26作成）
// # TimelockAirdrop 最終検証済みフラット化コード (2026/02/26作成)
// # Verified Address: 0x9258F07C118e2F141c676d330A70eAf630b2F90E

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title TimeLockAirdrop
 * @dev 指定した時間（Unixタイムスタンプ）が経過するまで引き出しを制限する一括送金
 */
contract TimeLockAirdrop is Ownable {

    struct LockBox {
        address tokenAddress;
        uint256 amount;
        uint256 unlockTime;
        bool claimed;
    }

    // ユーザーごとのロック情報管理
    mapping(address => LockBox[]) public userLockBoxes;

    constructor() Ownable(msg.sender) {}

    /**
     * @notice トークンをロックした状態で配布する
     * @param tokenAddress 対象トークン
     * @param recipients 配布先
     * @param amounts 数量
     * @param unlockTime 解除時間（Unixタイムスタンプ）
     */
    function depositLockedTokens(
        address tokenAddress,
        address[] calldata recipients,
        uint256[] calldata amounts,
        uint256 unlockTime
    ) external onlyOwner {
        require(recipients.length == amounts.length, "Length mismatch");
        require(unlockTime > block.timestamp, "Unlock time must be in the future");

        IERC20 token = IERC20(tokenAddress);

        for (uint256 i = 0; i < recipients.length; i++) {
            // オーナーからこのコントラクトへトークンを移動
            require(token.transferFrom(msg.sender, address(this), amounts[i]), "Transfer failed");

            // ロック情報を記録
            userLockBoxes[recipients[i]].push(LockBox({
                tokenAddress: tokenAddress,
                amount: amounts[i],
                unlockTime: unlockTime,
                claimed: false
            }));
        }
    }

    /**
     * @notice 受取人が自分でトークンを引き出す関数
     */
    function claim(uint256 boxIndex) external {
        LockBox storage box = userLockBoxes[msg.sender][boxIndex];
        require(!box.claimed, "Already claimed");
        require(block.timestamp >= box.unlockTime, "Tokens are still locked");

        box.claimed = true;
        IERC20(box.tokenAddress).transfer(msg.sender, box.amount);
    }
}