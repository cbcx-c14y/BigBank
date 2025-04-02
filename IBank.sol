//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

interface IBank {
    function withdraw(uint amount) external;
    function getTopThree() external view returns (address[3] memory);
}
