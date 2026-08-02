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






     
