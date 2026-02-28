# My Robinhood Airdrop Project  
<br>

このプロジェクトは、Robinhood Chain Testnet上で自作トークンの発行から、複数の手法を用いた効率的な配布（エアドロップ）までを実践するテストプロジェクトです。  

スマートコントラクトの透明性を重視し、すべてのソースコードを公開するとともに、初心者でも**Remix**を使用して安全に操作できる再現性の高いマニュアルを完備しています。  


## 🪙 Base Token: MyToken (MRT)  
　　すべての配布プロジェクトの基盤となる自作ERC-20トークンです。  

　　・ソースコード： [MyToken.sol](./MyToken.sol)  
  
　　・フラット化済みコード (Verify用)： [myToken_flattened.sol](./myToken_flattened.sol)    
  
　　・検証済みのアドレスは[こちら](https://explorer.testnet.chain.robinhood.com/address/0x196eCa072F41571233E4F6D215F89A3446DD569b?tab=contract)から確認できます。  
　　　　（※別タブで開くには Ctrl + クリックしてください）  
    
　　・MyToken アドレス：`0x196eCa072F41571233E4F6D215F89A3446DD569b`  
  
　　・Description: OpenZeppelinを使用した標準的なERC-20の実装。  
<br>
<br>

## 基本・一括配布 (Simple & Advanced)  
　　全員に同じ量を配る、または個別に量を指定して一括送金する  

　　・ソースコード  
　　　　・ [SimpleAirdrop.sol](./SimpleAirDrop.sol)  
　　　　・ [AdvancedAirdrop.sol](./AdvancedAirdrop.sol)  

　　・フラット化済みコード (Verify用)  
　　　　・ [SimpleAirdrop_flattened.sol](./SimpleAirdrop_flattened.sol)  
　　　　・ [AdvancedAirdrop_flattened.sol](./AdvancedAirdrop_flattened.sol)  
   
　　・検証済みのアドレス  
　　　　・[SimpleAirdrop検証済みURL](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)  
    
　　　　・[AdvancedAirdrop検証済みURL](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)  

　　・コントラクトアドレス  
　　　　・**SimpleAirdrop アドレス**: `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258`  
　　　　・**AdvancedAirdrop アドレス**: `0x86238ed61A026604a58D43C554Bde90281f05102`  

　　・[📖 基本・一括配布操作マニュアル(Simple & Advanced)](./SIMPLE_ADVANCED_MANUAL.md)  
　　　（※別タブで開くには Ctrl + クリックしてください）
<br>
<br>

## タイムロック配布 (TimeLock)  
　　指定した時間までトークンを引き出せないように制限をかけて配布する  

　　・ソースコード： [TimeLockAirdrop.sol](./TimeLockAirdrop.sol)    

　　・フラット化済みコード (Verify用)： [TimeLockAirdrop_flattened.sol](./TimeLockAirdrop_flattened.sol)  

　　・検証済みのアドレス： [TimeLockAirdrop検証済みURL](https://explorer.testnet.chain.robinhood.com/address/0x9258F07C118e2F141c676d330A70eAf630b2F90E?tab=contract)  
  
　　・コントラクトアドレス  
　　　　・**TiemeLockAirdrop アドレス** `0x9258F07C118e2F141c676d330A70eAf630b2F90E`  

　　・[📖 タイムロック配布マニュアル (TimeLock)](./TIMELOCK_MANUAL.md)  
　　　（※別タブで開くには Ctrl + クリックしてください）
<br>
<br>

## 緊急停止機能付き一括配布（SimpleAirDropPausable）  
　　配布停止機能付きで一括配布する手順です。  

　　・ソースコード： [SimpleAirDropPausable.sol](./SimpleAirDropPausable.sol)  

　　・フラット化済みコード (Verify用)： [SimpleAirDropPausable_flattened.sol](./SimpleAirDropPausable_flattened.sol)  
  

　　・検証済みのアドレス： [SimpleAirDropPausable検証済みURL](https://explorer.testnet.chain.robinhood.com/address/0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8?tab=contract)  

　　・コントラクトアドレス  
　　　　・**SimpleAirDropPausable アドレス** `0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8`  

　　・[📖 緊急停止機能付き一括配布操作マニュアル（SimpleAirDropPausable）](./SIMPLE_PAUSABLE_MANUAL.md)  
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
