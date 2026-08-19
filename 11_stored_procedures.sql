-- ============================================
-- STORED PROCEDURES
-- ============================================


-- 1. Get all transactions of a particular investor.

DROP PROCEDURE IF EXISTS GetInvestorTransactions;

DELIMITER //

CREATE PROCEDURE GetInvestorTransactions(IN p_InvestorID INT)
BEGIN
    SELECT *
    FROM Transactions
    WHERE InvestorID = p_InvestorID;
END //

DELIMITER ;


-- 2. Get details of a particular mutual fund.

DROP PROCEDURE IF EXISTS GetFundDetails;

DELIMITER //

CREATE PROCEDURE GetFundDetails(IN p_FundID BIGINT)
BEGIN
    SELECT *
    FROM MutualFunds
    WHERE FundID = p_FundID;
END //

DELIMITER ;


-- 3. Get total investment of a particular investor.

DROP PROCEDURE IF EXISTS GetInvestorTotalInvestment;

DELIMITER //

CREATE PROCEDURE GetInvestorTotalInvestment(IN p_InvestorID INT)
BEGIN
    SELECT Investors.FullName,
           SUM(Transactions.Amount) AS Total_Investment
    FROM Investors
    INNER JOIN Transactions
    ON Investors.InvestorID = Transactions.InvestorID
    WHERE Investors.InvestorID = p_InvestorID
    GROUP BY Investors.InvestorID, Investors.FullName;
END //

DELIMITER ;


-- 4. Get all mutual funds managed by a particular AMC.

DROP PROCEDURE IF EXISTS GetFundsByAMC;

DELIMITER //

CREATE PROCEDURE GetFundsByAMC(IN p_AMCID BIGINT)
BEGIN
    SELECT MutualFunds.FundID,
           MutualFunds.FundName,
           MutualFunds.CurrentNAV
    FROM MutualFunds
    WHERE MutualFunds.AMCID = p_AMCID;
END //

DELIMITER ;


-- ============================================
-- TEST STORED PROCEDURES
-- ============================================

-- Test investor transactions.

CALL GetInvestorTransactions(1001);


-- Test mutual fund details.

CALL GetFundDetails(2001);


-- Test investor total investment.

CALL GetInvestorTotalInvestment(1001);


-- Test funds managed by AMC.

CALL GetFundsByAMC(101);