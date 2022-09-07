pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract MinimalToken {
    mapping(address => uint) public balances;

    constructor(uint initialSupply) {
        balances[msg.sender] = initialSupply;
    }

    function balanceOf(address addrs) public view returns (uint) {
        return balances[addrs];
    }

    function transfer(address recipient, uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
