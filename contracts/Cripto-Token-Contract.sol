// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.7;

contract CryptoToken{
    uint age;
    uint private tokens = 4000000; 
    uint public totalSupply = 7;
    address public sender;
    

    mapping(address => uint) public balances;
    address public minter;
    event Sent(address from, address to, uint amount);
    constructor( /*...*/){
    minter = msg.sender;
}
    function mint(address recevier, uint amount) public{
        require(msg.sender == minter);

        //balances[recevier] = balances[recevier] + amount;
        balances[recevier] += amount;
    }


    function send(address receiver, uint amount) public{

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function setAge(uint x) public{
        age = x;
    }

    function getAge() public view returns (uint){
        return age;
    }

    }