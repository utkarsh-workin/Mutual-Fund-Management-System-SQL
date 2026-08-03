CREATE DATABASE MUTUALFUNDDB;

USE MUTUALFUNDDB;
DROP DATABASE MUTUALFUNDDB;
SHOW TABLES;

CREATE TABLE INVESTORS(
InvestorID INT PRIMARY KEY,
FullName VARCHAR(50),
Email VARCHAR(50) UNIQUE NOT NULL,
PhoneNumber VARCHAR(50) UNIQUE,
PANNumber VARCHAR(50) UNIQUE NOT NULL,
DateofBirth DATE,
City VARCHAR(50),
State VARCHAR(50),
RegistrationDate DATE
);

SELECT * 
FROM INVESTORS;

INSERT INTO INVESTORS
(InvestorID, FullName, Email, PhoneNumber, PANNumber, DateofBirth, City, State, RegistrationDate)
VALUES
(1001, 'Kumar Utkarsh', 'utkarsh@gmail.com', '9123195802', 'ABCDE1234F', '2004-10-23', 'Jamshedpur', 'Jharkhand', '2026-08-03'),

(1002, 'Rahul Sharma', 'rahul@gmail.com', '9876543211', 'BCDEF2345G', '1998-05-15', 'Delhi', 'Delhi', '2026-08-03'),

(1003, 'Aman Verma', 'aman@gmail.com', '9876543212', 'CDEFG3456H', '1999-08-20', 'Lucknow', 'Uttar Pradesh', '2026-08-03'),

(1004, 'Priya Singh', 'priya@gmail.com', '9876543213', 'DEFGH4567J', '2000-01-10', 'Mumbai', 'Maharashtra', '2026-08-03'),

(1005, 'Sneha Gupta', 'sneha@gmail.com', '9876543214', 'EFGHI5678K', '1997-03-25', 'Kolkata', 'West Bengal', '2026-08-03'),

(1006, 'Rohit Kumar', 'rohit@gmail.com', '9876543215', 'FGHIJ6789L', '1996-11-05', 'Patna', 'Bihar', '2026-08-03'),

(1007, 'Anjali Mishra', 'anjali@gmail.com', '9876543216', 'GHIJK7890M', '2001-06-18', 'Bhopal', 'Madhya Pradesh', '2026-08-03'),

(1008, 'Keshav Anand', 'keshav@gmail.com', '9876543217', 'HIJKL8901N', '2002-12-12', 'Kanpur', 'Uttar Pradesh', '2026-08-03'),

(1009, 'Vivek Sinha', 'vivek@gmail.com', '9876543218', 'IJKLM9012P', '1995-09-30', 'Ranchi', 'Jharkhand', '2026-08-03'),

(1010, 'Neha Kapoor', 'neha@gmail.com', '9876543219', 'JKLMN0123Q', '1999-04-08', 'Chandigarh', 'Chandigarh', '2026-08-03');

CREATE TABLE AMC(
AMCID BIGINT PRIMARY KEY,
AMCName VARCHAR(50),
Headquarters VARCHAR(50),
FoundedYear INT,
Website VARCHAR(50)
);

SELECT * 
FROM AMC;

INSERT INTO AMC(AMCID, AMCName, Headquarters, FoundedYear, Website)
VALUES
(101, 'SBI Mutual Fund', 'Mumbai', 1987, 'sbimf.com'),
(102, 'HDFC Mutual Fund', 'Mumbai', 1999, 'hdfcfund.com'),
(103, 'ICICI Prudential Mutual Fund', 'Mumbai', 1993, 'icicipruamc.com'),
(104, 'Nippon India Mutual Fund', 'Mumbai', 1995, 'nipponindiamf.com'),
(105, 'Axis Mutual Fund', 'Mumbai', 2009, 'axismf.com');

CREATE TABLE FUNDCATEGORY(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50) UNIQUE,
RiskLevel VARCHAR(50),
Description VARCHAR(50)
);

SELECT * 
FROM FUNDCATEGORY;

INSERT INTO FundCategory
(CategoryID, CategoryName, RiskLevel, Description)
VALUES
(1,'Equity','High','Invests mainly in stocks'),
(2,'Debt','Low','Invests in fixed income securities'),
(3,'Hybrid','Medium','Mix of equity and debt'),
(4,'Index','Medium','Tracks a market index'),
(5,'ELSS','High','Tax saving mutual fund');

