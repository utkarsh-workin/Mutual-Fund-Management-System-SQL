/*
==========================================
Project : Mutual Fund Management System
File    : 02_basic_queries.sql

Author  : Kumar Utkarsh

Description:
This file contains basic SQL queries
such as SELECT, WHERE, LIKE,
ORDER BY, UPDATE, DELETE, LIMIT,
and ALIAS.
==========================================
*/

-- Show all investors.

SELECT *
FROM Investors;

-- Show Investor Name and Email.

SELECT FullName, Email
FROM Investors;

-- Show all mutual funds.

SELECT *
FROM MutualFunds;

-- Show Fund Name and Current NAV.

SELECT FundName, CurrentNAV
FROM MutualFunds;

/*
==========================================
WHERE Clause
==========================================
*/

-- Show all investors from Jharkhand.

SELECT *
FROM Investors
WHERE State = 'Jharkhand';

-- Show all investors from Uttar Pradesh.

SELECT *
FROM Investors
WHERE State = 'Uttar Pradesh';

-- Show mutual funds with Current NAV greater than 100.

SELECT *
FROM MutualFunds
WHERE CurrentNAV > 100;

-- Show investors registered after 2026-08-01.

SELECT * 
FROM Investors
WHERE RegistrationDate > 2026-08-01;

-- Show investors from Jharkhand who registered after 2026-08-01.

SELECT *
FROM Investors
WHERE State = 'Jharkhand'
AND RegistrationDate > '2026-08-01';

-- Show investors from Jharkhand or Uttar Pradesh.

SELECT *
FROM Investors
WHERE State = 'Jharkhand'
OR State = 'Uttar Pradesh';

-- Show investors who are not from Jharkhand.

SELECT *
FROM Investors
WHERE NOT State = 'Jharkhand';

-- Show investors whose names start with 'A'.

SELECT *
FROM Investors
WHERE FullName LIKE 'A%';

-- Show investors whose names end with 'Kumar'.

SELECT *
FROM Investors
WHERE FullName LIKE '%Kumar';

-- Show investors whose names contain 'Raj'.

SELECT *
FROM Investors
WHERE FullName LIKE '%Raj%';

-- Show investors whose city starts with 'J'.

SELECT *
FROM Investors
WHERE City LIKE 'J%';


/*
==========================================
ORDER BY Clause
==========================================
*/

-- Show all investors in alphabetical order.

SELECT *
FROM Investors
ORDER BY FullName ASC;

-- Show mutual funds by highest Current NAV.

SELECT *
FROM MutualFunds
ORDER BY CurrentNAV DESC;

-- Show latest registered investors.

SELECT *
FROM Investors
ORDER BY RegistrationDate DESC;


/*
==========================================
LIMIT Clause
==========================================
*/

-- Show the first 5 investors.

SELECT *
FROM Investors
LIMIT 5;

-- Show the first 3 mutual funds.

SELECT *
FROM MutualFunds
LIMIT 3;

-- Show the top 3 mutual funds with the highest Current NAV.

SELECT *
FROM MutualFunds
ORDER BY CurrentNAV DESC
LIMIT 3;


-- Show the latest 5 registered investors.

SELECT *
FROM Investors
ORDER BY RegistrationDate DESC
LIMIT 5;

/*
==========================================
ALIAS Clause
==========================================
*/

-- Display investor name and email with custom column names.

SELECT
    FullName AS Investor_Name,
    Email AS Email_ID
FROM Investors;

-- Display mutual fund name and NAV with custom column names.

SELECT
    FundName AS Mutual_Fund,
    CurrentNAV AS NAV
FROM MutualFunds;

-- Note:
-- Execute UPDATE and DELETE queries carefully.
-- These queries modify the existing data.

/*
==========================================
UPDATE Clause
==========================================
*/


-- Update the city of Rahul Sharma to Noida.

UPDATE Investors
SET City = 'Noida'
WHERE InvestorID = 1002;

-- Update the email of Kumar Utkarsh.

UPDATE Investors
SET Email = 'utkarsh.work@gmail.com'
WHERE InvestorID = 1001;

-- Update the city and state of InvestorID 1005.

UPDATE Investors
SET City = 'Ranchi',
    State = 'Jharkhand'
WHERE InvestorID = 1005;

-- Increase the Current NAV of all mutual funds by 5.

UPDATE MutualFunds
SET CurrentNAV = CurrentNAV + 5;

/*
==========================================
DELETE Clause
==========================================
*/

-- Delete an investor with InvestorID 1010.

DELETE FROM Investors
WHERE InvestorID = 1010;


-- Delete a transaction with TransactionID 3005.

DELETE FROM Transactions
WHERE TransactionID = 3005;

-- Delete mutual funds with Current NAV less than 50.

DELETE FROM MutualFunds
WHERE CurrentNAV < 50;