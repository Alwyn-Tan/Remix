// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public simpleStorageList;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageList.push(simpleStorage);
    }

    function sfStore ( uint256 index, uint256 input) public {
        simpleStorageList[index].store(input);
    }

    function sfGet(uint256 index)public view returns (uint256) {
        return simpleStorageList[index].retrieve();
    }
}