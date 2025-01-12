// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24; // this is the solidity compiler version

contract SimpleStorage {
    uint256 favNumber; // default -> 0
    Person[] persons;
    // uint256[] favoriteNumbers;

    struct Person {
        string name;
        uint256 pfavNumer;
    }

    mapping(string => uint256) public nameToFavNumber;
    
    // Person public myFriend = Person({
    //     favoriteNumber: 7,
    //     name: "Pat"
    // });

    function store(uint256 _favNumber) public {
        favNumber = _favNumber;
    }

    // view -> not allows updating state - no transaction needed (no gas needed)
    // pure -> same as above, but does not allow to read state/storage
    // these only consume gas when another transactional gas needed func calls it
    function retrieve() public view returns (uint256) {
        return favNumber;
    }

    // calldata -> temporal -> cannot be modified
    // memory -> temporal -> can be modified -> specified with string since it is a special type
    // storage -> permanent -> can be modified -> default if outside of func within the contract
    // value types -> are copied by value -> dont need a storage location
    // referenced types -> need to specified a storage location
    function addPerson(string memory _name, uint256 _pfavNumber) public {
        persons.push(Person(_name, _pfavNumber));
        nameToFavNumber[_name] = _pfavNumber;
    } 
}

// This compiles to EVM, Ethereum Virtual Machine
// We can deploy to any blockchain EVM compatible
// EVM compatible blockchains: Ethereum Polygon, Arbitrum, Optimism, ZKsync
