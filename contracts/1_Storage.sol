// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    struct Person{
        uint256 number;
        string name;
    }

    Person[] public people;

    function addPerson(string memory _name, uint _number) public{
        people.push( Person(_number, _name));
    }
}