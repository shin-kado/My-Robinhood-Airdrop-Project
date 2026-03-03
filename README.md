# My Robinhood Airdrop Project  
<br>

このプロジェクトは、Robinhood Chain Testnet上で自作トークンの発行から、複数の手法を用いた効率的な配布（エアドロップ）までを実践するテストプロジェクトです。  

スマートコントラクトの透明性を重視し、すべてのソースコードを公開するとともに、初心者でも**Remix**を使用して安全に操作できる再現性の高いマニュアルを完備しています。  
<br>

> [!IMPORTANT]
> 本プロジェクトはテストネット用です。  
> **MetaMaskで赤い警告（エラー）が表示された場合実行を中断し、各マニュアルに従って設定を確認してください。**
<br>
<br>

### [📖 プロジェクト総合マニュアル (GitHub Wiki)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki)  
　　　上記リンクからご確認できます  
<br>
<br>

## 🛠 収録コントラクト一覧
* [🪙 Base Token (MyToken)](#-base-token-mytoken-mrt)
* [📅 定期日付保存 (Storage)](#定期日付保存-storage)
* [🔑 管理者権限管理 (Owner)](#管理者権限管理-owner)
* [🗳️ 電子投票システム (Ballot)](#電子投票システム-ballot)
* [⏱️ 時間制限付き電子投票 (TimedBallot)](#時間制限付き電子投票システム-timedballot)
* [📦 基本・一括配布 (Simple & Advanced)](#基本一括配布-simple--advanced)
* [⏳ タイムロック配布 (TimeLock)](#タイムロック配布-timelock)
* [🛑 緊急停止機能付き一括配布](#緊急停止機能付き一括配布simpleairdroppausable)
* [🎁複数トークン一括配布](#複数トークン一括配布MultiTokenTransfer)
* [📜ホワイトリスト権限管理付き一括配布](#ホワイトリスト権限管理付き一括配布MultiTokenTransferWithWhitelist)
<br>
<br>



## 🪙 Base Token: MyToken (MRT)  
　　すべての配布プロジェクトの基盤となる自作ERC-20トークンです。  

　　・ソースコード： [MyToken.sol](./MyToken.sol)  
  
　　・フラット化済みコード (Verify用)： [myToken_flattened.sol](./myToken_flattened.sol)    
  
　　・検証済みエクスプローラー： [Blockscout（MyToken）](https://explorer.testnet.chain.robinhood.com/address/0x196eCa072F41571233E4F6D215F89A3446DD569b?tab=contract)  
    
　　・**MyToken アドレス**：`0x196eCa072F41571233E4F6D215F89A3446DD569b`  
  
　　・Description: OpenZeppelinを使用した標準的なERC-20の実装。  
<br>
<br>

## 定期日付保存 (Storage)
　　ブロックチェーン上でのアクティビティを維持するために毎週行う「日付保存」のツールです。  

　　・ソースコード： [Storage.sol](./Storage.sol)  
　　・検証済みエクスプローラー： [Blockscout（Storage）](https://explorer.testnet.chain.robinhood.com/address/0x14cbB4da6Ad42877d065eE1D1398c984E0b1a426?tab=contract)  
　　・コントラクトアドレス  
　　　　・**Storage アドレス** `0x14cbB4da6Ad42877d065eE1D1398c984E0b1a426`  

### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [定期日付保存 (Storage)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Weekly-Routine-%28Storage%29)  
<br>
<br>

## 管理者権限管理 (Owner)  
　　コントラクトの管理者権限（Ownership）を管理・確認するツールです。  

　　・ソースコード： [Owner_Simple.sol](./Owner_Simple.sol)  
　　・検証済みエクスプローラー： [Blockscout（Owner）](https://explorer.testnet.chain.robinhood.com/address/0xca18d49df82e420BBd40a46c95A48d1717976Dd1?tab=contract)  
　　　　・**Owner アドレス** `0xca18d49df82e420BBd40a46c95A48d1717976Dd1`  
    
### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [管理者権限管理 (Owner)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Owner-Manual)  
<br>
<br>
## 電子投票システム (Ballot)  
　　ブロックチェーン上での電子投票システムです。  

　　・ソースコード： [Ballot.sol](./Ballot.sol)  
　　・検証済みエクスプローラー： [Blockscout（Ballot）](https://explorer.testnet.chain.robinhood.com/address/0x9f4801277A2e2C67896A06E89021e6bcef7c9106?tab=contract)  
　　　　・**Ballot アドレス** `0x9f4801277A2e2C67896A06E89021e6bcef7c9106`  


### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [時間制限付き電子投票システム (Ballot)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Ballot-Manual)
<br>
<br>

## 時間制限付き電子投票システム (TimedBallot)  
　　**「 block.timestamp を利用した、投票期限付きの」**電子投票システムです。  

　　・ソースコード： [TimedBallot.sol](./TimedBallot.sol)  
　　・検証済みエクスプローラー： [Blockscout（TimedBallot）](https://explorer.testnet.chain.robinhood.com/address/0x52798A5079e9BCf4409D7287a88bA05b1d72D6a0?tab=contract)  
　　　　・**TimedBallot アドレス** `0x52798A5079e9BCf4409D7287a88bA05b1d72D6a0`  


### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
  　　　　　* [時間制限付き電子投票システム (TimedBallot)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/TimedBallot-Manual)
<br>
<br>

## 基本・一括配布 (Simple & Advanced)  
　　全員に同じ量を配る、または個別に量を指定して一括送金するツールです。  

　　・ソースコード  
　　　　・ [SimpleAirdrop.sol](./SimpleAirDrop.sol)  
　　　　・ [AdvancedAirdrop.sol](./AdvancedAirdrop.sol)  

　　・フラット化済みコード (Verify用)  
　　　　・ [SimpleAirdrop_flattened.sol](./SimpleAirdrop_flattened.sol)  
　　　　・ [AdvancedAirdrop_flattened.sol](./AdvancedAirdrop_flattened.sol)  
   
　　・検証済みエクスプローラー  
　　　　・ [Blockscout（SimpleAirdrop）](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)  
    
　　　　・ [Blockscout（AdvancedAirdrop）](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)  

　　・コントラクトアドレス  
　　　　・**SimpleAirdrop アドレス**: `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258`  
　　　　・**AdvancedAirdrop アドレス**: `0x86238ed61A026604a58D43C554Bde90281f05102`  


### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [基本・一括配布 (Simple & Advanced)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Simple-&-Advanced-Airdrop-Manual)  
　　　　　　（※別タブで開くには Ctrl + クリックしてください）  
<br>
<br>

## タイムロック配布 (TimeLock)  
　　指定時間まで引き出しを制限するロック機能付き配布ツールです。  

　　・ソースコード： [TimeLockAirdrop.sol](./TimeLockAirdrop.sol)    

　　・フラット化済みコード (Verify用)： [TimeLockAirdrop_flattened.sol](./TimeLockAirdrop_flattened.sol)  

　　・検証済みエクスプローラー  
　　　　・ [Blockscout（TimeLockAirdrop）](https://explorer.testnet.chain.robinhood.com/address/0x9258F07C118e2F141c676d330A70eAf630b2F90E?tab=contract)  
  
　　・コントラクトアドレス  
　　　　・**TimeLockAirdrop アドレス** `0x9258F07C118e2F141c676d330A70eAf630b2F90E`  


### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [タイムロック配布 (TimeLock)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/TimeLock-Manual)  
　　　　　　（※別タブで開くには Ctrl + クリックしてください）  
<br>
<br>

## 緊急停止機能付き一括配布（SimpleAirDropPausable）  
　管理者による実行制御（Pausable）を搭載した安全性重視の配布ツールです。  

　　・ソースコード： [SimpleAirDropPausable.sol](./SimpleAirDropPausable.sol)  

　　・フラット化済みコード (Verify用)： [SimpleAirDropPausable_flattened.sol](./SimpleAirDropPausable_flattened.sol)  
  

　　・検証済みエクスプローラー  
　　　　・ [Blockscout（SimpleAirDropPausable）](https://explorer.testnet.chain.robinhood.com/address/0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8?tab=contract)  

　　・コントラクトアドレス  
　　　　・**SimpleAirDropPausable アドレス** `0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8`  

### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [緊急停止機能付き一括配布 (SimpleAirDropPausable)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/SimpleAirDropPausable-Manual)  
　　　　　　（※別タブで開くには Ctrl + クリックしてください）  
<br>
<br>

## 複数トークン一括配布（MultiTokenTransfer）  
　複数の異なるERC20トークンを1回のトランザクションで一括して指定のアドレスへ配布するツールです。  

　　・ソースコード： [MultiTokenTransfer.sol](./MultiTokenTransfer.sol)  


　　・検証済みエクスプローラー  
　　　　・ [Blockscout（MultiTokenTransfer）](https://explorer.testnet.chain.robinhood.com/address/0xa547a0B7c0CA10fcf9E904eB9656942E3578e1D7?tab=contract)  

　　・コントラクトアドレス  
　　　　・**MultiTokenTransfer アドレス** `0xa547a0B7c0CA10fcf9E904eB9656942E3578e1D7`  

### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [複数トークン一括配布 (MultiTokenTransfer)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/Multi%E2%80%90Token-Transfer-Manual)  
　　　　　　（※別タブで開くには Ctrl + クリックしてください）  
<br>
<br>

## ホワイトリスト権限管理付き一括配布（MultiTokenTransferWithWhitelist）  
　複数の異なるERC20トークンを1回のトランザクションで一括して指定のアドレスへ配布するツールです。  

　　・ソースコード： [MultiTokenTransferWithWhitelist.sol](./MultiTokenTransferWithWhitelist.sol)  


　　・検証済みエクスプローラー  
　　　　・ [Blockscout（MultiTokenTransfer）](https://explorer.testnet.chain.robinhood.com/address/0xEC4Ae1A488a4615d5e159c6c0675c38a9Bd27376)  

　　・コントラクトアドレス  
　　　　・**MultiTokenTransferWithWhitelist アドレス** `0xEC4Ae1A488a4615d5e159c6c0675c38a9Bd27376`  

### 　　📖 操作マニュアル  
　　　　　具体的な使い方は、GitHub Wikiにてステップバイステップで解説しています。  
　　　　　* [ホワイトリスト権限管理付き一括配布 (MultiTokenTransferWithWhitelist)](https://github.com/shin-kado/My-Robinhood-Airdrop-Project/wiki/MultiTokenTransfer-%28ERC20-Batch-Transfer-with-Whitelist%29-Manual)  
　　　　　　（※別タブで開くには Ctrl + クリックしてください）  
<br>
<br>

### 💡 Tips  
 * 検証済みコントラクトは、エクスプローラー上の「Contract」>「Write Contract」タブから、Remixを使わずに直接実行することも可能です。
<br>
<br>

---
## 🛠 開発ツール
- Remix IDE
- MetaMask
- Robinhood Chain Testnet Explorer


---
## 🛠 開発環境
* Solidity: 0.8.20
* Network: Robinhood Chain Testnet
