// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./ISpendSBT.sol";
import "./ISpendAdmin.sol";

contract SpendDAO is Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _sbtCounter;
    Counters.Counter private _adminCounter;

    address public sbtContract;
    address public adminContract;

    constructor(address _sbtContract, address _adminContract) {
        sbtContract = _sbtContract;
        adminContract = _adminContract;
        
    }

    function setSbtContract(address _sbtContract) public onlyOwner {
        sbtContract = _sbtContract;
    }

    function setAdminContract(address _adminContract) public onlyOwner {
        adminContract = _adminContract;
    }

    function mintSbt(address to, string memory uri) public onlyOwner {
        _sbtCounter.increment();
        ISpendSBT(sbtContract).safeMint(to, uri);
    }

    function mintAdmin(address to, string memory uri) public onlyOwner {
        _adminCounter.increment();
        ISpendAdmin(adminContract).safeMint(to, uri);
    }

    


}