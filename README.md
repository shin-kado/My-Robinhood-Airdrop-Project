# My Robinhood Airdrop Project  
<br>

このプロジェクトは、Robinhood Chain Testnet上で自作トークンの発行から、複数の手法を用いた効率的な配布（エアドロップ）までを実践するテストプロジェクトです。

スマートコントラクトの透明性を重視し、すべてのソースコードを公開するとともに、初心者でも**Remix**を使用して安全に操作できる再現性の高いマニュアルを完備しています。

---



> [!IMPORTANT]
> 本プロジェクトはテストネット用です。  
> **MetaMaskで赤い警告（エラー）が表示された場合**
> 入力したアドレスや数値、あるいはロック解除時間の設定が正しくない可能性があります。そのまま実行するとガス代のみが消費されるため、必ず一度「拒否」をクリックし、マニュアルの手順に従って入力内容を再確認してください。
<br>

## 📖 操作マニュアル
具体的な使い方は、以下の各マニュアルを参照してください。

- [基本・一括配布マニュアル (Simple & Advanced)](./SIMPLE_ADVANCED_MANUAL.md)  
　　全員に同じ量を配る、または個別に量を指定して一括送金する手順です。
<br>

- [タイムロック配布マニュアル (TimeLock)](./TIMELOCK_MANUAL.md)  
　　指定した時間までトークンを引き出せないように制限をかけて配布する手順です。  
<br>

- [緊急停止機能付き一括配布操作マニュアル（SimpleAirDropPausable）](./SIMPLE_PAUSABLE_MANUAL.md)  
　　配布停止機能付きで一括配布する手順です。
<br>

このプロジェクトは、Robinhood Chain Testnet で自作トークン（MRT）を発行し、
セキュリティ機能付きの一括送金（Airdrop）を成功させた開発実績です。
<br>
<br>

## ソースコード  
* [SimpleAirdrop.sol](./SimpleAirdrop.sol)  
　　[AdvancedAirdrop.sol](./AdvancedAirdrop.sol)  
　　[TimeLockAirdrop.sol](./TimeLockAirdrop.sol)  
　　[SimpleAirDropPausable.sol](./SimpleAirDropPausable.sol)  
<br>

## フラット化済みコード (Verify用)
　　[SimpleAirdrop_flattened.sol](./SimpleAirdrop_flattened.sol)  
　　* [AdvancedAirdrop_flattened.sol](./AdvancedAirdrop_flattened.sol)
* [TimeLockAirdrop_flattened.sol](./TimeLockAirdrop_flattened.sol)
* [SimpleAirDropPausable_flattened.sol](./SimpleAirDropPausable_flattened.sol)

## フラット化済みコード (Verify用)  
　　[SimpleAirdrop_flattened.sol](./SimpleAirdrop_flattened.sol)  
　　[AdvancedAirdrop_flattened.sol](./AdvancedAirdrop_flattened.sol)  
　　[TimeLockAirdrop_flattened.sol](./TimeLockAirdrop_flattened.sol)  
　　[SimpleAirDropPausable_flattened.sol](./SimpleAirDropPausable_flattened.sol)  
<br>  

## 実績ドキュメント
- **MyToken アドレス**: `0x196eCa072F41571233E4F6D215F89A3446DD569b`
- **SimpleAirdrop アドレス**: `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258`
- **AdvancedAirdrop アドレス**: `0x86238ed61A026604a58D43C554Bde90281f05102`
- **TiemeLockAirdrop アドレス** `0x9258F07C118e2F141c676d330A70eAf630b2F90E`
- **SimpleAirDropPausable アドレス** `0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8`
<br>

## 検証済みコントラクト  
- **SimpleAirdrop検証済みURL**:
　　　　[https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)
<br>

- **AdvancedAirdrop検証済みURL**: 
　　　　[https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)
<br>

- **TimeLockAirdrop検証済みURL**:
　　　　[https://explorer.testnet.chain.robinhood.com/address/0x9258F07C118e2F141c676d330A70eAf630b2F90E?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x9258F07C118e2F141c676d330A70eAf630b2F90E?tab=contract)
<br>

- **SimpleAirDropPausable検証済みURL**:
　　　　[https://explorer.testnet.chain.robinhood.com/address/0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x1cd4DB04175bfdD2e8802d52C995B79294Dc5ac8?tab=contract)
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
