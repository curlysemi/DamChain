# DAM Chain 
## Arizona Blockathon 02/03/2018
(DAM is Digital Asset Management)

This is a small-scale proof-of-concept on-chain ECDSA verification.

If you've never set up this type of environment and you want to play with this locally, you will need nodejs/npm. If you do not already have node installed, it is recommended you use `nvm` (Linux/Mac use the same one; Windows has its own `nvm` that is very similar).

After installing nodejs/npm, you'll want to run:

`npm install -g truffle ganache-cli`

Once done, you'll want to run `ganache-cli` and hop into a new shell, cd into this repo and run `truffle console`.

Inside the truffle js console, you can compile the contracts into EVM bytecode by simply running `truffle compile`.

(It may be left as an exercise for the reader to resolve the compiler warnings)

To deploy the contract, run `truffle migrate`.

For actual use within the truffle console, refer to [the slides](https://docs.google.com/presentation/d/1gHq3Uu6jECeONADco5Wpt2LKqYN1iIiYdoxupJ7ptkw) from our presentation.


## TODOs:
Resolve solc warnings.
Accessors to retrieve the document "IDs" (hashes) for an organization.
Organizations should be able to have multiple addresses (for those associated with the organization that are permitted to push documents to the decentralized digital asset manager).
Documents should be able to have references to 'RelatedDocuments' (which was left out of the implementation altogether).
Documents should have a HashType "enum" (not using Solidity enums, as they are not open to extension; using uints instead and a registry contract to keep track of the names for enumerables for convenience/dev-lookup purposes), which will allow for hash functions other than Keccak256.
Likewise, Documents should have a StorageType "enum", where some of the enumerations would be 'IPFS', 'Swarm', 'HipsterFloppyDisk', etc. (Again, not using actual Solidity enum (or casting to uint?))


Possible Future Direction: Integration with a ZKCSP protocol for proofs of retrievability that an actual offchain data-store (the particulars of which this contract should ideally be agnostic of) can prove that it is maintaining the registered data.
