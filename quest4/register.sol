pragma solidity 0.8.3;

contract Register {
    address public admin;
    mapping(bytes32 => uint) public documents;

    function getDate(bytes32 documentHash) public view returns (uint) {
        return documents[documentHash];
    }

    function addDocument(bytes32 documentHash) public {
        documents[documentHash] = block.timestamp;
    }
}
