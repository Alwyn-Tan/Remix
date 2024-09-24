// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SimpleStorage {

    uint256 num;

    struct Person{
        uint256 number;
        string name;
    }

    Person[] public people;
    mapping(string=>uint256) public map;

    function store(uint256 _num) public virtual {
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