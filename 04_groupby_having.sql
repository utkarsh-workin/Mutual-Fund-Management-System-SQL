/*
==========================================
Project : Mutual Fund Management System
File    : 04_groupby_having.sql

Author  : Kumar Utkarsh

Description:
This file contains GROUP BY and HAVING
queries used for generating reports.
==========================================
*/

USE MutualFundDB;

-- ==========================================
-- GROUP BY Queries
-- ==========================================

-- 1. Show total investment made by each investor.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID;


-- 2. Show the number of transactions made by each investor.

SELECT InvestorID,
       COUNT(TransactionID) AS Total_Transactions
FROM Transactions
GROUP BY InvestorID;


-- 3. Show the average investment amount made by each investor.

SELECT InvestorID,
       AVG(Amount) AS Average_Investment
FROM Transactions
GROUP BY InvestorID;


-- 4. Show the highest investment amount made by each investor.

SELECT InvestorID,
       MAX(Amount) AS Highest_Investment
FROM Transactions
GROUP BY InvestorID;


-- 5. Show the lowest investment amount made by each investor.

SELECT InvestorID,
       MIN(Amount) AS Lowest_Investment
FROM Transactions
GROUP BY InvestorID;


-- 6. Show each investor's name and total investment amount.

SELECT Investors.FullName,
       SUM(Transactions.Amount) AS Total_Investment
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
GROUP BY Investors.FullName;


-- 7. Show each mutual fund's name and total investment amount.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName;


-- 8. Show each AMC's name and average investment amount.

SELECT AMC.AMCName,
       AVG(Transactions.Amount) AS Average_Investment
FROM AMC
INNER JOIN MutualFunds
ON AMC.AMCID = MutualFunds.AMCID
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY AMC.AMCName;


-- ==========================================
-- HAVING Queries
-- ==========================================

-- 9. Show investors whose total investment is greater than ₹10,000.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
HAVING SUM(Amount) > 10000;


-- 10. Show mutual funds whose total investment is greater than ₹20,000.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName
HAVING SUM(Transactions.Amount) > 20000;


-- 11. Show AMCs whose average investment amount is greater than ₹15,000.

SELECT AMC.AMCName,
       AVG(Transactions.Amount) AS Average_Investment
FROM AMC
INNER JOIN MutualFunds
ON AMC.AMCID = MutualFunds.AMCID
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY AMC.AMCName
HAVING AVG(Transactions.Amount) > 15000;


-- 12. Show investors who have made more than one transaction.

SELECT InvestorID,
       COUNT(TransactionID) AS Total_Transactions
FROM Transactions
GROUP BY InvestorID
HAVING COUNT(TransactionID) > 1;