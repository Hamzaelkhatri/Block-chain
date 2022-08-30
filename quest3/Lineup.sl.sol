pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract Lineup {
    string[] lineups;

    function addArtist(string memory name) public {
        lineups.push(name);
    }

    function lineup(uint index) public view returns (string memory) {
        return lineups[index];
    }
}
