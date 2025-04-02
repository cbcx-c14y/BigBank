//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "./IBank.sol";

contract Admin {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function adminWithdraw(IBank bank) public onlyOwner {
        bank.withdraw(address(bank).balance);
    }
}