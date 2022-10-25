pragma solidity 0.8.4;

contract oracle {
    uint public ethPrice;
    address public owner;
    uint public volatility;
    uint public lVolatility;
    uint public stablePrice;
    uint public lStablePrice;

    constructor() public {
        owner = msg.sender;
    }

    function getEthPrice() public view returns (uint) {
        return ethPrice;
    }

    function setEthPrice(uint newPrice) public {
        require(msg.sender == owner);
        ethPrice = newPrice;
    }

    function getPrice() public view returns (uint) {
        return volatility * ethPrice + stablePrice;
    }

    function setPrice(uint newPrice) public {
        require(msg.sender == owner);
        volatility = newPrice - lStablePrice;
        lVolatility = volatility;
        stablePrice = newPrice;
        lStablePrice = stablePrice;
    }
}
