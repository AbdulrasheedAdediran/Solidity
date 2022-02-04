// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract W3BNS {
//   Price: To be determined by character length of the desired name
//   Ownership: 1. One address can only register one name 
//              2. User desired name is the name service
//              3. If name is taken, return 'unavailable'
//              4. Naming extension should be .w3bridge
//              5. Name service purchased will be valid for 1month
//   ------------------------------------------------------------------------------
//   Incentive for early adoptors, after 2weeks

// price -> 3char = 100; 4chars = 50; >=5 = 30

    enum Price {
        SHORT, // 3chars
        MEDIUM, // 4chars
        LONG // >=5chars
    }
    mapping(address => string) public address_ens_map;
    mapping(string => bool) public registered_ens;
    string constant EXTENSION = ".w3bridge";



    // modifier checkConditions(string memory _name){
    //     check whether address is mapped to a name already


    //     require(bytes(_name).length>=3, "Sorry, name too short.");
    //     require(!registered_ens[_name], "Sorry, this name is taken");
    //     _;

        
    // }
    
    // creates the name service for an address
    function create_ens(string memory _name) public  returns(string memory) {
        if (bytes(_name).length<=2){
            revert("Sorry, name too short.");
        }
         // checks if address is mapped to a name already
        if (keccak256(abi.encodePacked(address_ens_map[msg.sender])) != keccak256(abi.encodePacked(""))){
            revert("Sorry, you can only have one name per address");
        }
        if (registered_ens[_name]) {
            revert("Sorry, this name is taken");
        }
        address_ens_map[msg.sender] = string(abi.encodePacked(_name, EXTENSION));
        registered_ens[_name] = true;
        return address_ens_map[msg.sender];
    }
    
}