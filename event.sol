// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract EventArrange {

    uint EventID;
    mapping(uint=>Event) public EventLocation;
    mapping(address=>mapping(uint=>uint))  public Tickets;

    struct Event{

        address Organizer;
        string Event_Name;
        uint Event_Date;
        uint Total_Tickets;
        uint Remaining_Tickets;

    }

    function CreateEvent() {
        code
    }

    
}