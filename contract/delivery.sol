// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
pragma experimental ABIEncoderV2;

/**
 * @author AIS NEXT BCD (BlockChain Development) Team
 * @title Samrt Contract Tracking Delivery
 * @dev Create,Update and getDetail of the order that storage on blockchain
 */
contract Delivery {
    
    enum STATUS { order, transit, pickup, delivered }
     
    struct Detail {
        uint256 timeStamp;
        STATUS Status;
    }
    
    struct Order {
        string uniqueId;
        Detail[] detail;
    }
    
    mapping(uint256 => Order) orders;
    
    /** 
     * @dev Function create Order
     * @param _index(uint256)
     * @param _pid(string)
     * @param _timestamp(uint256)
     * @param _status(enum|numeric)
     * Status { order: 0, transit: 1, pickup: 2, delivered: 3 }
     */
    function create(uint256 _index ,string memory _pid, uint256 _timestamp, STATUS  _status) public {
        orders[_index].uniqueId = _pid;
        orders[_index].detail.push(Detail({timeStamp: _timestamp ,Status: _status}));
    }
    
     /** 
     * @dev Function update for update delivery status or state and timestamp of Order
     * @param _index(uint256)
     * @param _timestamp(uint256)
     * @param _status(enum|numeric)
     * Status { order: 0, transit: 1, pickup: 2, delivered: 3 }
     */
    function update(uint256 _index , uint256 _timestamp, STATUS _status) public {
        orders[_index].detail.push(Detail({timeStamp: _timestamp ,Status: _status})
        );
    }

    /** 
     * @dev Function getDetail for retrieves struct Order by index of orders
     * @param _index(uint256)
     * @return the Order struct detail
     */
    function getDetail(uint256 _index) public view returns(Order memory) {
        return orders[_index] ;
    }
    
}
