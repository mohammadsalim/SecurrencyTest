// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SecurrencyTestContract.sol";

contract SecurrencyTestContractTest is Test {

    StringMatch public stringMatch;
    InvestorRegistration public investorRegistration;
    StackOverflow public stackOverflow;

    function setUp() public {
        stringMatch = new StringMatch();
        investorRegistration = new InvestorRegistration();
        stackOverflow = new StackOverflow();
    }

    /// Test for StringMatch
    function testStringMatch() public {
        assertTrue(stringMatch.doStringsMatch("hello", "hello"));
        assertFalse(stringMatch.doStringsMatch("hello", "world"));
    }
}
