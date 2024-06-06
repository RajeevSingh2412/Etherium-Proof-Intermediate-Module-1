//SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract BalanceManagement{
    uint public balance;
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner{
        require(owner==msg.sender,"Only Owner Acess is Valid");
        _;
    }

    function addBalance(uint _value)public onlyOwner{
        require(_value>0,"Value should be greater than 0!");
        balance +=_value;
    }

    function assertValue() public view{
        assert(balance>0);
    }

    function withdrawAmmount(uint _value)public onlyOwner{
        uint initialbalance=balance;
        balance -= _value;

        if(initialbalance<_value){
            revert("Insufficient Balance");
        }
    }



}
