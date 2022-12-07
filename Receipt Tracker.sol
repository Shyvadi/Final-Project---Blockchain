// SPDX-License-Identifier: MIT
// Implementation Final Project -  by Spencer Fairbairn - 100661165 + Justin Smith - 100742995
// solidity version set to 0.8.17
pragma solidity ^0.8.17;

contract TransactionReceipt {


    // struct of Items to be stored
    struct Items {

        string personName;
        uint256 itemPrice;
        string itemName;

    }

    // Array of items, public so we can have view event to take a look at all entries
    Items[] items;
    // We set mapping to allow lookup, public will create a view event
    mapping(string => Items[]) nameToReceipt;

    // Example of entry in struct
    // Items public item = Items ({personName:"Poppy", "itemPrice: 3, itemName:"Apple"});}
    
    // Adding item with price and name in memory
    function addItem(string memory _itemName, uint256 _itemPrice, string memory _personName) public {
        items.push(Items(_personName, _itemPrice, _itemName));

        // We set the person's name to the list of items so you can lookup with nameToReceipt
        nameToReceipt[_personName] = items;
    }

    // Get all items
    function getItemsByName(string memory _personName) public view returns (Items[] memory) {
        
        // Check all entries
        // There is a warning here that the code is unreachable, not sure why because it still runs.
        for (uint a=0; a<items.length; a++){

                // Return struct if name exists, including up to latest entry. Entries later then this (that don't have desired name) are ignored. 
                // I don't believe a filter (to filter out other entries inbetween desired ones) is currently possible.
                // was told doing this in general was impossible, so it's pretty cool we got this to work lol - spencer
                return nameToReceipt[_personName];                
        
        }
    }

}

