# My Robinhood Airdrop Project

このプロジェクトは、Robinhood Chain Testnet で自作トークン（MRT）を発行し、
セキュリティ機能付きの一括送金（Airdrop）を成功させた開発実績です。

## 実績ドキュメント
- **MyToken アドレス**: `0x196eCa072F41571233E4F6D215F89A3446DD569b`
- **SimpleAirdrop アドレス**: `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258`
- **AdvancedAirdrop アドレス**: `0x86238ed61A026604a58D43C554Bde90281f05102`

- **SimpleAirdrop検証済みURL**: [https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)
- **AdvancedAirdrop検証済みURL**: 
[https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract](https://explorer.testnet.chain.robinhood.com/address/0x86238ed61A026604a58D43C554Bde90281f05102?tab=contract)



## 操作マニュアル
Robinhood Chain 一括送金 完全マスターガイド
（SimpleAirdrop & AdvancedAirdrop 対応版）

この手順書は、Remixを使用して自作トークン（MRT）や株式トークン（TSLA/AMZN等）を複数アドレスへ効率的に配布するための標準マニュアルです。

ステップ 1：環境とネットワークの同期

  1. MetaMaskの確認: ネットワークが「Robinhood Chain Testnet」になっていることを確認します 。
  2. Remixの接続: Deploy & Run Transactions タブの ENVIRONMENT で Injected Provider - MetaMask を選択します 。
  3. チェーンIDの確認: Custom (46630) network と表示されていることを必ず確認してください 。

　
ステップ 2：コントラクトの読み込み（At Address）

　　すでにデプロイ済みのコントラクトを操作パネルに呼び出します。
  
  1. トークンパネルの準備
     
     • CONTRACT欄: MyToken（または IERC20）を選択します 。
     
     • At Addressボタンの横: 送りたいトークンのアドレス を貼り付けてボタンをクリックします 。
     
     ※重要: TSLAなどの株式トークンを送る場合は、MyTokenのアドレスではなく TSLAのアドレス を使用してください。

  3. 送金用コントラクト（道具）の準備

　　 • CONTRACT欄: 使用したい方のコントラクトを選択します。
   
　　　　　　◦ 全員に同じ量を送るなら：SimpleAirdrop
       
　　　　　　◦ 人ごとに違う量を送るなら：AdvancedAirdrop
      
　　• At Addressボタンの横: それぞれの コントラクトアドレス を貼り付けてボタンをクリックします 。

ステップ 3：送金の許可（Approve）
このステップを忘れると送金は必ず失敗します。
    1. ステップ2-①で出した 「送りたいトークン（TSLAやMRT）」のパネル を開きます 。
    2. approve 関数に以下を入力します：
        ◦ spender: 使用する送金用コントラクトのアドレス（Simple or Advanced）を貼り付けます 。
        ◦ value: 送付する 合計数量 を18桁のゼロを付けて入力します（例：合計5枚なら 5000000000000000000） 。
    3. transact を押し、MetaMaskで承認します 。

ステップ 4：一括送金の実行
使用するコントラクトに合わせて、以下のいずれかを実行します。
A. SimpleAirdrop を使う場合（全員同量）
    1. SIMPLEAIRDROP パネルの sendTokens を開きます 。
    2. 入力欄：
        ◦ tokenAddress: 送りたいトークンのアドレス 
        ◦ recipients: ["アドレス1", "アドレス2"] （カッコと引用符に注意） 
        ◦ amount: 1人あたりの数量（18桁） 
B. AdvancedAirdrop を使う場合（個別数量）
    1. ADVANCEDAIRDROP パネルの sendAdvancedTokens を開きます 。
    2. 入力欄：
        ◦ tokenAddress: 送りたいトークンのアドレス 
        ◦ recipients: ["アドレス1", "アドレス2"] 
        ◦ amounts: [数量1, 数量2] （18桁。人数分をカンマ区切りで入力） 

💡 失敗しないための最終チェックリスト
    • 承認パネルのミス: 送りたいトークンがTSLAなら、TSLAのパネルで approve しましたか？ 
    • 配列の不一致: AdvancedAirdrop の場合、アドレスの数と数量の数は一致していますか？ 
    • ゼロの数: 全ての数量指定に「0」を18個付けていますか？ 
    • カッコの形式: recipients や amounts を [ ] で囲っていますか？ 
