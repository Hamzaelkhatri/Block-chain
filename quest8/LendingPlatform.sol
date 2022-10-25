pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./oracle.sol";

contract LendingPlatform {
    address public stable;
    address public volatility;
    address public lstable;
    address public lvolatility;
    oracle oracles;
    mapping(address => uint) public ethBalances;

    constructor(
        address sstable,
        address svolatility,
        address slstable,
        address slvolatility
    ) {
        stable = sstable;
        volatility = svolatility;
        lstable = slstable;
        lvolatility = slvolatility;
    }

    function registerOracle() public {
        oracles = new oracle();
    }

    function depositStable(uint amount) public {
        // require(msg.value == amount);
        ethBalances[lstable] += amount;
        ethBalances[stable] += amount;
    }

    function depositVolatile(uint amount) public {
        // require(msg.value == amount);
        ethBalances[lvolatility] += amount;
        ethBalances[volatility] += amount;
    }

    function borrowStable(uint amount) public {
        // the user should have 150% of the amount borrowed in the volatile pool
        require(ethBalances[lvolatility] >= (amount * 3) / 2);
        ethBalances[lstable] -= amount;
        ethBalances[stable] -= amount;
    }

    function liquidate(address user) public {
        // the user should have 150% of the amount borrowed in the volatile pool
        require(ethBalances[lvolatility] < (ethBalances[lstable] * 3) / 2);
        ethBalances[lstable] = 0;
        ethBalances[stable] = 0;
    }
}
