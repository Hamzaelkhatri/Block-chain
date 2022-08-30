pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract TimeAndPlace {
    uint time;
    string place;

    constructor(uint timestamp, string memory location) {
        place = location;
        time = timestamp;
    }

    function getStartTime() public view returns (uint) {
        return time;
    }

    function getPlace() public view returns (string memory) {
        return place;
    }
}
