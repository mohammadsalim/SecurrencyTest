// Copyright SECURRENCY INC.
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

    ///             ///
    ///    Task 1   ///
    ///             ///

/**
 * Implemenet the function "doStringsMatch"
 * if the strings match - return true
 * else - return false
 */
contract StringMatch {

    function doStringsMatch(string memory a, string memory b) external pure returns (bool)
    {
        /// using keccak256 hashing after converting the strings to a byte array, rather than a manual byte by byte comparison & checking the length of each string which is less gas efficient
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
}

    ///             ///
    ///    Task 2   ///
    ///             ///

/**
 * Test task "Investor registration"
 *
 * Change the code so that investor details are tied to a "round" 
 * The caller should be able to set the investor details for the first round, then second round, to n... round
 * The caller should be able to retrieve investor details by "round"
 * 
 * Required to save the interface. 
 * All other modifications are allowed.
 **/
contract InvestorRegistration {
    uint public investmentRound = 1;

    InvestorDetails public investorsDetails;

    struct InvestorDetails {
        address investor;
        uint64 deposit;
        uint8 investorsAge;
        bool kyc;
        bool verificationStatus;
        bool USResident;
    }
    
    /**
     * @notice Lead investor registration
     * 
     * @param investor A lead investor address
     * @param depositAmount The amount deposited by a investor
     * @param age Investor age
     * @param kycStatus Investor KYC status
     * @param isVerifiedInvestor Investor verification status
     * @param isUSResident Resident status
     **/
    function setLeadInvestorForARound(
        address investor,
        uint64 depositAmount,
        uint8 age,
        bool kycStatus,
        bool isVerifiedInvestor,
        bool isUSResident
    )
        external
    {
        require(investor != address(0x00), "Invalid investor address");
        require(depositAmount > 0, "A deposint amount should be more than zero");
        require(age > 18, "The investor should be adult");

        InvestorDetails storage details = investorsDetails;

        details.investor = investor;
        details.deposit = depositAmount;
        details.investorsAge = age;
        details.kyc = kycStatus;
        details.verificationStatus = isVerifiedInvestor;
        details.USResident = isUSResident;

        
        investmentRound++;
    }
    
    /**
     * @notice Returns a lead investor details
     **/
    function getInvestorDetailsByInvestmentRound(
        uint round
    )
        external
        view
        returns (
            address investor,
            uint64 depositAmount,
            uint8 age,
            bool kycStatus,
            bool isVerifiedInverstor,
            bool isUSResident
        )
    {
        InvestorDetails memory investorDetails = investorsDetails;

        return (
            investorDetails.investor,
            investorDetails.deposit,
            investorDetails.investorsAge,
            investorDetails.kyc,
            investorDetails.verificationStatus,
            investorDetails.USResident
        );
    }
}

    ///             ///
    ///    Task 3   ///
    ///             ///

/**
 * This contract should compile
 * A stack overflow issue
 */
contract StackOverflow {

    function createAssetDetails(
        address currency,
        address settlementCurrency,
        bytes32 marketObjectCodeRateReset,
        int notionalPrincipal,
        int nominalInterestRate,
        int accruedInterest,
        int rateMultiplier, 
        uint contractDealDate,
        uint statusDate,
        uint initialExchangeDate,
        uint maturityDate,
        uint purchaseDate,
        uint capitalizationEndDate,
        uint cycleAnchorDateOfInterestPayment,
        uint cycleAnchorDateOfRateReset,
        uint cycleAnchorDateOfScalingIndex,
        uint cycleAnchorDateOfFee
    )
        external
    {
        require(currency != address(0x00), "Invalid currency address");
        require(settlementCurrency != address(0x00), "Invalid settlement currency address");
        require(marketObjectCodeRateReset != bytes32(0x00), "Code rate request is required");
        require(notionalPrincipal != 0, "notionalPrincipalnotionalPrincipal can't be empty");
        require(nominalInterestRate != 0, "nominalInterestRate can't be empty");
        require(accruedInterest != 0, "accruedInterest can't be empty");
        require(rateMultiplier != 0, "rateMultiplier can't be empty");
        require(contractDealDate != 0, "Contract deal date can't be empty");
        require(statusDate != 0, "statusDate can't be empty");
        require(initialExchangeDate != 0, "initialExchangeDate can't be empty");
        require(maturityDate != 0, "maturityDate can't be empty");
        require(purchaseDate != 0, "purchaseDate can't be empty");
        require(capitalizationEndDate != 0, "capitalizationEndDate can't be empty");
        require(cycleAnchorDateOfInterestPayment != 0, "cycleAnchorDateOfInterestPayment can't be empty");
        require(cycleAnchorDateOfScalingIndex != 0, "cycleAnchorDateOfScalingIndex can't be empty");
        require(cycleAnchorDateOfFee != 0, "cycleAnchorDateOfFee can't be empty");
        
        saveDetailsToStorage(
            currency,
            settlementCurrency,
            marketObjectCodeRateReset,
            notionalPrincipal,
            nominalInterestRate,
            accruedInterest,
            rateMultiplier,
            contractDealDate,
            statusDate,
            initialExchangeDate,
            maturityDate,
            purchaseDate,
            capitalizationEndDate,
            cycleAnchorDateOfInterestPayment,
            cycleAnchorDateOfRateReset,
            cycleAnchorDateOfScalingIndex,
            cycleAnchorDateOfFee
        );
    }
    
    function saveDetailsToStorage(
        address currency,
        address settlementCurrency,
        bytes32 marketObjectCodeRateReset,
        int notionalPrincipal,
        int nominalInterestRate,
        int accruedInterest,
        int rateMultiplier, 
        uint contractDealDate,
        uint statusDate,
        uint initialExchangeDate,
        uint maturityDate,
        uint purchaseDate,
        uint capitalizationEndDate,
        uint cycleAnchorDateOfInterestPayment,
        uint cycleAnchorDateOfRateReset,
        uint cycleAnchorDateOfScalingIndex,
        uint cycleAnchorDateOfFee
    )
        internal
    {
        // Mock function
        // skip implementation
    }
}

