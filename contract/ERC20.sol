// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// is REMIX IDE support File import URL
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor (string memory name, string memory symbol)
        ERC20(name, symbol)
        public
    {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 Baht = 100 satang
        // 1 tokens = 1 * (10 ** decimals)
        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }
}