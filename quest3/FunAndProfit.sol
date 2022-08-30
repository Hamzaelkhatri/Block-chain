pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

import "./BuyTickets.sol";

contract FunAndProfit is BuyTickets {
    constructor() {
        super;
        organizer = payable(msg.sender);
    }

    // Organizer
    address payable public organizer;

    //function `redeemTicket()` that allows an attendee to give return one ticket. The function should fail (revert) if the attendee does not own any ticket.
    function redeemTicket() public {
        require(ticketHolders[msg.sender] > 0, "You do not have any tickets");
        ticketHolders[msg.sender] -= 1;
        ticketHolder.transfer(etherValue);
    }

    //function `getBenefits()` that sends all the benefits from the Festival to the organizer.
    function getBenefits() public {
        selfdestruct(payable(msg.sender));
    }
}
