// ネットワークの定義：gasFee を追加
const MASTER_NETWORKS = {
    46630: { name: "Robinhood", symbol: "ETH", gasFee: 0.005 },
    56: { name: "BNB Smart Chain", symbol: "BNB", gasFee: 0.005 },
    1: { name: "Ethereum", symbol: "ETH", gasFee: 0.005 }
};

// トークン名簿（変更なし）
const MASTER_TOKEN_LIST = {
    46630: [
        { s: 'MRT',  a: '0x196eCa072F41571233E4F6D215F89A3446DD569b' },
        { s: 'AMZN', a: '0x5884aD2f920c162CFBbACc88C9C51AA75eC09E02' },
        { s: 'AMD',  a: '0x71178BAc73cBeb415514eB542a8995b82669778d' },
        { s: 'NFLX', a: '0x3b8262A63d25f0477c4DDE23F83cfe22Cb768C93' },
        { s: 'PLTR', a: '0x1FBE1a0e43594b3455993B5dE5Fd0A7A266298d0' },
        { s: 'TSLA', a: '0xC9f9c86933092BbbffF3CCb4b105A4A94bf3Bd4E' }
    ],
    56: [
        { s: 'USDT', a: '0x55d398326f99059fF775485246999027B3197955' }
    ],
    1: [
        { s: 'USDT', a: '0xdAC17F958D2ee523a2206206994597C13D831ec7' }
    ]
};