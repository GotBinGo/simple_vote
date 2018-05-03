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
    
    uint256 yesVotes;
    uint256 noVotes;
    uint256 numberOfVoters;
    
    mapping(address => Voter) voters;
    // </contract_variables>

    constructor(string link, string hash, uint256 deadline) public
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
            now < hatarido &&
            voters[msg.sender].registered &&
            !voters[msg.sender].voted
        );
        voters[msg.sender].voted = true;
        if (voteYes) {
            yesVotes = yesVotes + 1;    
        }
        else {
            noVotes = noVotes + 1;
        }
        
    }

    function getResult() public view returns (bool) {
        require(
            now > hatarido
        );
        return (yesVotes > (numberOfVoters / 2));
    }

}
