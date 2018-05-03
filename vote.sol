pragma solidity ^0.4.21;

contract SingleUseVote {

    // <contract_variables>
    struct Voter {
        bool registered;
        bool voted;
    }

    address rendezo;
    uint256 hatarido;
    string matter_link;
    string matter_hash;
    
    uint256 votedYes;
    uint256 votedNo;
    uint256 numberOfVoters;
    
    mapping(address => Voter) voters;
    // </contract_variables>

    function SingleUseVote(string link, string hash, uint256 deadline) public
    {
        rendezo = msg.sender;
        hatarido = deadline;
        matter_link = link;
        matter_hash = hash;

    }

    function registerParticipant(address participant) public {
        require(
            (msg.sender == rendezo) &&
            !voters[participant].registered
        );
        voters[participant].registered = true;
        numberOfVoters = numberOfVoters + 1;
    }

    function vote(bool voteYes) public {
        require(
            voters[msg.sender].registered &&
            voters[msg.sender].voted == false
        );
        voters[msg.sender].voted = true;
        if (voteYes) {
            votedYes = votedYes + 1;    
        }
        else {
            votedNo = votedNo + 1;
        }
        
    }

    function getResult() public view returns (bool) {
        require(
             block.timestamp > hatarido
        );
        return votedYes > numberOfVoters / 2;
    }

}
