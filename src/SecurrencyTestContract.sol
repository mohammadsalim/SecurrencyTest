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

    /// Instead of having a single InvestorDetails instance, we need a mapping that links each investment round to its InvestorDetails.
    mapping(uint => InvestorDetails) public investmentRounds;

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

        /// This function should now store the investor details for the current round and then increase the investmentRound counter.
        InvestorDetails storage details = investmentRounds[investmentRound];

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
        /// This should allow the function to now fetch the investor details of a specific round provided as input.
        InvestorDetails memory investorDetails = investmentRounds[round];

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

    /// Implemented a struct to encapsulate all of the variables into one
    struct AssetDetails {
        address currency;
        address settlementCurrency;
        bytes32 marketObjectCodeRateReset;
        int notionalPrincipal;
        int nominalInterestRate;
        int accruedInterest;
        int rateMultiplier;
        uint contractDealDate;
        uint statusDate;
        uint initialExchangeDate;
        uint maturityDate;
        uint purchaseDate;
        uint capitalizationEndDate;
        uint cycleAnchorDateOfInterestPayment;
        uint cycleAnchorDateOfRateReset;
        uint cycleAnchorDateOfScalingIndex;
        uint cycleAnchorDateOfFee;
    }

    function createAssetDetails(AssetDetails memory details) external {
        require(details.currency != address(0x00), "Invalid currency address");
        require(details.settlementCurrency != address(0x00), "Invalid settlement currency address");
        require(details.marketObjectCodeRateReset != bytes32(0x00), "Code rate request is required");
        require(details.notionalPrincipal != 0, "notionalPrincipalnotionalPrincipal can't be empty");
        require(details.nominalInterestRate != 0, "nominalInterestRate can't be empty");
        require(details.accruedInterest != 0, "accruedInterest can't be empty");
        require(details.rateMultiplier != 0, "rateMultiplier can't be empty");
        require(details.contractDealDate != 0, "Contract deal date can't be empty");
        require(details.statusDate != 0, "statusDate can't be empty");
        require(details.initialExchangeDate != 0, "initialExchangeDate can't be empty");
        require(details.maturityDate != 0, "maturityDate can't be empty");
        require(details.purchaseDate != 0, "purchaseDate can't be empty");
        require(details.capitalizationEndDate != 0, "capitalizationEndDate can't be empty");
        require(details.cycleAnchorDateOfInterestPayment != 0, "cycleAnchorDateOfInterestPayment can't be empty");
        require(details.cycleAnchorDateOfScalingIndex != 0, "cycleAnchorDateOfScalingIndex can't be empty");
        require(details.cycleAnchorDateOfFee != 0, "cycleAnchorDateOfFee can't be empty");

        saveDetailsToStorage(details);
    }

    function saveDetailsToStorage(AssetDetails memory details) internal {
        // Mock function
        // skip implementation
    }
}

