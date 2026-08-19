-- ============================================
-- VIEWS
-- ============================================


-- 1. Create a view showing investor transaction details.

CREATE VIEW Investor_Transaction_Details AS
SELECT Investors.FullName,
       Transactions.TransactionID,
       Transactions.Amount,
       Transactions.TransactionType,
       Transactions.TransactionDate
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID;


-- 2. Create a view showing mutual fund details with AMC name.

CREATE VIEW MutualFund_AMC_Details AS
SELECT MutualFunds.FundID,
       MutualFunds.FundName,
       AMC.AMCName,
       MutualFunds.CurrentNAV,
       MutualFunds.ExpenseRatio
FROM MutualFunds
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID;


-- 3. Create a view showing complete investment details.

CREATE VIEW Investment_Details AS
SELECT Investors.FullName,
       MutualFunds.FundName,
       AMC.AMCName,
       Transactions.Amount,
       Transactions.UnitsPurchased,
       Transactions.NAVAtTransaction,
       Transactions.TransactionDate
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
INNER JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID;


-- 4. Create a view showing total investment by each investor.

CREATE VIEW Investor_Total_Investment AS
SELECT Investors.InvestorID,
       Investors.FullName,
       SUM(Transactions.Amount) AS Total_Investment
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
GROUP BY Investors.InvestorID, Investors.FullName;


-- 5. Create a view showing total investment in each mutual fund.

CREATE VIEW Fund_Total_Investment AS
SELECT MutualFunds.FundID,
       MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundID, MutualFunds.FundName;



-- ============================================
-- TEST VIEWS
-- ============================================

SELECT *
FROM Investor_Transaction_Details;

SELECT *
FROM MutualFund_AMC_Details;

SELECT *
FROM Investment_Details;

SELECT *
FROM Investor_Total_Investment;

SELECT *
FROM Fund_Total_Investment;