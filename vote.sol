pragma solidity ^0.4.21;

contract SingleUseVote {

    // <contract_variables>
    struct Voter {
        bool registered;
        bool voted;
    }

    // a tulajdonos cime
    address rendezo;
    // hatarido timestamp
    uint256 hatarido;
    // pdf link es hash
    string matter_link;
    string matter_hash;
    
    // igen szavazatok szama
    uint256 yesVotes;
    // nem szavazatok szama
    uint256 noVotes;
    // szavazok szama
    uint256 numberOfVoters;
    
    // szavazok
    mapping(address => Voter) voters;
    // </contract_variables>

    function SingleUseVote(string link, string hash, uint256 deadline) public
    {
        // csak jovobeli hataridovel
        require(
            (now < deadline)
        );
        // letrehozo a rendezo
        rendezo = msg.sender;
        hatarido = deadline;
        matter_link = link;
        matter_hash = hash;
    }

    function registerParticipant(address participant) public {
        // csak a hatarido elott veheto fel uj resztvevo
        require(
            (now < hatarido) &&
            (msg.sender == rendezo) &&
            !voters[participant].registered
        );
        // szavazo regisztralas - ugyanazzal a cimmel
        // nem lehet tobbszor szavazni
        voters[participant].registered = true;
        numberOfVoters = numberOfVoters + 1;
    }

    function vote(bool voteYes) public {
        require(
            (now < hatarido) &&
            voters[msg.sender].registered &&
            !voters[msg.sender].voted
        );
        // szavazott - tobbszor nem szavazhat
        voters[msg.sender].voted = true;
        if (voteYes) {
            // igen szavazat
            yesVotes = yesVotes + 1;    
        } else {
            // nem szavazat
            noVotes = noVotes + 1;
        }
        
    }

    function getResult() public view returns (bool) {
        require(
            (now > hatarido)
        );
        // ha a szavazas veget ert, akkor lekerdezheto az eredmeny
        // az igenek szama legalabb a szavazo emberek szamanak fele
        return (yesVotes > (numberOfVoters / 2));
    }

}
