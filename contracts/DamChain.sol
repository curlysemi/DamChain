pragma solidity ^0.4.17;

contract DamChain {
    struct Organization {
        string name;
        Document[] documents;
    }

    struct Document {
        bytes32 docHash;
    }

    mapping(address => Organization) public organizations;


    function setOrganizationName(string name) public {
        organizations[msg.sender].name = name;
    }

    function addDocument(address _org, bytes32 _docHash, uint8 _v, bytes32 _r, bytes32 _s) public {
        require(verifySignature(_docHash, _v, _r, _s, _org));

        organizations[_org].documents.push(Document(_docHash));
    }

    //https://ethereum.stackexchange.com/questions/15364/ecrecover-from-geth-and-web3-eth-sign
    function verifySignature(bytes32 _hash, uint8 _v, bytes32 _r, bytes32 _s, address _org) constant returns(bool) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(prefix, _hash);
        return ecrecover(prefixedHash, _v, _r, _s) == _org;
    }
}