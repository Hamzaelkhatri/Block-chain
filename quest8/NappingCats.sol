// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";

/**
 * @dev Implementation of standard for detect smart contract interfaces.
 */



contract BasicNFT is ERC721{
    using   Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    address owner;
    address _from;
    string constant ZERO_ADDRESS = "003001";
    string constant NOT_VALID_NFT = "003002";
    string constant NOT_OWNER_OR_OPERATOR = "003003";
    string constant NOT_OWNER_APPROVED_OR_OPERATOR = "003004";
    string constant NOT_ABLE_TO_RECEIVE_NFT = "003005";
    string constant NFT_ALREADY_EXISTS = "003006";
    string constant NOT_OWNER = "003007";
    string constant IS_OWNER = "003008";


    mapping (uint256 => address) internal idToOwner;
    mapping(address => uint256[]) internal ownerToIds;
    mapping(uint256 => uint256) internal idToOwnerIndex;
    mapping (address => mapping (address => bool)) internal ownerToOperators;
    mapping (uint256 => address) internal idToApproval;

    constructor(string memory name) ERC721("basicNFT", "bNFT") {
        name = "basicNFT";
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://api.basicNFT.com/tokens/";
    }

    // function ownerOf(uint256 _tokenId) external view returns (address);
    function ownerOf(
    uint256 _tokenId
  )
    external
    override
    view
    returns (address _owner)
  {
    _owner = idToOwner[_tokenId];
    require(_owner != address(0), NOT_VALID_NFT);
    return _owner;  
  }

}

contract NappingCats is BasicNFT{
    uint  price;
    mapping (address => uint256) private ownerToNFTokenCount;
    constructor(string memory name) BasicNFT (name) {    
        price = 10;

    }
 function transfer(uint256 _tokenId, address _to)  internal
    virtual
     {
    address from = idToOwner[_tokenId];
    _clearApproval(_tokenId);

    _removeNFToken(from, _tokenId);
    _addNFToken(_to, _tokenId);

    emit Transfer(from, _to, _tokenId);
    }


    function _removeNFToken(
    address _from,
    uint256 _tokenId
  )
    internal
    virtual
  {
    require(idToOwner[_tokenId] == _from, NOT_OWNER);
    ownerToNFTokenCount[_from] -= 1;
    delete idToOwner[_tokenId];
  }

  function _addNFToken(
    address _to,
    uint256 _tokenId
  )
    internal
    virtual
  {
    require(idToOwner[_tokenId] == address(0), NFT_ALREADY_EXISTS);

    idToOwner[_tokenId] = _to;
    ownerToNFTokenCount[_to] += 1;
  }
      function _clearApproval(
    uint256 _tokenId
  )
    private
  {
    delete idToApproval[_tokenId];
  }    

}
