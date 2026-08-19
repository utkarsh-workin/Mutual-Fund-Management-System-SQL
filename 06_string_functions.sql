-- ============================================
-- STRING FUNCTIONS
-- ============================================

-- 1. Show all investor names in uppercase.

SELECT UPPER(FullName) AS Investor_Name
FROM Investors;

-- 2. Show investor name along with their city.

SELECT CONCAT(FullName, ' - ', City) AS Investor_Details
FROM Investors;

-- 3. Show each investor's name and the number of characters in their name.

SELECT FullName,
       LENGTH(FullName) AS Name_Length
FROM Investors;

-- 4. Replace "Kumar" with "K." in investor names.

SELECT REPLACE(FullName, 'Kumar', 'K.') AS Modified_Name
FROM Investors;

-- 5. Show the first 5 characters of each investor's name.

SELECT FullName,
       SUBSTRING(FullName, 1, 5) AS Name_Prefix
FROM Investors;

-- 6. Show the year of each transaction.

SELECT TransactionID,
       YEAR(TransactionDate) AS Transaction_Year
FROM Transactions;

-- 7. Show the month number of each transaction.

SELECT TransactionID,
       MONTH(TransactionDate) AS Transaction_Month
FROM Transactions;

-- 8. Show the day of each transaction.

SELECT TransactionID,
       DAY(TransactionDate) AS Transaction_Day
FROM Transactions;

-- 9. Show the number of days since each transaction.

SELECT TransactionID,
       DATEDIFF(CURDATE(), TransactionDate) AS Days_Since_Transaction
FROM Transactions;

-- 10. Show each transaction date in DD-MM-YYYY format.

SELECT TransactionID,
       DATE_FORMAT(TransactionDate, '%d-%m-%Y') AS Formatted_Date
FROM Transactions;


