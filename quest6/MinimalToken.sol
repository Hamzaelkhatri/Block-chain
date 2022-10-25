pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts/utils/Strings.sol";

struct balances {
    uint256 balance;
    address owner;
}

contract MinimalToken {
    address public admin;

    constructor(uint initialSupply) {
        admin = msg.sender;
    }

    function balanceOf(address addrs) public view returns (uint) {
        return balances[addrs];
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, Strings.toString(amount));
        balances[admin] -= amount;
        balances[to] += amount;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) public {
        require(
            balances[sender] >= amount,
            Strings.toString(balances[recipient])
        );
        balances[sender] -= amount;
        balances[recipient] += amount;
    }
}
