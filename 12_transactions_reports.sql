-- ============================================
-- TRANSACTION & ANALYTICAL REPORTS
-- ============================================


-- 1. Show total investment across all transactions.

SELECT SUM(Amount) AS Total_Investment
FROM Transactions;


-- 2. Show the average investment amount.

SELECT AVG(Amount) AS Average_Investment
FROM Transactions;


-- 3. Show the highest investment amount.

SELECT MAX(Amount) AS Highest_Investment
FROM Transactions;


-- 4. Show the lowest investment amount.

SELECT MIN(Amount) AS Lowest_Investment
FROM Transactions;


-- 5. Show the total number of transactions.

SELECT COUNT(TransactionID) AS Total_Transactions
FROM Transactions;


-- 6. Show total investment and transaction count for each investor.

SELECT InvestorID,
       COUNT(TransactionID) AS Transaction_Count,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
ORDER BY Total_Investment DESC;


-- 7. Show total investment and transaction count for each mutual fund.

SELECT FundID,
       COUNT(TransactionID) AS Transaction_Count,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY FundID
ORDER BY Total_Investment DESC;


-- 8. Show total investment for each transaction type.

SELECT TransactionType,
       COUNT(TransactionID) AS Transaction_Count,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY TransactionType
ORDER BY Total_Investment DESC;


-- 9. Show each investor's name, transaction count,
-- and total investment.

SELECT Investors.FullName,
       COUNT(Transactions.TransactionID) AS Transaction_Count,
       SUM(Transactions.Amount) AS Total_Investment
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
GROUP BY Investors.InvestorID, Investors.FullName
ORDER BY Total_Investment DESC;


-- 10. Show each mutual fund's name,
-- transaction count, and total investment.

SELECT MutualFunds.FundName,
       COUNT(Transactions.TransactionID) AS Transaction_Count,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundID, MutualFunds.FundName
ORDER BY Total_Investment DESC;


-- 11. Show each AMC's total investment.

SELECT AMC.AMCName,
       SUM(Transactions.Amount) AS Total_Investment
FROM AMC
INNER JOIN MutualFunds
ON AMC.AMCID = MutualFunds.AMCID
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY AMC.AMCID, AMC.AMCName
ORDER BY Total_Investment DESC;


-- 12. Show each fund category's total investment.

SELECT FundCategory.CategoryName,
       SUM(Transactions.Amount) AS Total_Investment
FROM FundCategory
INNER JOIN MutualFunds
ON FundCategory.CategoryID = MutualFunds.CategoryID
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY FundCategory.CategoryID, FundCategory.CategoryName
ORDER BY Total_Investment DESC;