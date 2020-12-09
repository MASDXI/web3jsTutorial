// SPDX-License-Identifier: none
pragma solidity ^0.7.0;
// not recommending to using in production
pragma experimental ABIEncoderV2;

/**
 * @author AIS NEXT BCD (BlockChain Development) Team
 * @title Samrt Contract explain mapping, struct
 * @dev invoke, query data that store in smart contarct
 */
contract keyvaluedb {
    
    //mapping struct Value to data (key -> value)
    mapping(uint256 => Value) data;

    // schema of value can be anything
    struct Value {
        // string _string;
        // address _address;
        // bytes32 _bytes;
        // uint256 _uint;
        // int256 _int;
        bool _bool;
    }
    
    /** 
     * @dev function that use to invoke smart contract
     * @param _key(uint256)
     * @param _value(struct|object)
     */
    function invoke(uint256 _key , value memory _value) public{
        data[_key] = _value ;
    }
    
    /** 
     * @dev function that use to query smart contract
     * @param _key(uint256)
     * @return struct of value
     */
    function query(uint256 _key) public view returns (value memory){
        return data[_key];
    }
    
}
