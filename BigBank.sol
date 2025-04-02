//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "./Bank.sol";

contract BigBank is Bank {
    // 要求存款金额 >0.001 ether
    modifier minDeposit() {
        require(msg.value > 0.001 ether, "Deposit must be greater than 0.001 ether");
        _;
    }

    constructor() Bank() {}

    // BigBank 合约支持转移管理员
    function transferAdmin(address newAdmin) public onlyAdmin {
        admin = newAdmin;
    }

    // 重写receive，用minDeposit修饰符
    receive() override external payable minDeposit {
        balances[msg.sender] = balances[msg.sender] + msg.value;
        updateTopThree();
    }
}