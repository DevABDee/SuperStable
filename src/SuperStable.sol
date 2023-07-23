// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract SuperStable is ERC20Burnable, Ownable {

    event Burn(uint256 amount);
    event Mint(address to, uint256 amount);
    constructor() ERC20("SuperStable", "SUPER"){}

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
        emit Mint(_to, _amount);
    }

    function burn(uint256 _amount) public override onlyOwner {
        require(balanceOf(msg.sender) >= _amount, "BAL EXCEEDED");
        super.burn(_amount);
        emit Burn(_amount);
    }
}
