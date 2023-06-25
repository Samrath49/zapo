// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Zapo is
    Initializable,
    ERC20Upgradeable,
    ERC20BurnableUpgradeable,
    PausableUpgradeable,
    OwnableUpgradeable
{
    address public minter;

    function initialize() public initializer {
        __ERC20_init("Zapo", "ZAPO");
        __ERC20Burnable_init();
        __Pausable_init();
        __Ownable_init();
        minter = msg.sender;
    }

    // No checks as its meant to be once off to set minting rights to Minter
    function setMinter(address _minter) external {
        require(msg.sender == minter, "Not a minter");
        minter = _minter;
    }

    function mint(address account, uint256 amount) external returns (bool) {
        require(msg.sender == minter, "Not a minter");
        _mint(account, amount);
        return true;
    }

    function ownerMint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
