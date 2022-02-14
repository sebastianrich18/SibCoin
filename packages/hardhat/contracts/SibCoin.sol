//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract SibCoin is ERC20, Ownable{

    address deployer = 0x52Cf24841f8D8A83F5FB34ed36c434d7250A9c26; // address contract will be deployed from

     constructor(uint256 initialSupply) ERC20("SibCoin", "Sib") {
         transferOwnership(deployer);
        _mint(deployer, initialSupply);
    }

    function withdraw(address _to) public onlyOwner {
        (bool sent, bytes memory data) = _to.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");

    }
}
