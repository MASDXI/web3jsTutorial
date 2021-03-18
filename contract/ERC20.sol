// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.8.0;

// is REMIX IDE support File import URL
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/ERC20.sol";

/**
 * @author AIS NEXT BCD (BlockChain Development) Team
 * @title Samrt Contract Adoption ERC20 to use as Utility Token
 */
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

    function rewardTo(address _receipent ,uint256 _amount) public {
        /* 
            do something ...
        */
        transfer(_receipent,_amount);
    }

    /**
     * @title example reward function
     * @dev function reward that require passing something be for get reward
        e.g.
            - user need to buy some product before getting token
            - user need to join or passing checkpoint before getting token

        function rewardTo(address _receipent ,uint256 _amount) public {
            require(...() == true ,'require passing ...() before');
            transfer(_receipent,_amount);
        }
    */
}