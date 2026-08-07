-- ============================================
-- ORDER BY & LIMIT Queries
-- ============================================

-- 1. Show all investors in ascending order of name.

SELECT *
FROM Investors
ORDER BY FullName ASC;


-- 2. Show all investors in descending order of name.

SELECT *
FROM Investors
ORDER BY FullName DESC;


-- 3. Show all mutual funds in ascending order of Current NAV.

SELECT *
FROM MutualFunds
ORDER BY CurrentNAV ASC;


-- 4. Show all mutual funds in descending order of Current NAV.

SELECT *
FROM MutualFunds
ORDER BY CurrentNAV DESC;


-- 5. Show top 3 mutual funds having the highest Current NAV.

SELECT *
FROM MutualFunds
ORDER BY CurrentNAV DESC
LIMIT 3;


-- 6. Show all transactions sorted by highest investment amount.

SELECT *
FROM Transactions
ORDER BY Amount DESC;


-- 7. Show all investors sorted alphabetically by city.

SELECT *
FROM Investors
ORDER BY City ASC;


-- 8. Show each investor's total investment in descending order.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
ORDER BY Total_Investment DESC;


-- 9. Show top 3 investors based on total investment.

SELECT InvestorID,
       SUM(Amount) AS Total_Investment
FROM Transactions
GROUP BY InvestorID
ORDER BY Total_Investment DESC
LIMIT 3;


-- 10. Show top 3 mutual funds based on total investment.

SELECT MutualFunds.FundName,
       SUM(Transactions.Amount) AS Total_Investment
FROM MutualFunds
INNER JOIN Transactions
ON MutualFunds.FundID = Transactions.FundID
GROUP BY MutualFunds.FundName
ORDER BY Total_Investment DESC
LIMIT 3;