pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract BuyTickets {
    address payable public ticketHolder;
    uint256 public etherValue;
    //ticketHolders
    mapping(address => uint256) public ticketHolders;

    constructor() {
        ticketHolder = payable(msg.sender);
        etherValue = 0.1 ether;
    }

    function buyTicket() public payable {
        require(msg.value >= 0.1 ether, "You must pay 0.1 ether");
        if (msg.value > etherValue) {
            ticketHolder.transfer(msg.value - etherValue);
        } else {
            ticketHolder.transfer(msg.value);
        }
        ticketHolders[msg.sender] += 1;
    }

    function ticketsOf(address add) public view returns (uint) {
        return ticketHolders[add];
    }
}
