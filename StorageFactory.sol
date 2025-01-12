// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// import "./SimpleStorage.sol"; -> Named imports to not import everything
import { SimpleStorage } from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageContracts;

    function createSimpleStorageContract() public {
        simpleStorageContracts.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Address
        // ABI - Application Binary Interface
        SimpleStorage mySimpleStorage = simpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage mySimpleStorage = simpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve(); 
    }
}
