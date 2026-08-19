# Mutual Fund Management System - SQL & Excel

A SQL and Excel-based Mutual Fund Management System designed to manage investors, mutual funds, AMCs, fund categories, investment transactions, and business-oriented analysis.

## Project Overview

This project demonstrates the design and implementation of a relational database for a Mutual Fund Management System and extends the SQL data into an Excel-based analytical dashboard.

The project covers database creation, table relationships, data manipulation, analytical queries, joins, subqueries, views, indexes, stored procedures, transaction reports, Excel analysis, PivotTables, charts, and a final dashboard.

## Project Highlights

- Relational database design for mutual fund management
- Investor, AMC, fund category, mutual fund, and transaction data
- Analytical SQL queries and business reports
- Views, indexes, and stored procedures
- Excel-based KPI analysis
- Investor-wise, fund-wise, AMC-wise, category-wise, and transaction analysis
- PivotTables and PivotCharts
- Investment charts
- Final Mutual Fund Management Dashboard

## Database Structure

The project contains the following main tables:

- **Investors** - Stores investor information.
- **AMC** - Stores Asset Management Company details.
- **FundCategory** - Stores mutual fund categories and risk levels.
- **MutualFunds** - Stores mutual fund details such as NAV, expense ratio, and AMC/category relationships.
- **Transactions** - Stores investment transactions made by investors.

## SQL Concepts Covered

- Database and table creation
- Primary Keys and Foreign Keys
- Constraints
- INSERT, UPDATE and DELETE
- SELECT and filtering
- WHERE, LIKE and DISTINCT
- ORDER BY and LIMIT
- GROUP BY and HAVING
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Aggregate Functions
- String Functions
- Date Functions
- Subqueries
- Views
- Indexes
- Stored Procedures
- Analytical and business queries

## Excel Analysis

The SQL data is also analyzed in:

**`Mutual_Fund_Management_Analysis.xlsx`**

The workbook includes:

- KPI Analysis
- Investor Analysis
- Fund Analysis
- AMC Analysis
- Category Analysis
- Transaction Analysis
- Investment percentage and investor ranking
- PivotTables
- PivotCharts
- Investment charts
- Final Mutual Fund Management Dashboard

### Key Dashboard Metrics

- **Total Investors:** 10
- **Total Mutual Funds:** 10
- **Total Transactions:** 10
- **Total Investment:** ₹81,000
- **Average Investment:** ₹8,100
- **Highest Investment:** ₹15,000

## Excel Concepts Covered

- Excel Tables
- Aggregate formulas
- SUM, AVERAGE, MAX, COUNTA
- SUMIF and COUNTIF
- VLOOKUP
- Helper columns
- KPI reporting
- Percentage calculations
- Ranking
- PivotTables
- PivotCharts
- Dashboard design

## Tools & Technologies

- **MySQL** - Database design and SQL analysis
- **Microsoft Excel** - Data analysis and dashboard
- **Git & GitHub** - Version control

## Project Files

```text
Mutual-Fund-Management-System-SQL/
│
├── 01_database_and_tables.sql
├── 02_basic_queries.sql
├── 03_joins.sql
├── 04_groupby_having.sql
├── 05_orderby_limit.sql
├── 06_string_functions.sql
├── 07_subqueries.sql
├── 08_final_queries.sql
├── 09_views.sql
├── 10_indexes.sql
├── 11_stored_procedures.sql
├── 12_transactions_reports.sql
├── Mutual_Fund_Management_Analysis.xlsx
├── README.md
└── .gitignore