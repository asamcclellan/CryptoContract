//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Coin {
    address private minter;

    mapping(address => uint) public balances;
    //This acts like a Python dictionary.

    event Sent(address from, address to, uint amount);
    //This is responsible for logging events.

    //This is called only at the beginning of deployment.
    constructor() {
        minter = msg.sender;
        //msg.sender is an inherited method from Solidity.
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        //Here, we're going to make sure that only the message sender can mint tokens.

        balances[receiver] += amount;
        //This is how to update the map table.
    }

    function send (address receiver, uint amount) public {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}