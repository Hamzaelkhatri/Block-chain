pragma solidity 0.8.4;

//

contract ArtistsDoWork {
    mapping(address => uint) tickets;
    address orgnizer;
    // address[] public artists;
    mapping(address => uint) artists;

    constructor() {
        orgnizer = msg.sender;
    }

    function buyTicket() public payable {
        // require(msg.value >= 0.1 * 10**18);
        tickets[msg.sender] += 1;
        // payable(msg.sender
    }

    function addRemuneratedArtist(address add) public {
        require(orgnizer == msg.sender);
        artists[add] = 2;
    }

    function getPayed() public payable {
        require(artists[msg.sender] == 2);
        // require(payable(msg.sender > 100);
        artists[msg.sender] = 1;
        // send 1 ether to artist
        payable(msg.sender).transfer(10000000000000000000);
    }
}
