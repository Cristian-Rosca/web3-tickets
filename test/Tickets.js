const assert = require('assert');
const { isTypedArray } = require('util/types');
const Tickets = artifacts.require('Tickets');

contract('Tickets', (accounts) => {
    const buyer = accounts[1];
    const ticket_id = 0;

    it('should allow a user to buy a ticket', async () => {
        const instance = await Tickets.deployed(); 
        const originalTicket = await instance.tickets(ticket_id);

        await instance.buyTicket(ticket_id, {from: buyer, value: originalTicket.price});
        const updatedTicket = await instance.tickets(ticket_id);

        assert.equal(updatedTicket.owner, buyer, 'the buyer should now own this ticket')
    })

});