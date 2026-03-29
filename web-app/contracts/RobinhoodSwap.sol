// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

/**
 * @title RobinhoodSwap
 * @dev 署名サーバーによるレート保証とNonceによるリプレイ対策を備えた在庫型スワップ
 */
contract RobinhoodSwap is Ownable {
    using ECDSA for bytes32;

    // 署名専用アドレス（サーバー側で使用するウォレット）
    address public signerAddress;

    // リプレイアタック防止：ユーザーごとの次回の有効なNonce
    mapping(address => uint256) public nonces;

    // 許可されたトークンの管理
    address[] public supportedTokens;
    mapping(address => bool) public isSupported;

    // イベント
    event Swapped(address indexed user, address fromToken, address toToken, uint256 fromAmount, uint256 toAmount, uint256 nonce);
    event TokenAdded(address indexed token);
    event SignerChanged(address indexed oldSigner, address indexed newSigner);
    event Withdrawn(address indexed token, uint256 amount);

    constructor() Ownable(msg.sender) {
        // 初期状態ではデプロイしたオーナーを署名者に設定（後でsetSignerAddressで変更可能）
        signerAddress = msg.sender;
    }

    // --- 1. 管理機能（ADMIN.HTMLから実行） ---

    /**
     * @dev 署名専用アドレス（オペレーター）を設定する
     * サーバー（Render）に預けるウォレットアドレスをここに登録します
     */
    function setSignerAddress(address _newSigner) external onlyOwner {
        require(_newSigner != address(0), "Invalid address");
        emit SignerChanged(signerAddress, _newSigner);
        signerAddress = _newSigner;
    }

    /**
     * @dev スワップ対象のトークンを追加
     */
    function addSupportedToken(address _token) external onlyOwner {
        require(_token != address(0), "Invalid address");
        if (!isSupported[_token]) {
            isSupported[_token] = true;
            supportedTokens.push(_token);
            emit TokenAdded(_token);
        }
    }

    /**
     * @dev コントラクト内の在庫を回収する
     */
    function withdrawToken(address _token, uint256 _amount) external onlyOwner {
        require(IERC20(_token).transfer(msg.sender, _amount), "Withdraw failed");
        emit Withdrawn(_token, _amount);
    }

    /**
     * @dev 全在庫を回収（保守用）
     */
    function withdrawAll(address _token) external onlyOwner {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        if (balance > 0) {
            require(IERC20(_token).transfer(msg.sender, balance), "Withdraw all failed");
            emit Withdrawn(_token, balance);
        }
    }

    // --- 2. ユーザー機能（SWAP.HTMLから実行） ---

    /**
     * @dev トークンスワップの実行
     * @param _fromToken ユーザーが支払うトークン
     * @param _toToken ユーザーが受け取るトークン
     * @param _fromAmount 支払う量
     * @param _toAmount 受け取る量（サーバー署名に基づく）
     * @param _nonce ユーザーごとの連番（リプレイ対策）
     * @param _signature 署名サーバーが生成した署名データ
     */
    function swap(
        address _fromToken,
        address _toToken,
        uint256 _fromAmount,
        uint256 _toAmount,
        uint256 _nonce,
        bytes calldata _signature
    ) external {
        require(isSupported[_fromToken], "Source token not supported");
        require(isSupported[_toToken], "Destination token not supported");
        
        // 1. Nonceの検証（リプレイアタック対策）
        require(_nonce == nonces[msg.sender], "Invalid nonce: Possible replay attack");

        // 2. ハッシュ作成（JS/サーバー側と完全に一致させる必要がある）
        bytes32 messageHash = keccak256(abi.encodePacked(
            msg.sender,     // 誰が
            _fromToken,     // 何を
            _toToken,       // 何に
            _fromAmount,    // いくらで
            _toAmount,      // いくら受け取るか
            _nonce          // 何回目の取引か
        ));
        bytes32 ethSignedMessageHash = MessageHashUtils.toEthSignedMessageHash(messageHash);

        // 3. 署名から復元されたアドレスが、登録済みのsignerAddressと一致するか確認
        address recoveredSigner = ethSignedMessageHash.recover(_signature);
        require(recoveredSigner == signerAddress, "Invalid signature: Unauthorized");

        // --- 取引実行（検証成功後） ---
        
        // Nonceをインクリメント（この署名を二度と使えないようにする）
        nonces[msg.sender]++;

        // ユーザーからトークンを受け取る (要: 事前の Approve)
        require(IERC20(_fromToken).transferFrom(msg.sender, address(this), _fromAmount), "TransferFrom failed");

        // 在庫からユーザーへトークンを送る
        require(IERC20(_toToken).balanceOf(address(this)) >= _toAmount, "Insufficient contract balance");
        require(IERC20(_toToken).transfer(msg.sender, _toAmount), "Transfer to user failed");

        emit Swapped(msg.sender, _fromToken, _toToken, _fromAmount, _toAmount, _nonce);
    }

    // --- 3. 参照用（UI表示に使用） ---

    function getStock(address _token) external view returns (uint256) {
        return IERC20(_token).balanceOf(address(this));
    }

    function getSupportedTokens() external view returns (address[] memory) {
        return supportedTokens;
    }
}