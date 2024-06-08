//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract seaport{
    address public owner;
    uint public totalports=3;
    uint public total_ships=0;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"Only Owner Can Access");
        _;
    }

    mapping(uint=>bool) public portavailability;
    mapping(uint=>address) public shipatport;

    function dockShip(address _shipaddress) public onlyOwner{
        require(total_ships<3,"no port available");
        for(uint i=1;i<=3;i++){
            if(portavailability[i]==false){
                portavailability[i]=true;
                shipatport[i]=_shipaddress;
                total_ships++;
                break;
            }
        }
    }

    function undockShip(address _shipaddress)public onlyOwner{
        require(total_ships>0,"no ship to remove");
        uint portofship=1;
        bool shipfound=false;

        for(uint i=1;i<=3;i++){
            if(shipatport[i]==_shipaddress){
                portofship=i;
                shipfound=true;
            }
        }

        shipatport[portofship]=address(0);
        portavailability[portofship]=false;
        total_ships--;

        if(!shipfound){
            revert("Ship Not Found!");
        }

    }

    function assertAvailabilty() public view{
        assert(total_ships>0 && total_ships<=3);
    }
}
