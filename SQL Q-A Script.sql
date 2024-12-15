-- Q1. What % of sales result in a return?
SELECT COUNT(DISTINCT OrderID) AS total_sales
FROM newschema.sales1;

-- Calculate the total number of unique sales that resulted in a return
SELECT COUNT(OrderID) AS returned_sales
FROM newschema.returns1;

-- Calculate the percentage of sales that resulted in a return
SELECT
    (returned_sales.total_returned_sales / sales.total_sales) * 100 AS percentage_sales_return
FROM
    (SELECT COUNT(DISTINCT OrderID) AS total_sales
     FROM newschema.sales1) AS sales,
    (SELECT COUNT(DISTINCT OrderID) AS total_returned_sales
     FROM newschema.returns1) AS returned_sales;

SELECT 
    (SELECT COUNT(DISTINCT OrderID) FROM newschema.returns1) * 100 / 
    (SELECT COUNT(DISTINCT OrderID) FROM newschema.sales1) AS Return_Rate;

---------------------------------------------------------------------------------------------------------------------------
-- Q2. What % of returns are full returns?
SELECT
    R.OrderID,
    R.ReturnSales,
    S.Sales AS OriginalSales
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

SELECT
    (SUM(CASE WHEN R.ReturnSales = S.Sales THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_full_returns
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

---------------------------------------------------------------------------------------------------------------------------
-- Q3. What is the average return % amount (return % of original sale)?
SELECT
    R.OrderID,
    R.ReturnSales,
    S.Sales AS OriginalSales
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

SELECT
    AVG(R.ReturnSales / S.Sales) AS average_return_percentage
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

---------------------------------------------------------------------------------------------------------------------------
-- Q4. What % of returns occur within 7 days of the original sale?
SELECT
    R.OrderID,
    R.ReturnDate,
    S.TransactionDate
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

SELECT
    COUNT(*) AS total_returns,
    SUM(CASE WHEN DATEDIFF(R.ReturnDate, S.TransactionDate) <= 7 THEN 1 ELSE 0 END) AS returns_within_7_days
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

SELECT
    (returns_within_7_days / total_returns) * 100 AS percentage_returns_within_7_days
FROM
    (SELECT
        COUNT(*) AS total_returns,
        SUM(CASE WHEN DATEDIFF(R.ReturnDate, S.TransactionDate) <= 7 THEN 1 ELSE 0 END) AS returns_within_7_days
    FROM
        newschema.sales1 R
    JOIN
        newschema.returns1 S ON R.OrderID = S.OrderID) AS ReturnStats;

---------------------------------------------------------------------------------------------------------------------------
-- Q5. What is the average number of days for a return to occur?
SELECT
    R.OrderID,
    R.ReturnDate,
    S.TransactionDate
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

SELECT
    AVG(DATEDIFF(R.ReturnDate, S.TransactionDate)) AS average_days_to_return
FROM
    newschema.sales1 R
JOIN
    newschema.returns1 S ON R.OrderID = S.OrderID;

---------------------------------------------------------------------------------------------------------------------------
-- Q6. Using this data set, how would you approach and answer the question, who is our most valuable customer?
SELECT
    distinct CustomerID, Sales
FROM
    newschema.returns1
ORDER BY
    Sales DESC
LIMIT 1;
