# 基本・一括配布マニュアル (Simple & Advanced)操作マニュアル  
## （SimpleAirdrop & AdvancedAirdrop 対応版）  
<br>

### この手順書は、Remixを使用して自作トークン（MRT）や株式トークン（TSLA/AMZN等）を複数アドレスへ効率的に配布するための標準マニュアルです。  
<br>

### ⚠️ ご利用の際の注意  
* 本プロジェクトはテストネット用です。  
* 操作中にMetaMaskで警告が表示された場合は、入力を間違えている可能性があります。無理に実行せず、各マニュアルのトラブルシューティングを確認してください。  
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
　　　　• At Addressボタンの横: それぞれの コントラクトアドレス を貼り付けてボタンをクリックします 。  
<br>
## ステップ 3：送金の許可（Approve）  
　　このステップを忘れると送金は必ず失敗します。  
<br>
### 　　1. ステップ2-①で出した 「送りたいトークン（TSLAやMRT）」のパネル を開きます 。  

### 　　2．approve 関数に以下を入力します：<br>
<br>
　　　　　・spender: 使用する送金用コントラクトのアドレス（Simple or Advanced）を貼り付けます 。<br>  
　　　　　・value: 送付する 合計数量 を18桁のゼロを付けて入力します（例：合計5枚なら 5000000000000000000） 。
<br>

### 　　3. transact を押し、MetaMaskで承認します 。  
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
       
　　　　　　　　　◦ amount: 1人あたりの数量（18桁）  
<br> 

### 　　B. AdvancedAirdrop を使う場合（個別数量）　　

　　　　　　1. ADVANCEDAIRDROP パネルの sendAdvancedTokens を開きます 。  

　　　　　　2. 入力欄：  

　　　　　　　　　◦ tokenAddress: 送りたいトークンのアドレス   

　　　　　　　　　◦ recipients: ["アドレス1", "アドレス2"]   

　　　　　　　　　◦ amounts: [数量1, 数量2] （18桁。人数分をカンマ区切りで入力）  
<br>

## 失敗しないための最終チェックリスト

　　• 承認パネルのミス: 送りたいトークンがTSLAなら、TSLAのパネルで approve しましたか？ 

　　• 配列の不一致: AdvancedAirdrop の場合、アドレスの数と数量の数は一致していますか？ 

　　• ゼロの数: 全ての数量指定に「0」を18個付けていますか？ 

　　• カッコの形式: recipients や amounts を [ ] で囲っていますか？ 
