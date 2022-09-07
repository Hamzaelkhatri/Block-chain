pragma solidity 0.8.3;

// License: MIT

contract RegisterWithEvents {
    address public admin;
    mapping(bytes32 => uint) public documents;

    event DocumentAdded(bytes32 indexed documentHash, uint indexed timestamp);

    function getDate(bytes32 documentHash) public view returns (uint) {
        return documents[documentHash];
    }

    function addDocument(bytes32 documentHash) public {
        documents[documentHash] = block.timestamp;
        emit DocumentAdded(documentHash, block.timestamp);
    }
}