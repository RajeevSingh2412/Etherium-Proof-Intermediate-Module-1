# Balance Management Smart Contract

This Solidity program is a simple Balance Management smart contract that allows the owner to manage the balance. The contract includes functionalities to add and withdraw values from the balance, utilizing concepts such as function modifiers, assertions, and error handling.

## Description

This program is a basic smart contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract allows the owner to:
- Add value to the balance
- Withdraw value from the balance
- Ensure the balance is always greater than zero using assertions
- Handle errors effectively using require and revert statements

## Getting Started

### Executing Program

To run this program, we can use Remix, an online Solidity IDE. Follow the steps below to get started:

1. Go to the [Remix website](https://remix.ethereum.org/).
2. Create a new file by clicking on the "+" icon in the left-hand sidebar.
3. Save the file with a .sol extension (e.g., BalanceManagement.sol).
4. Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract BalanceManagement {
    uint public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(owner == msg.sender, "Only Owner Access is Valid");
        _;
    }

    function addBalance(uint _value) public onlyOwner {
        require(_value > 0, "Value should be greater than 0!");
        balance += _value;
    }

    function assertValue() public view {
        assert(balance > 0);
    }

    function withdrawAmount(uint _value) public onlyOwner {
        uint initialBalance = balance;
        balance -= _value;

        if (initialBalance < _value) {
            revert("Insufficient Balance");
        }
    }
}
```
### Compiling the Code

    1. Click on the "Solidity Compiler" tab in the left-hand sidebar.
    2. Ensure the "Compiler" option is set to "0.8.25" (or another compatible version).
    3. Click on the "Compile BalanceManagement.sol" button.

### Deploying the Contract

    1. Go to the "Deploy & Run Transactions" tab in the left-hand sidebar.
    2. Select the "BalanceManagement" contract from the dropdown menu.
    3. Click on the "Deploy" button.
    4. Interacting with the Contract
        Once the contract is deployed, you can interact with it by calling the functions. Ensure you are connected as the owner address to perform owner-restricted functions.

#### Add Balance:
    1. Select the addBalance function.
    2. Enter the value to add.
    3. Click on the "transact" button.
#### Assert Value:
    1. Select the assertValue function.
    2. Click on the "call" button.
#### Withdraw Amount:
    1. Select the withdrawAmount function.
    2. Enter the value to withdraw.
    3. Click on the "transact" button.
    
## Authors
Rajeev Singh
[@rajeevsingh](https://www.linkedin.com/in/rajeevsingh2412/)
