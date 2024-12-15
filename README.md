# Data Analysis: Sales and Returns

This repository contains an analysis of sales and return data using Excel and SQL. It includes an Excel workbook with raw and computed data and SQL scripts for querying and calculating key metrics.

## Repository Contents

### 1. Excel Workbook: `Processed Workbook.xlsx`
This file contains three sheets:

- **dbo.Sales1**: Sales transaction data, including:
  - `CustomerID`: Unique identifier for customers.
  - `OrderID`: Unique identifier for each order.
  - `Sales`: Transaction amounts.
  - `TransactionDate`: Date of the transaction.

- **dbo.Returns1**: Return transaction data, including:
  - `CustomerID`: Unique identifier for customers.
  - `ReturnDate`: Date of the return.
  - `ReturnSales`: Value of returned items.
  - Computed Metrics: Includes `Return %`, `Net-sales`, and other insights.

- **A Answer**: Analytical insights, including the percentage of sales resulting in a return.

### 2. SQL Script: `SQL Q-A Script.sql`
This script includes:
- Queries to calculate the percentage of sales resulting in returns.
- SQL commands to aggregate data and compute metrics such as:
  - Total sales (`COUNT(DISTINCT OrderID)` from `sales1`).
  - Returned sales (`COUNT(OrderID)` from `returns1`).
  - Return percentage as a ratio of returned sales to total sales.

## Key Analysis
The analysis addresses the following questions:

1. **What percentage of sales result in a return?**
   - This metric is calculated both in Excel and SQL, leveraging pivot tables, formulas, and SQL aggregation functions.

2. **Net sales after accounting for returns:**
   - Computed in the Excel workbook by deducting `ReturnSales` from `Sales`.

## How to Use

1. **Excel Workbook**
   - Open `Processed Workbook.xlsx` to view raw data and computed metrics in respective sheets.
   - Modify the data to explore additional scenarios.

2. **SQL Script**
   - Import the script into a database tool (e.g., MySQL Workbench, SQL Server Management Studio).
   - Ensure the tables `sales1` and `returns1` exist in the schema `newschema`.
   - Run the queries to compute the specified metrics.

## Prerequisites

- **Excel**: Microsoft Excel or equivalent software to open `.xlsx` files.
- **SQL Database**: A compatible database engine (e.g., MySQL, PostgreSQL, SQL Server) to run the provided SQL scripts.

## Future Work
- Enhance data visualization using Python libraries like Matplotlib or Tableau.
- Automate data processing and analysis using Python or R.
- Extend SQL scripts to include advanced insights, such as trends in returns over time.

## License
This project is open-source and available under the MIT License.
