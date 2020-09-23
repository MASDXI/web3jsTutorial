// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    string text;

    /**
     * @dev Store value in variable
     * @param _text value to store
     */
    function store(string memory _text) public {
        text = _text;
    }

    /**
     * @dev Return value 
     * @return value of 'text'
     */
    function retrieve() public view returns (string memory){
        return text;
    }
}