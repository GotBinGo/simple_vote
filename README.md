# Simple Vote

HW19: Voting
Problem statement
Implement a smart contract for voting.

The contract is single-use, i.e. there must be a separate instance for different decisions.
The creator of the contract is the owner.
The creator must submit a link pointing to the description of the question (e.g. a pdf file), the hash value of this description (so that the participants can validate the file), and a deadline.
The creator can add participants.
Participants can vote "yes" or "no" before the deadline.
After the deadline, anyone can read the results. The result is "yes"
if more than 50% of the participants voted "yes".
Example scenario
A high school class has to decide whether they should participate in a national competition. They decide they will vote on the issue.

The teacher creates a contract, submitting a description of the question, its hash value, and a deadline a week from now. Then the teacher proceeds to register all students of the class as participants.

In the following week, some or all of the students can vote "yes" or "no". In the end, 20 of 30 students have voted, 16 for "yes", 4 for "no".

After the deadline, anyone can read the result. As 16/30 > 50% of students voted "yes", the end result is also "yes".

Contract interface
constructor: function SingleUseVote(string link, string hash, uint256 deadline)

Creates an instance of the contract for deciding the question described under link. A hash of the description (hash) is also submitted so that the participants can make sure it has not been altered. deadline is a timestamp representing the deadline after which no one can vote.
The sender of this transaction (msg.sender) is the owner of the contract.
register: function registerParticipant(address participant)

Registers participant as a participant of the vote, unless they are already registered.
Only the owner of the contract can register new participants.
vote: function vote(bool voteYes)

Vote voteYes (true means "yes").
Only registered participants can vote.
Every participant can vote at most once.
Participants can only vote before the designated deadline.
check result: function getResult() view returns (bool)

Checks whether more than 50% of the participants voted "yes". If yes, returns true. Otherwise, returns false.
Anyone can call this method.
This method should fail before the deadline has passed.
Contract skeleton
```
pragma solidity ^0.4.21;

contract SingleUseVote {

    // <contract_variables>

    // </contract_variables>

    function SingleUseVote(string link, string hash, uint256 deadline) public
    {
        // TODO
    }

    function registerParticipant(address participant) public {
        // TODO
    }

    function vote(bool voteYes) public {
        // TODO
    }

    function getResult() public view returns (bool) {
        // TODO
    }
    
}
```
