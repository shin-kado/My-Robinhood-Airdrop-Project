# 基本・一括配布マニュアル (Simple & Advanced)操作マニュアル  
## （SimpleAirdrop & AdvancedAirdrop 対応版）  
<br>

### 📖 機能説明  
この手順書は、Remixを使用して自作トークン（MRT）や株式トークン（TSLA/AMZN等）を複数アドレスへ効率的に配布するための標準マニュアルです。  
<BR>

> [!IMPORTANT]
> 本プロジェクトはテストネット用です。  
> **MetaMaskで赤い警告（エラー）が表示された場合**
> 入力したアドレスや数値の設定が正しくない可能性があります。  
> そのまま実行するとガス代のみが消費されるため、**必ず一度「拒否」をクリック**し、マニュアルの手順に従って入力内容を再確認してください。
<br>

## ソースコード  
　　・ [SimpleAirdrop.sol](./SimpleAirDrop.sol)  
　　・ [AdvancedAirdrop.sol](./AdvancedAirdrop.sol)    
<br>

## フラット化済みコード (Verify用)  
　　・ [SimpleAirdrop_flattened.sol](./SimpleAirdrop_flattened.sol)  
　　・ [AdvancedAirdrop_flattened.sol](./AdvancedAirdrop_flattened.sol)    
<br>
<br>
 
  ## ステップ 1：環境とネットワークの同期  
  
  ### 　　1．MetaMaskの確認:  
　　　　ネットワークが「Robinhood Chain Testnet」になっていることを確認します 。  
<br>
  ### 　　2．Remixの接続:  
　　　　Deploy & Run Transactions タブの ENVIRONMENT で Injected Provider - MetaMask を選択します 。   
<br>
  ### 　　3．チェーンIDの確認:  
　　　　Custom (46630) network と表示されていることを必ず確認してください 。  
<br>

  ## ステップ 2：コントラクトの読み込み（At Address）  
  
　　すでにデプロイ済みのコントラクトを操作パネルに呼び出します。  
    
### 　　1. トークンパネルの準備  
    
　　　　• CONTRACT欄: MyToken（または IERC20）を選択します 。  
     
　　　　• At Addressボタンの横: 送りたいトークンのアドレス を貼り付けてボタンをクリックします 。  
     
　　　　※重要: TSLAなどの株式トークンを送る場合は、MyTokenのアドレスではなく TSLAのアドレス を使用してください。  
<br>
### 　　2. 送金用コントラクト（道具）の準備  
  　　　　• CONTRACT欄: 使用したい方のコントラクトを選択します。  
<br>
　　　　　　　* 全員に同じ量を送るなら：SimpleAirdrop  
　　　　　　　* 人ごとに違う量を送るなら：AdvancedAirdrop  
<br>
　　　　• At Addressボタンの横: 上記の コントラクトアドレス を貼り付けてボタンをクリックします 。  
<br>

## ステップ 3：送金の許可（Approve）  
　　このステップを忘れると送金は必ず失敗します。  
<br>
### 　　1. ステップ2-①で出した 「送りたいトークン（TSLAやMRT）」のパネル を開きます 。  

### 　　2．approve 関数に以下を入力します：  
<br>

　　　　　・spender: 使用する送金用コントラクトのアドレス（Simple or Advanced）を貼り付けます 。  
　　　　　・value: 送付する 合計数量 を18桁のゼロを付けて入力します。  
　　　　　　　　　　　例：合計5枚なら 5000000000000000000  
　　　　　　　　　　　　　　5の後ろに0を18個つける  
<br>

### 　　3. transact を押し、MetaMaskで承認します 。  
<br>

　　　＊注意事項: spender に自分の財布のアドレスを入れてしまうミスが多いです。  
　　　　必ず「SimpleAirdropのアドレス」を指定してください。  
<br>

## ステップ 4：一括送金の実行  
　　使用するコントラクトに合わせて、以下のいずれかを実行します。  
　　下記を入力後にtransact を押し、MetaMaskで承認します 。  
<br>
### 　　A. SimpleAirdrop を使う場合（全員同量）  

　　　　　　1. SIMPLEAIRDROP パネルの sendTokens を開きます 。  

　　　　　　2. 入力欄：  

　　　　　　　　　◦ tokenAddress: 送りたいトークンのアドレス  

　　　　　　　　　◦ recipients: ["アドレス1", "アドレス2"] （カッコと引用符に注意）  
       
　　　　　　　　　◦ amount: 1人あたりの数量（数量に0を18個つける）  
<br> 

### 　　B. AdvancedAirdrop を使う場合（個別数量）　　

　　　　　　1. ADVANCEDAIRDROP パネルの sendAdvancedTokens を開きます 。  

　　　　　　2. 入力欄：  

　　　　　　　　　◦ tokenAddress: 送りたいトークンのアドレス   

　　　　　　　　　◦ recipients: ["アドレス1", "アドレス2"]   

　　　　　　　　　◦ amounts: [数量1, 数量2] （数量に0を18個つける。人数分をカンマ区切りで入力）  
<br>

## 失敗しないための最終チェックリスト  

　　• 承認パネルのミス: 送りたいトークンがTSLAなら、TSLAのパネルで approve しましたか？  

　　• 配列の不一致: AdvancedAirdrop の場合、アドレスの数と数量の数は一致していますか？  

　　• ゼロの数: 全ての数量指定に「0」を18個付けていますか？  

　　• カッコの形式: recipients や amounts を [ ] で囲っていますか？  

　　• 空白の入力: コピー＆ペーストしたときに文字列の最後に空白が入っているとエラーになる  
  
　　• ガス代: タマスクにテスト用のETH（またはROB）が残っているか？  
<br>
<br>

### 　検証済みコントラクト  
　　[SimpleAirdrop](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)  
　　[AdvancedAirdrop](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)  
　　（※別タブで開くには Ctrl + クリックしてください）  
