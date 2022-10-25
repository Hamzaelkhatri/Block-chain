// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.4;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./oracle.sol";


contract stablecoin is ERC20 {
    mapping(address => uint) public ethBalances;
    oracle oracles;
    address public owner;

    constructor() ERC20("stablecoin", "STB") {
        _mint(msg.sender, 0);
        owner = msg.sender;
    }

    function registerOracle() public {
        oracles = new oracle();
    }

    function deposit() public payable {
        ethBalances[msg.sender] += msg.value;
        // payable(address(oracles)).transfer(msg.value);
    }

    function withdraw(uint amount) public {
        require(ethBalances[msg.sender] >= amount);
        ethBalances[msg.sender] -= amount;
    }

    //`mint(amount)` that allow the user to mint the stablecoin for up to half the value deposited in Ether
    function mint(uint amount) public {
        uint ethAmount = amount;
        require(ethBalances[msg.sender] >= ethAmount / 2);
        _mint(msg.sender, amount);
    }

    function burn(uint amount) public {
        require(balanceOf(msg.sender) >= amount);
        _burn(msg.sender, amount);
    }

    //`liquidate(user)` function that allows any user to liquidate the position of any user which current position is below this 1:2 threshold.
    function liquidate(address user) public {
        require(ethBalances[user] < balanceOf(user) / 2);
        _burn(user, balanceOf(user));
        payable(user).transfer(ethBalances[user] /8);
        ethBalances[user] = 0;
    }

    function BalanceOf(address user) public view returns (uint) {
        return balanceOf(user);
    }
}
