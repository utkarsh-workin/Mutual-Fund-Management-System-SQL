-- ============================================
-- FINAL BUSINESS QUERIES
-- ============================================


-- 1. Show each investor's name and total investment amount.

SELECT Investors.FullName,
       SUM(Transactions.Amount) AS Total_Investment
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
GROUP BY Investors.FullName;


-- 2. Show each mutual fund and its total investment amount.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName;


-- 3. Show each AMC and the average investment amount in its funds.

SELECT AMC.AMCName,
       AVG(Transactions.Amount) AS Average_Investment
FROM AMC
INNER JOIN MutualFunds
ON AMC.AMCID = MutualFunds.AMCID
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY AMC.AMCName;


-- 4. Show investors whose total investment is greater than 10,000.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
HAVING SUM(Amount) > 10000;


-- 5. Show mutual funds whose total investment is greater than 20,000.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName
HAVING SUM(Transactions.Amount) > 20000;


-- 6. Show the top 5 investors based on total investment.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
ORDER BY Total_Investment DESC
LIMIT 5;


-- 7. Show the top 3 mutual funds based on total investment.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName
ORDER BY Total_Investment DESC
LIMIT 3;


-- 8. Show the investor with the highest total investment.

SELECT Investors.FullName,
       SUM(Transactions.Amount) AS Total_Investment
FROM Investors
INNER JOIN Transactions
ON Investors.InvestorID = Transactions.InvestorID
GROUP BY Investors.InvestorID, Investors.FullName
ORDER BY Total_Investment DESC
LIMIT 1;


-- 9. Show the mutual fund with the highest Current NAV.

SELECT *
FROM MutualFunds
WHERE CurrentNAV = (
    SELECT MAX(CurrentNAV)
    FROM MutualFunds
);


-- 10. Show the total amount invested across all transactions.

SELECT SUM(Amount) AS Total_Investment
FROM Transactions;