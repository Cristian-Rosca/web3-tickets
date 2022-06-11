// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

uint constant totalTickets = 10;

contract Tickets {
    address public owner = msg.sender;

    struct Ticket {
        uint id;
        uint price;
        address owner;
    }

    Ticket[totalTickets] public tickets;

    constructor() {
        for(uint i = 0; i < totalTickets; i++){
            // tickets[i].id = i;
            tickets[i].price = 1e17; // 0.1ETH
            tickets[i].owner = address(0x0);
        }
    }

    function buyTicket(uint _index) external payable {
        require(_index < totalTickets && _index >= 0);
        require(tickets[_index].owner == address(0x0));
        require(msg.value >= tickets[_index].price);
        tickets[_index].owner = msg.sender;
    }
}