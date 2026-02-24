// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    // トークン名「My Robinhood Token」、単位「MRT」として作成
    constructor() ERC20("My Robinhood Token", "MRT") {
        // 自分（作成者）に100万枚発行する
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
