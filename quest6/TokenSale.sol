pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

import {MinimalToken} from "./MinimalToken.sol";

contract TokenSale {
    MinimalToken public token;
    address public admin;
    // mapping(address => uint) public balances;

    event Bought(address buyer, uint amount);

    constructor(address adds, uint initialSupply) {
        token = new MinimalToken(initialSupply);
        admin = adds;
    }

    function buy() public payable {
        require(msg.value > 0, "You must send some Ether");
    }

    function getSender() public view returns (address) {
        return msg.sender;
    }

    function getPrice() public view returns (uint) {
        return token.balanceOf(address(this));
    }

    function collect() public {
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }
}
