// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;
pragma experimental ABIEncoderV2;

/**
 * @author AIS NEXT BCD (BlockChain Development) Team
 * @title Samrt Contract diploma store IPFS Hash and retrive Hash
 * @dev Create and getDetail of the Certificate that storage on blockchain
 */
contract diploma {

    struct Profile {
        string firstName;
        string lastName;
        Certificate[] cert;
    }

    struct Certificate {
        string ipfsFileHash;
        uint256 timeStamp;
    }

    mapping(address => Profile) profiles;

    /**
    * @dev Function that used to create certificate.
    * @param _firstName The firstName of the user type string.
    * @param _lastName The lastName of the user type string.
    */
    function createProfile(string memory _firstName, string memory _lastName)public {
        profiles[msg.sender].firstName = _firstName;
        profiles[msg.sender].lastName = _lastName;
    }

    /**
    * @dev Function that used to giving certificate.
    * explain in technically storing ipfs hash to the struct.
    * @param _receipent address of the user.
    * @param _hash hash value of file that storing on IPFS.
    * @param _timeStamp timestamp in unix format.
    */

    function giveCerticate(address _receipent, string memory _hash, uint256 _timeStamp) public{
        profiles[_receipent].cert.push(Certificate({ipfsFileHash: _hash, timeStamp: _timeStamp}));
    }

    /**
    * @dev Function that used to get List of Certificate by address.
    * @param _receipent address of the user.
    * @return profiles struct that store user data and user certificate.
    */
    function getCerticate(address _receipent) public view returns (Profile memory ) {
        return profiles[_receipent];
    }

}