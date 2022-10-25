pragma solidity 0.8.4;

contract TimeIsMoney {
    uint public TimeOfFestival;
    mapping(address => uint) tickets;
    mapping(address => string) artists;
    address orgs;

    constructor(uint time) {
        TimeOfFestival = time;
        orgs = msg.sender;
    }

    // `buyTicket()` that allows to buy one ticket for a minimum price of 0.01 ethers 10 days before its start, and 0.1 afterward
    function buyTicket() public payable {
        require(TimeOfFestival >= block.timestamp + (10 days));
        tickets[msg.sender] += 1;
    }

    function ticketsOf() public view returns (uint) {
        return tickets[msg.sender];
    }

    function addPayedArtist(string memory str, address add) public {
        artists[add] = str;
    }

    function getPayed() public payable {
        // send 1 ether to artist
        require(TimeOfFestival <= block.timestamp - 3 days);
        payable(msg.sender).transfer(10000000000000000000);
    }

    function getBenefits() public {
        require(orgs == msg.sender);
    }
}
