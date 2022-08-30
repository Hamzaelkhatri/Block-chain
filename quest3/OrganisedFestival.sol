pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract OrganizedFestival {
    uint dateOfFestival;
    string placeOfFestival;
    address callerId;

    constructor(uint date, string memory place) {
        dateOfFestival = date;
        placeOfFestival = place;
        callerId = msg.sender;
    }

    //getStartTime
    function getStartTime() public view returns (uint) {
        return dateOfFestival;
    }

    //getPlace
    function getPlace() public view returns (string memory) {
        return placeOfFestival;
    }

    function updateStartTime(uint newDate) public {
        require(msg.sender == callerId);
        dateOfFestival = newDate;
    }

    //updatePlace
    function updatePlace(string memory newPlace) public {
        require(msg.sender == callerId);
        placeOfFestival = newPlace;
    }
}
