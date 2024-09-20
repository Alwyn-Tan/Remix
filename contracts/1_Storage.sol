// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    uint256 num;

    struct Person{
        uint256 number;
        string name;
    }

    Person[] public people;
    mapping(string=>uint256) public map;

    function store(uint256 _num) public {
        num = _num;
    }

    function retrieve() public view returns (uint256) {
        return num;
    }

    function addPerson(string memory _name, uint _number) public{
        people.push( Person(_number, _name));
        map[_name] = _number;
    }
}