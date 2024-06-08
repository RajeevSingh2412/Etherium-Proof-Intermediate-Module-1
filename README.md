# Seaport Management Smart Contract

This Solidity program is a simple Seaport Management smart contract that allows the owner to manage the docking and undocking of ships at different ports. The contract includes functionalities to dock and undock ships, ensuring the availability of ports, utilizing concepts such as function modifiers and error handling.

## Description

This program is a basic smart contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract allows the owner to:

        1. Dock ships at available ports
        2. Undock ships from ports
        3. Ensure the availability of ports and handle errors effectively using require statements

## Getting Started

### Executing Program

To run this program, we can use Remix, an online Solidity IDE. Follow the steps below to get started:

    1. Go to the Remix website.
    2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
    3. Save the file with a .sol extension (e.g., SeaportManagement.sol).
    4. Copy and paste the following code into the file:
    
```solidity
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
```
### Compiling the Code

    1. Click on the "Solidity Compiler" tab in the left-hand sidebar.
    2. Ensure the "Compiler" option is set to "0.8.25" (or another compatible version).
    3. Click on the "Compile SeaportManagement.sol" button.

### Deploying the Contract

    1. Go to the "Deploy & Run Transactions" tab in the left-hand sidebar.
    2. Select the "SeaportManagement" contract from the dropdown menu.
    3. Click on the "Deploy" button.
    4. Interacting with the Contract.

Once the contract is deployed, you can interact with it by calling the functions. Ensure you are connected as the owner address to perform owner-restricted functions.

#### Dock Ship:
    1. Select the dockShip function.
    2. Enter the ship's address to dock.
    3. Click on the "transact" button.

#### Undock Ship:
    1. Select the undockShip function.
    2. Enter the ship's address to undock.
    3. Click on the "transact" button.

#### AssertAvailabilty
    1. Select the assertAvailability function.
    2. Relevelant output will be visible on screen.
    
## Authors
Rajeev Singh
[@rajeevsingh](https://www.linkedin.com/in/rajeevsingh2412/)
