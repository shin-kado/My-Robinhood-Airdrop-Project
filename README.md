# My Robinhood Airdrop Project
<br>

### 🚀 Overview / プロジェクト概要
This project is a comprehensive development record on the **Robinhood Chain Testnet**, covering everything from issuing custom ERC-20 tokens to implementing efficient distribution (Airdrop) methods. 
Emphasis is placed on smart contract transparency, with all source code made public and step-by-step manuals provided so that even beginners can safely operate using **Remix**.

このプロジェクトは、Robinhood Chain Testnet上で自作トークンの発行から、複数の手法を用いた効率的な配布（エアドロップ）までを実践するテストプロジェクトです。  
スマートコントラクトの透明性を重視し、すべてのソースコードを公開するとともに、初心者でも**Remix**を使用して安全に操作できる再現性の高いマニュアルを完備しています。  
<br>

> [!IMPORTANT]
> **Testnet Only:** This project is for testing purposes. If MetaMask shows a red warning/error, stop immediately and check your settings according to the manuals.  
> **テストネット専用:** 本プロジェクトはテストネット用です。MetaMaskで赤い警告（エラー）が表示された場合実行を中断し、各マニュアルに従って設定を確認してください。
<br>

### [📖 Full Project Manuals (GitHub Wiki) / プロジェクト総合マニュアル](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki)  
Check the link above for detailed guides. / 上記リンクからご確認できます  
<br>

---

