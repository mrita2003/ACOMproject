// SPDX-License-identifier: MIT
pragma solidity ^0.8;

import "./token1.sol";
contract ACOMWallet {
    AGEMSToken public agemstoken;
    address public owner;

    event WalletLinked(address indexed user, address indexed wallet);

    constructor (address _agemsTokenAddress) {
        agemstoken = AGEMSToken (_agemsTokenAddress);
        owner = msg.sender;


    }

modifier onlyOwner() {

    require(msg.sender == owner, "only contract owner can tell this function" );
    _;

}

function linkWallet() external {
    emit WalletLinked(msg.sender, msg.sender);

}

function transferTokens (address _to, uint256 _amount) external {
     agemstoken.transferFrom (msg.sender, _to, _amount);

      
}

function approveToken (address _spender, uint256 _amount) external {

    agemstoken.approve (_spender, _amount);

}

     function balanceOf (address _account) external view returns (uint256) {
        return agemstoken.balanceOf (_account);
     }

     function allowence (address _owner, address _spender) external view returns (uint256)
     {
        return agemstoken.allowance(_owner, _spender);
     }

     function changeOwner (address _newOwner) external onlyOwner {
        require (_newOwner != address(0), "Invalid address");

        owner =_newOwner;
     }

     }



