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

    /// Test for InvestorRegistration
    function testInvestorRegistration() public {
        address investorAddr = address(0x1234567890123456789012345678901234567890);
        investorRegistration.setLeadInvestorForARound(
            investorAddr, 5000, 30, true, true, false
        );
        
        (
            address investor,
            uint64 depositAmount,
            uint8 age,
            bool kycStatus,
            bool isVerifiedInvestor,
            bool isUSResident
        ) = investorRegistration.getInvestorDetailsByInvestmentRound(1);

        assertEq(investor, investorAddr);
        assertEq(depositAmount, 5000);
        assertEq(age, 30);
        assertTrue(kycStatus);
        assertTrue(isVerifiedInvestor);
        assertFalse(isUSResident);
    }
}
