pragma solidity 0.8.4;

// SPDX-License-Identifier: UNLICENSED

contract NamedFestival {
    string name = "";

    constructor() {
        name = "NamedFestival";
    }

    //Set Name
    function setName(string memory input) public {
        name = input;
    }

    //Get Name
    function getName() public view returns (string memory) {
        return name;
    }
}