## 🛠 Included Contracts / 収録コントラクト一覧
* [🪙 Base Token (MyToken)](#base-token-mytokenmrt)
* [🏆 Achievements (ERC-721) / 実績証明](#-achievements--nft実績証明-erc-721)
* [📅 Weekly Routine (Storage) / 定期日付保存](#-weekly-routine-storage--定期日付保存storage)
* [🔑 Ownership Management (Owner) / 管理者権限管理](#-ownership-management-owner--管理者権限管理owner)
* [🗳️ Voting System (Ballot) / 電子投票システム](#-voting-system-ballot--電子投票システムballot)
* [⏰ Timed Voting (TimedBallot) / 時間制限付き電子投票](#-timed-voting-timedballot--時間制限付き電子投票システムtimedballot)
* [📦 Simple & Advanced Airdrop / 基本・一括配布](#-simple--advanced-airdrop--基本一括配布simple--advanced)
* [⏳ Time-Locked Airdrop (TimeLock) / タイムロック配布](#-time-locked-airdrop-timelock--タイムロック配布timelock)
* [🛑 Pausable Airdrop / 緊急停止機能付き一括配布](#-pausable-airdrop--緊急停止機能付き一括配布simpleairdroppausable)
* [🎁 Multi-Token Transfer / 複数トークン一括配布](#-multi-token-transfer--複数トークン一括配布multitokentransfer)
* [📜 Whitelisted Multi-Transfer / ホワイトリスト付き一括配布](#-whitelisted-multi-transfer--ホワイトリスト権限管理付き一括配布multitokentransferwithwhitelist)
<br>

## 📜 Deployment Record / コントラクトデプロイ実績 (PDF)  
* [My_Robinhood_Airdrop_Project_Deployment_Ledger.pdf](./docs/My_Robinhood_Airdrop_Project_Deployment_Ledger.pdf)  
<br>

---

## 🪙 Base Token: MyToken（MRT）  
The foundational ERC-20 token used across all distribution projects. / すべての配布プロジェクトの基盤となる自作ERC-20トークンです。  

* **Source Code:** [MyToken.sol](./contracts/MyToken.sol)  
* **Flattened Code (for Verify):** [myToken_flattened.sol](./flattened/myToken_flattened.sol)  
* **Verified Explorer:** [Blockscout (MyToken)](https://explorer.testnet.chain.robinhood.com/address/0x196eCa072F41571233E4F6D215F89A3446DD569b?tab=contract)  
* **Contract Address:** `0x196eCa072F41571233E4F6D215F89A3446DD569b`  
* **Description:** Standard ERC-20 implementation using OpenZeppelin. / OpenZeppelinを使用した標準的なERC-20の実装。  
<br>

## 🏆 Achievements / NFT実績証明 (ERC-721)
Issued an achievement NFT on Robinhood Testnet to prove completion of all project steps. Verified source code on explorer.  
本プロジェクトの全工程を完遂したことを証明するため、Robinhood Testnet 上で実績証明 NFT を発行し、コントラクトの認証（Verify）を完了しました。

* **Source Code:** [MyNFT.sol](./contracts/MyNFT.sol)  
* **Flattened Code:** [MyNFT_flattened.sol](./flattened/MyNFT_flattened.sol)  
* **Achievement NFT:** [Robinhood Early Developer Badge](https://explorer.testnet.chain.robinhood.com/address/0x680AeA01Ee91170d1927Cccb6DA0067875D1e1fC?tab=contract)  
* **Status:** **Verified** (Certified source code) / ソースコード認証済み  
* **On-chain Evidence:** Immutable proof of completing ERC20, Airdrop, and ERC721 implementations.  
* **Metadata:** [JSON Metadata (Hosted on GitHub)](https://raw.githubusercontent.com/shin-kado/My-Robinhood-Airdrop-Project/refs/heads/main/docs/badge.json)  

### 📖 Operation Manual / 操作マニュアル  
* [Achievements / NFT実績証明 (ERC-721)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Achievement-NFT-(ERC%E2%80%90721)-Implementation)  
* [PDF Version](./docs/10.Achievement_NFT_(ERC-721)_Implementation.pdf)  

> [!NOTE]
> This NFT is a digital badge indicating the developer has mastered contract deployment, metadata management, and explorer verification.  
> このNFTは、開発者がスマートコントラクトのデプロイ、メタデータの管理、およびエクスプローラーでの検証プロセスを完全にマスターしたことを示すデジタルバッジです。
<br>

---

## 📅 Weekly Routine (Storage) / 定期日付保存
A tool used weekly to maintain activity on the blockchain. / ブロックチェーン上でのアクティビティを維持するために毎週行う「日付保存」のツールです。  

* **Source Code:** [Storage.sol](./contracts/Storage.sol)  
* **Verified Explorer:** [Blockscout (Storage)](https://explorer.testnet.chain.robinhood.com/address/0x14cbB4da6Ad42877d065eE1D1398c984E0b1a426?tab=contract)  
* **Contract Address:** `0x14cbB4da6Ad42877d065eE1D1398c984E0b1a426`  

### 📖 Operation Manual / 操作マニュアル  
* [Weekly Routine (Storage)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Weekly-Routine-%28Storage%29)  
* [PDF Version](./docs/1.Weekly%20Routine%20(Storage)%20Manual.pdf)  
<br>

## 🔑 Ownership Management (Owner) / 管理者権限管理
Tool to manage and confirm contract ownership. / コントラクトの管理者権限（Ownership）を管理・確認するツールです。  

* **Source Code:** [Owner_Simple.sol](./contracts/Owner_Simple.sol)  
* **Verified Explorer:** [Blockscout (Owner)](https://explorer.testnet.chain.robinhood.com/address/0xca18d49df82e420BBd40a46c95A48d1717976Dd1?tab=contract)  
* **Contract Address:** `0xca18d49df82e420BBd40a46c95A48d1717976Dd1`  

### 📖 Operation Manual / 操作マニュアル  
* [Ownership Management (Owner)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Owner-Manual)  
* [PDF Version](./docs/2.Owner%20Manual.pdf)  
<br>

## 🗳️ Voting System (Ballot) / 電子投票システム
On-chain electronic voting system. / ブロックチェーン上での電子投票システムです。  

* **Source Code:** [Ballot.sol](./contracts/Ballot.sol)  
* **Verified Explorer:** [Blockscout (Ballot)](https://explorer.testnet.chain.robinhood.com/address/0x9f4801277A2e2C67896A06E89021e6bcef7c9106?tab=contract)  
* **Contract Address:** `0x9f4801277A2e2C67896A06E89021e6bcef7c9106`  

### 📖 Operation Manual / 操作マニュアル  
* [Voting System (Ballot)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Ballot-Manual)  
* [PDF Version](./docs/3.Ballot%20Manual.pdf)  
<br>

## ⏰ Timed Voting (TimedBallot) / 時間制限付き電子投票
Voting system with expiration using `block.timestamp`. / **「block.timestamp を利用した、投票期限付きの」**電子投票システムです。  

* **Source Code:** [TimedBallot.sol](./contracts/TimedBallot.sol)  
* **Verified Explorer:** [Blockscout (TimedBallot)](https://explorer.testnet.chain.robinhood.com/address/0x52798A5079e9BCf4409D7287a88bA05b1d72D6a0?tab=contract)  
* **Contract Address:** `0x52798A5079e9BCf4409D7287a88bA05b1d72D6a0`  

### 📖 Operation Manual / 操作マニュアル  
* [Timed Voting (TimedBallot)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/TimedBallot-Manual)  
* [PDF Version](./docs/4.TimedBallot%20Manual.pdf)  
<br>

## 📦 Simple & Advanced Airdrop / 基本・一括配布
Tools for distributing equal amounts to everyone or custom amounts to multiple addresses. / 全員に同じ量を配る、または個別に量を指定して一括送金するツールです。  

* **Source Code:** [SimpleAirdrop.sol](./contracts/SimpleAirDrop.sol) / [AdvancedAirdrop.sol](./contracts/AdvancedAirdrop.sol)  
* **Flattened Code:** [SimpleAirdrop_flattened.sol](./flattened/SimpleAirdrop_flattened.sol) / [AdvancedAirdrop_flattened.sol](./flattened/AdvancedAirdrop_flattened.sol)  
* **Verified Explorer:** [SimpleAirdrop](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract) / [AdvancedAirdrop](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)  
* **Contract Addresses:** * `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258` (Simple)  
  * `0x86238ed61A026604a58D43C554Bde90281f05102` (Advanced)  

### 📖 Operation Manual / 操作マニュアル  
* [Simple & Advanced Airdrop](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Simple-&-Advanced-Airdrop-Manual)  
* [PDF Version](./docs/5.Simple&AdvancedAirdrop%20Manual.pdf)  
<br>

## ⏳ Time-Locked Airdrop (TimeLock) / タイムロック配布
Airdrop tool with a lock function that restricts withdrawals until a specified time. / 指定時間まで引き出しを制限するロック機能付き配布ツールです。  

* **Source Code:** [TimeLockAirdrop.sol](./contracts/TimeLockAirdrop.sol)  
* **Flattened Code:** [TimeLockAirdrop_flattened.sol](./flattened/TimeLockAirdrop_flattened.sol)  
* **Verified Explorer:** [Blockscout (TimeLockAirdrop)](https://explorer.testnet.chain.robinhood.com/address/0x9258F07C118e2F141c676d330A70eAf630b2F90E?tab=contract)  
* **Contract Address:** `0x9258F07C118e2F141c676d330A70eAf630b2F90E`  

### 📖 Operation Manual / 操作マニュアル  
* [TimeLock Airdrop](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/TimeLock-Manual)  
* [PDF Version](./docs/6.TimeLockAirdrop%20Manual.pdf)  
<br>

## 🛑 Pausable Airdrop / 緊急停止機能付き一括配布
Safety-oriented distribution tool with execution control (Pausable) by the administrator. / 管理者による実行制御（Pausable）を搭載した安全性重視の配布ツールです。  

* **Source Code:** [SimpleAirDropPausable.sol](./contracts/SimpleAirDropPausable.sol)  
* **Flattened Code:** [SimpleAirDropPausable_flattened.sol](./flattened/SimpleAirDropPausable_flattened.sol)  
* **Verified Explorer:** [Blockscout (Pausable)](https://explorer.testnet.chain.robinhood.com/address/0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8?tab=contract)  
* **Contract Address:** `0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8`  

### 📖 Operation Manual / 操作マニュアル  
* [Pausable Airdrop](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/SimpleAirDropPausable-Manual)  
* [PDF Version](./docs/7.SimpleAirDropPausable%20Manual.pdf)  
<br>

## 🎁 Multi-Token Transfer / 複数トークン一括配布
A tool to distribute multiple different ERC20 tokens in a single transaction. / 複数の異なるERC20トークンを1回のトランザクションで一括して指定のアドレスへ配布するツールです。  

* **Source Code:** [MultiTokenTransfer.sol](./contracts/MultiTokenTransfer.sol)  
* **Verified Explorer:** [Blockscout (MultiToken)](https://explorer.testnet.chain.robinhood.com/address/0xa547a0B7c0CA10fcf9E904eB9656942E3578e1D7?tab=contract)  
* **Contract Address:** `0xa547a0B7c0CA10fcf9E904eB9656942E3578e1D7`  

### 📖 Operation Manual / 操作マニュアル  
* [Multi-Token Transfer](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Multi%E2%80%90Token-Transfer-Manual)  
* [PDF Version](./docs/8.Multi-Token%20Transfer%20Manual.pdf)  
<br>

## 📜 Whitelisted Multi-Transfer / ホワイトリスト付き一括配布
Batch distribution of multiple ERC20 tokens with whitelist permission management. / 複数の異なるERC20トークンをホワイトリスト管理付きで一括配布するツールです。  

* **Source Code:** [MultiTokenTransferWithWhitelist.sol](./contracts/MultiTokenTransferWithWhitelist.sol)  
* **Verified Explorer:** [Blockscout (Whitelist)](https://explorer.testnet.chain.robinhood.com/address/0xEC4Ae1A488a4615d5e159c6c0675c38a9Bd27376)  
* **Contract Address:** `0xEC4Ae1A488a4615d5e159c6c0675c38a9Bd27376`  

### 📖 Operation Manual / 操作マニュアル  
* [Whitelisted Multi-Transfer](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/MultiTokenTransfer-%28ERC20-Batch-Transfer-with-Whitelist%29-Manual)  
* [PDF Version](./docs/9.MultiTokenTransferWithWhitelist%20Manual.pdf)  
<br>

---

### 💡 Tips  
* **Direct Execution:** Verified contracts can be executed directly from the "Write Contract" tab on the explorer without using Remix.  
* 検証済みコントラクトは、エクスプローラー上の「Contract」>「Write Contract」タブから、Remixを使わずに直接実行することも可能です。
<br>

---

## 🛠 Tools / 開発ツール
- Remix IDE
- MetaMask
- Robinhood Chain Testnet Explorer

---

## 💻 Environment / 開発環境
* **Solidity:** 0.8.20
* **Network:** Robinhood Chain Testnet
