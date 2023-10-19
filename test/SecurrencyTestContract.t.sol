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
    
    /// Test for StackOverflow
    function testStackOverflow() public {
        StackOverflow.AssetDetails memory details = StackOverflow.AssetDetails({
            currency: address(0x0987654321098765432109876543210987654321),
            settlementCurrency: address(0x1123456789012345678901234567890123456789),
            marketObjectCodeRateReset: keccak256("test"),
            notionalPrincipal: 1000,
            nominalInterestRate: 5,
            accruedInterest: 2,
            rateMultiplier: 3,
            contractDealDate: block.timestamp,
            statusDate: block.timestamp + 1 days,
            initialExchangeDate: block.timestamp + 2 days,
            maturityDate: block.timestamp + 365 days,
            purchaseDate: block.timestamp + 10 days,
            capitalizationEndDate: block.timestamp + 20 days,
            cycleAnchorDateOfInterestPayment: block.timestamp + 30 days,
            cycleAnchorDateOfRateReset: block.timestamp + 40 days,
            cycleAnchorDateOfScalingIndex: block.timestamp + 50 days,
            cycleAnchorDateOfFee: block.timestamp + 60 days
        });
        stackOverflow.createAssetDetails(details);
        // Assuming `saveDetailsToStorage` is a mock, there's no state change to check
        // If state changes were present, we'd use assertions here.
    }
}
