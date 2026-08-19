-- ============================================
-- SUBQUERIES
-- ============================================


-- 1. Show the transaction(s) having the highest investment amount.

SELECT *
FROM Transactions
WHERE Amount = (
    SELECT MAX(Amount)
    FROM Transactions
);


-- 2. Show the transaction(s) having the lowest investment amount.

SELECT *
FROM Transactions
WHERE Amount = (
    SELECT MIN(Amount)
    FROM Transactions
);


-- 3. Show investors who have made an investment greater than the average transaction amount.

SELECT DISTINCT InvestorID
FROM Transactions
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Transactions
);


-- 4. Show transactions having an amount greater than the average investment amount.

SELECT *
FROM Transactions
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Transactions
);


-- 5. Show mutual funds having a Current NAV greater than the average Current NAV.

SELECT *
FROM MutualFunds
WHERE CurrentNAV > (
    SELECT AVG(CurrentNAV)
    FROM MutualFunds
);


-- 6. Show the mutual fund(s) having the highest Current NAV.

SELECT *
FROM MutualFunds
WHERE CurrentNAV = (
    SELECT MAX(CurrentNAV)
    FROM MutualFunds
);


-- 7. Show the mutual fund(s) having the lowest Current NAV.

SELECT *
FROM MutualFunds
WHERE CurrentNAV = (
    SELECT MIN(CurrentNAV)
    FROM MutualFunds
);


-- 8. Show investors who have made at least one transaction.

SELECT *
FROM Investors
WHERE InvestorID IN (
    SELECT InvestorID
    FROM Transactions
);


-- 9. Show mutual funds in which at least one transaction has been made.

SELECT *
FROM MutualFunds
WHERE FundID IN (
    SELECT FundID
    FROM Transactions
);


-- 10. Show investors who have not made any transaction.

SELECT *
FROM Investors
WHERE InvestorID NOT IN (
    SELECT InvestorID
    FROM Transactions
);