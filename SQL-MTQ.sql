use dbname;

-- #1
SELECT c.FirstName, c.LastName, c.City,
(SELECT SUM(o.total_price)
FROM online_orders AS o
WHERE o.CustomerID = c.CustomerID) AS total_price 
FROM customers AS c
WHERE c.CustomerID IN (SELECT customerID FROM online_orders);

-- #2
SELECT CustomerID, SUM(Total_Price) AS Total_Amount
FROM (SELECT CustomerID, Total_Price
FROM online_orders
UNION ALL
SELECT CustomerID, Total_Price
FROM orders) Combined_Total
GROUP BY CustomerID;

-- #3
CREATE TABLE All_Orders AS
SELECT *
FROM orders
UNION ALL
SELECT *
FROM online_orders;
SELECT * FROM All_Orders;

-- #4
SELECT OrderID, CustomerID, Total_Price
FROM orders
WHERE order_date BETWEEN '01-01-2023' AND '06-30-2023';