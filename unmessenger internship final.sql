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

---3. Aggregation and Grouping:---
---3.1. Calculate the total revenue generated by each product category.---
---3.2. Determine the average order value.---
---3.3. Find the month with the highest number of orders.---

SELECT Category, SUM(Price)
FROM Products
GROUP BY Category;

SELECT AVG(Quantity)  AS "AVG order value"
FROM OrderDetails;

SELECT EXTRACT(MONTH FROM OrderDate) AS Month, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY month
ORDER BY OrderCount DESC limit 1;

SELECT EXTRACT(MONTH FROM OrderDate) AS Month, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY month
ORDER BY OrderCount DESC ;

---4. Subqueries and Nested Queries:----
----4.1. Identify customers who have not placed any orders.----
----4.2. Find products that have never been ordered.----
----4.3. Show the top 3 best-selling products.----

SELECT *
FROM Customers
WHERE CustomerID NOT IN (
				SELECT CustomerID
				FROM Orders
                        );
                        
SELECT *
FROM Products 
WHERE ProductID NOT IN (
						SELECT DISTINCT ProductID
                        FROM OrderDetails
                        );

SELECT p.*, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
limit 3;

---5. Date and Time Functions:---
---5.1. List orders placed in the last month.---
---5.2. Determine the oldest customer in terms of membership duration.---\
SELECT * 
FROM Orders
ORDER BY OrderDate DESC limit  2;
---5.1.---unsolved---
SELECT * FROM Orders
WHERE YEAR(OrderDate)=2020 AND MONTH(OrderDate) >= 4;

--5.2 ---
SELECT *
FROM Customers  
ORDER BY JoinDate ASC limit 1;

---6. Advanced Queries:---
---6.1. Rank customers based on their total spending.---
---6.2. Identify the most popular product category.---
---6.3. Calculate the month-over-month growth rate in sales.---
--6.1 unsolved---


--6.2. ---
SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category
ORDER BY ProductCount DESC
LIMIT 1;

---6.3. unsolved---


---7. Data Manipulation and Updates:---
---7.1. Add a new customer to the Customers table.---
---7.2. Update the price of a specific product.---

INSERT INTO Customers ( CustomerID, Name, Email, JoinDate )
VALUES (11, 'Raj Rahul', 'Rajrahul@example.com', '2023-01-07');
SELECT * FROM Customers;

UPDATE Products SET Price = 29.99 WHERE ProductID = 1;
SELECT * FROM Products;









 
 
 
