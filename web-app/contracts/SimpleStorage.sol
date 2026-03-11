// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 public storedData;

    // 数字を保存する関数
    function set(uint256 x) public {
        storedData = x;
    }

    // 保存された数字を見る関数（storedDataがpublicなので自動で作られますが、明示的にも書けます）
    function get() public view returns (uint256) {
        return storedData;
    }
}