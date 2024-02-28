// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AGEMSToken is ERC20 {
 
    constructor() ERC20("AGEMS", "token") {
        _mint(msg.sender, 9000000000);
   

    }
}

