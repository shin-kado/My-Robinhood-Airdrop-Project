# My Robinhood Airdrop Project

このプロジェクトは、Robinhood Chain Testnet で自作トークン（MRT）を発行し、
セキュリティ機能付きの一括送金（Airdrop）を成功させた開発実績です。

## 実績ドキュメント
- **MyToken アドレス**: `0x5884aD2f920c162CFBbACc88C9C51AA75eC09E02`
- **SimpleAirdrop アドレス**: `0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258`
- **検証済みURL**: [Explorer Link](https://explorer.testnet.chain.robinhood.com/address/0x1926e8C311Ae38Bd2d20A2755852f8B5aF0F4258?tab=contract)


## 操作マニュアル
SimpleAirdrop 送金・完全操作マニュアル

このマニュアルは、Remixのリロード後や、新しいネットワークで一括送金を行う際の標準手順です。

ステップ 1：ネットワークの同期確認

　Remixがあなたのメタマスク（Robinhood Chain）を正しく認識しているか確認します。
 
   1. MetaMaskを開き、ネットワークが「Robinhood Chain Testnet」であることを確認します。
   2. Remixの「Deploy & Run Transactions」タブで、ENVIRONMENT を一度別のものに切り替えてから、再度 Injected Provider - MetaMask を選択します。
   3. 【重要チェック】: ENVIRONMENTのすぐ下の表示が Custom (46630) network になっていることを必ず確認してください。
            ▪ 注釈: ここが Main (1) のままだと、残高が正しく反映されず、送金も失敗します。

ステップ 2：既存コントラクトの読み込み（At Address）

　すでにブロックチェーン上にある「トークン」と「送金道具」をRemixに呼び出します。
 
   1. MyTokenの読み込み
      
      ▪ CONTRACT 欄で MyToken を選択します。
      
      ▪ At Address ボタンの横の欄に 「トークンのコントラクトアドレス」 を貼り付けてボタンをクリックします。
      
   2. SimpleAirdropの読み込み
      
      ▪ CONTRACT 欄で SimpleAirdrop を選択します
      
      ▪ At Address ボタンの横の欄に 「SimpleAirdropのコントラクトアドレス」 を貼り付けてボタンをクリックします
      
      ▪ 注釈: もしSimpleAirdropをまだ作っていない場合は、ここで Deploy ボタンを押して新しく作成してください。

ステップ 3：送金の許可（Approve）

「送金用の道具（SimpleAirdrop）」に、あなたのトークンを動かす許可を与えます。

   1. 読み込んだ MYTOKEN のパネルを開きます。
   2. approve 関数の各欄に以下を入力します。
        ◦ spender: 「SimpleAirdropのコントラクトアドレス」 を貼り付けます。
        ◦ value: 「送付したい合計数量」の数字の後に「0」を18個 つけて入力します。（例：1枚なら 1000000000000000000）
   3. transact を押し、メタマスクで「承認」します。
            ▪ 注意事項: spender に自分の財布のアドレスを入れてしまうミスが多いです。必ず「SimpleAirdropのアドレス」を指定してください。

ステップ 4：一括送金の実行（sendTokens）
実際にAirdropコントラクトを使ってトークンを配布します。
    1. 読み込んだ SIMPLEAIRDROP のパネルを開きます。
    2. sendTokens 関数の各欄に以下を 正確に 入力します。
                • TokenAddress: 「トークンのコントラクトアドレス」 を貼り付けます。
                • recipients: ["受け取り先のアドレス"] という形式で入力します。
                • 注意事項: 必ず [ と ] で囲み、アドレスを " で囲ってください。これを忘れるとRemixがフリーズします。
                • amount: 「送付したい数量」の数字の後に「0」を18個 つけて入力します。
    3. transact を押し、メタマスクで「確定」します。

💡 失敗しないための最終チェックリスト
        ◦ ゼロの数: approve した数量と sendTokens で指定した数量が一致しているか？（0は18個か？）
        ◦ 配列のカッコ: recipients 欄に [" "] が付いているか？
        ◦ ガス代: メタマスクにテスト用のETH（またはROB）が残っているか？

