// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    address[] public funders;
    mapping(address funder=> uint256 amountFunded) public addressToAmountFunded;

    address public immutable owner;
    uint256 public constant minimunUsd = 5;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getEthInUsd() >= minimunUsd, "did not send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public {
         for( uint256 i = 0; i< funders.length; i++){
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
         }

         funders = new address[](0);

        (bool callSuccess, )  = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Send is not the owner");
        _;

    }

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
     }

}