CREATE TABLE MUTUALFUNDS(
FundID BIGINT PRIMARY KEY,
FundName VARCHAR(50) NOT NULL,
AMCID BIGINT,
CategoryID INT,
LaunchDate DATE,
MinimumInvestment INT,
ExpenseRatio DECIMAL(5,2),
ExitLoad DECIMAL(5,2),
CurrentNAV DECIMAL(10,2),

CONSTRAINT AMCID_FK
FOREIGN KEY (AMCID)
REFERENCES AMC(AMCID),

CONSTRAINT CATEGORYID_FK
FOREIGN KEY (CATEGORYID)
REFERENCES FUNDCATEGORY(CATEGORYID)
);

SELECT * 
FROM MUTUALFUNDS;

INSERT INTO MUTUALFUNDS
(FundID, FundName, AMCID, CategoryID, LaunchDate, MinimumInvestment, ExpenseRatio, ExitLoad, CurrentNAV)
VALUES
(2001, 'SBI Bluechip Fund', 101, 1, '2010-02-14', 500, 0.85, 1.00, 95.45),

(2002, 'SBI Small Cap Fund', 101, 1, '2009-09-15', 500, 0.95, 1.00, 178.60),

(2003, 'HDFC Flexi Cap Fund', 102, 1, '1995-01-01', 100, 0.80, 1.00, 1456.20),

(2004, 'ICICI Prudential Bluechip Fund', 103, 1, '2008-05-19', 100, 0.89, 1.00, 112.75),

(2005, 'Nippon India Large Cap Fund', 104, 1, '2007-08-08', 500, 0.90, 1.00, 82.30),

(2006, 'Axis ELSS Tax Saver Fund', 105, 5, '2009-12-29', 500, 0.74, 0.00, 68.45),

(2007, 'HDFC Corporate Bond Fund', 102, 2, '2002-03-10', 1000, 0.55, 0.00, 34.60),

(2008, 'ICICI Prudential Balanced Advantage Fund', 103, 3, '2006-12-30', 1000, 0.72, 1.00, 58.95),

(2009, 'Nippon India Index Fund', 104, 4, '2019-04-01', 100, 0.30, 0.00, 24.50),

(2010, 'Axis Hybrid Fund', 105, 3, '2012-11-20', 500, 0.68, 1.00, 41.80);

CREATE TABLE TRANSACTIONS(
TransactionID BIGINT,
InvestorID INT,
FundID BIGINT,
-- TransactionType ENUM('BUY','SELL','SIP')
TransactionType VARCHAR(20)
CHECK (TransactionType IN ('BUY', 'SELL', 'SIP')), 
Amount DECIMAL(10,2),
UnitsPurchased DECIMAL(12,2),
NAVAtTransaction DECIMAL(10,2),
TransactionDate DATE,

CONSTRAINT INVESTORID_FK
FOREIGN KEY (INVESTORID)
REFERENCES INVESTORS(INVESTORID),

CONSTRAINT FUNDID_FK
FOREIGN KEY (FUNDID)
REFERENCES MUTUALFUNDS(FUNDID)
);

SELECT * 
FROM TRANSACTIONS;

INSERT INTO TRANSACTIONS
(TransactionID, InvestorID, FundID, TransactionType, Amount, UnitsPurchased, NAVAtTransaction, TransactionDate)
VALUES
(3001,1001,2001,'BUY',5000,52.38,95.45,'2026-08-03'),

(3002,1002,2003,'BUY',10000,6.87,1456.20,'2026-08-03'),

(3003,1003,2006,'BUY',3000,43.83,68.45,'2026-08-03'),

(3004,1004,2008,'BUY',15000,254.45,58.95,'2026-08-03'),

(3005,1005,2002,'BUY',8000,44.79,178.60,'2026-08-03'),

(3006,1006,2005,'BUY',6000,72.90,82.30,'2026-08-03'),

(3007,1007,2007,'BUY',12000,346.82,34.60,'2026-08-03'),

(3008,1008,2004,'BUY',10000,88.69,112.75,'2026-08-03'),

(3009,1009,2009,'BUY',5000,204.08,24.50,'2026-08-03'),

(3010,1010,2010,'BUY',7000,167.46,41.80,'2026-08-03');






     
