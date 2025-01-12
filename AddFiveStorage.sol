// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { SimpleStorage } from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    function store(uint256 _favNumber) public override  {
        favNumber = _favNumber + 5;
    }

}
