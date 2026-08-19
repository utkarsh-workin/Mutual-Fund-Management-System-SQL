-- ============================================
-- INDEXES
-- ============================================


-- 1. Create an index on investor state.

CREATE INDEX idx_investor_state
ON Investors(State);


-- 2. Create an index on transaction date.

CREATE INDEX idx_transaction_date
ON Transactions(TransactionDate);


-- 3. Create an index on transaction amount.

CREATE INDEX idx_transaction_amount
ON Transactions(Amount);


-- 4. Create an index on mutual fund Current NAV.

CREATE INDEX idx_fund_current_nav
ON MutualFunds(CurrentNAV);


-- ============================================
-- TEST INDEXES
-- ============================================

-- Show indexes on Investors.

SHOW INDEX FROM Investors;


-- Show indexes on Transactions.

SHOW INDEX FROM Transactions;


-- Show indexes on MutualFunds.

SHOW INDEX FROM MutualFunds;