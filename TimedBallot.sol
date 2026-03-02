// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/** * @title TimedBallot
 * @dev 投票期限機能を追加した改良版Ballotコントラクト
 */
contract TimedBallot {
    struct Voter {
        uint weight; 
        bool voted;  
        address delegate; 
        uint vote;   
    }

    struct Proposal {
        bytes32 name;   
        uint voteCount; 
    }

    address public chairperson;
    mapping(address => Voter) public voters;
    Proposal[] public proposals;

    // --- 改良ポイント1: 期限を保持する変数 ---
    uint public votingDeadline; 

    /** * @dev 初期設定
     * @param proposalNames 候補者名の配列
     * @param durationMinutes 投票を受け付ける時間（分単位）
     */
    constructor(bytes32[] memory proposalNames, uint durationMinutes) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        // --- 改良ポイント2: 現在時刻に指定の分数を加算して期限を設定 ---
        votingDeadline = block.timestamp + (durationMinutes * 1 minutes);

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    // --- 改良ポイント3: 期限内かどうかをチェックする修飾子（Modifier） ---
    modifier onlyBeforeDeadline() {
        require(block.timestamp <= votingDeadline, "Voting has already ended.");
        _;
    }

    /** * @dev 投票権の付与（期限前のみ可能にするのが一般的）
     */
    function giveRightToVote(address voter) external onlyBeforeDeadline {
        require(msg.sender == chairperson, "Only chairperson can give right to vote.");
        require(!voters[voter].voted, "The voter already voted.");
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    /**
     * @dev 委任（期限前のみ実行可能）
     */
    function delegate(address to) external onlyBeforeDeadline {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "You have no right to vote");
        require(!sender.voted, "You already voted.");
        require(to != msg.sender, "Self-delegation is disallowed.");

        while (voters[to].delegate != address(0)) {
            to = voters[to].delegate;
            require(to != msg.sender, "Found loop in delegation.");
        }

        Voter storage delegate_ = voters[to];
        require(delegate_.weight >= 1);

        sender.voted = true;
        sender.delegate = to;

        if (delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }
    }

    /**
     * @dev 投票（期限前のみ実行可能）
     */
    function vote(uint proposal) external onlyBeforeDeadline {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    function winnerName() external view returns (bytes32 winnerName_) {
        winnerName_ = proposals[winningProposal()].name;
    }

    // --- おまけ：あと何秒で終了するか確認する関数 ---
    function getTimeLeft() public view returns (uint) {
        if (block.timestamp >= votingDeadline) return 0;
        return votingDeadline - block.timestamp;
    }
}