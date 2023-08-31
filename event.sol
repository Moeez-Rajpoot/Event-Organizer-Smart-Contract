// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract EventArrange {

    address Manager;
    uint EventID;
    mapping(uint=>Event) public EventLocation;
    mapping(address=>mapping(uint=>uint))  public Tickets;

    constructor() {
        Manager = msg.sender;
    }
    struct Event{

        address Organizer;
        string Event_Name;
        uint Event_Date;
        uint Price;
        uint Total_Tickets;
        uint Remaining_Tickets;
        

    }

    function CreateEvent(string memory name , uint _date , uint total_ticket,  uint price_per_ticket)  external {
         require(_date > block.timestamp , " Please Set The date for Future Event");
         require( bytes(name).length > 0  , "Event Name is Required");
         require( total_ticket > 0, "No of Tickets are not Enough");
         require(price_per_ticket > 0 ,"Price of Ticket is so Small");

         EventLocation[EventID] = Event(msg.sender,name,_date, price_per_ticket ,total_ticket,total_ticket);
         EventID++;

    }

    function BuyTicket(uint _Eventid , uint qunatity  ) payable  public {
        Event storage Eventvar = EventLocation[_Eventid];
         require(Eventvar.Event_Date > block.timestamp, "Tickets are Closed");
         require(qunatity < Eventvar.Total_Tickets, "Can't buy more than Total Supply");
         require(qunatity <= Eventvar.Remaining_Tickets ,"Not Enough Tickets");
         require(msg.value == (Eventvar.Price * qunatity), "Not Enough Ethers");

         



        
    }

    
}