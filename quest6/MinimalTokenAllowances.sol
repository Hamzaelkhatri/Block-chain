pragma solidity 0.8.4;

// SPDX-License-Identifier: MIT

contract UsableToken {
    mapping(address => uint) public balances;
    address public sender;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Miniting(address indexed to, uint amount);

    constructor(uint initialSupply) {
        balances[msg.sender] = initialSupply;
    }

    function transfer(address to, uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }
}
