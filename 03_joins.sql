/*
==========================================
Project : Mutual Fund Management System
File    : 03_joins.sql

Author  : Kumar Utkarsh

Description:
This file contains JOIN queries used
to retrieve data from multiple related
tables in the Mutual Fund Management System.
==========================================
*/

USE MutualFundDB;

/*
==========================================
INNER JOIN
==========================================
*/-- Show investor names and their transaction IDs.

SELECT Investors.FullName,
       Transactions.TransactionID
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID;

-- Show mutual fund names and their AMC names.

SELECT MutualFunds.FundName,
       AMC.AMCName
FROM MutualFunds
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID;

-- Show mutual fund names and their categories.

SELECT MutualFunds.FundName,
       FundCategory.CategoryName
FROM MutualFunds
INNER JOIN FundCategory
ON MutualFunds.CategoryID = FundCategory.CategoryID;

-- Show investor name, fund name and investment amount.

SELECT Investors.FullName,
       MutualFunds.FundName,
       Transactions.Amount
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
INNER JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID;

-- Show investor name, fund name, AMC name,
-- investment amount and transaction date.

SELECT Investors.FullName,
       MutualFunds.FundName,
       AMC.AMCName,
       Transactions.Amount,
       Transactions.TransactionDate
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
INNER JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID;

-- Show investor name, fund name, category,
-- AMC name, amount and transaction date.

SELECT Investors.FullName,
       MutualFunds.FundName,
       FundCategory.CategoryName,
       AMC.AMCName,
       Transactions.Amount,
       Transactions.TransactionDate
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
INNER JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID
INNER JOIN FundCategory
ON MutualFunds.CategoryID = FundCategory.CategoryID;


/*
==========================================
LEFT JOIN
==========================================
*/

-- Show all investors, including those
-- who have not made any transactions.

SELECT Investors.FullName,
       Transactions.TransactionID
FROM Investors
LEFT JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID;

-- Show all mutual funds, including those
-- that have never been purchased.

SELECT MutualFunds.FundName,
       Transactions.TransactionID
FROM MutualFunds
LEFT JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID;

-- Show all investors along with the
-- mutual funds they have invested in.

SELECT Investors.FullName,
       MutualFunds.FundName
FROM Investors
LEFT JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
LEFT JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID;

-- Show all investors, their mutual funds,
-- and investment amounts.

SELECT Investors.FullName,
       MutualFunds.FundName,
       Transactions.Amount
FROM Investors
LEFT JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
LEFT JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID;

-- Show all mutual funds, their AMC names,
-- and transaction IDs.

SELECT MutualFunds.FundName,
       AMC.AMCName,
       Transactions.TransactionID
FROM MutualFunds
INNER JOIN AMC
ON MutualFunds.AMCID = AMC.AMCID
LEFT JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID;

/*
==========================================
RIGHT JOIN
==========================================
*/

-- Show all transactions, including
-- those without matching investors.

SELECT Investors.FullName,
       Transactions.TransactionID
FROM Investors
RIGHT JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID;

-- Show all transactions along with
-- their mutual fund names.

SELECT MutualFunds.FundName,
       Transactions.TransactionID
FROM MutualFunds
RIGHT JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID;

-- Show all transactions with investor
-- names and mutual fund names.

SELECT Investors.FullName,
       MutualFunds.FundName,
       Transactions.TransactionID
FROM Investors
RIGHT JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
INNER JOIN MutualFunds
ON Transactions.FundID = MutualFunds.FundID;



