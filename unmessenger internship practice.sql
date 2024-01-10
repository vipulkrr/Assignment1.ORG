SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

------1. Basic Queries:-----
------1.1. List all customers.----
------1.2. Show all products in the 'Electronics' category.----
------1.3. Find the total number of orders placed.-------
------1.4. Display the details of the most recent order.-----
SELECT *
FROM Customers;

SELECT Name, Category
FROM Products
WHERE Category = 'Electronics';
 
 SELECT sum(Quantity)
 FROM OrderDetails;
 
 SELECT COUNT(*)
 FROM Orders;
 
 SELECT *
 FROM Orders 
 ORDER BY OrderDate DESC limit 1;
 
 -----2. Joins and Relationships:---
---2.1. List all products along with the names of the customers who ordered them.---
---2.2. Show orders that include more than one product.---
---2.3. Find the total sales amount for each customer.---

SELECT p.Name AS ProductName, c.Name AS CustomerName
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT o.*
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING COUNT(od.ProductID) > 1;

SELECT c.CustomerID, c.Name, SUM(od.Quantity*od.PricePerUnit) AS TotalSales
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.Name;







 
 
 
