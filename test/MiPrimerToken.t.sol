// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {MiPrimerToken} from "../src/MiPrimerToken.sol";

contract MiPrimerTokenTest is Test {
    MiPrimerToken token;
    uint256 constant TOTAL_SUPPLY = 1000000 * 10 ** 18;

    function setUp() public {
        token = new MiPrimerToken();
        token.mint(address(this), TOTAL_SUPPLY);
    }

    function test_Mint() public {
        address usuario = address(0xABC);
        token.mint(usuario, 500);
        assertEq(token.balanceOf(usuario), 500);
    }

    function test_Transfer() public {
        token.transfer(address(1), 100);
        assertEq(token.balanceOf(address(1)), 100);
    }

    function testFuzz_Transfer(uint256 amount) public {
        amount = bound(amount, 0, TOTAL_SUPPLY); 
        
        token.transfer(address(1), amount);
        assertEq(token.balanceOf(address(1)), amount);
    }
}