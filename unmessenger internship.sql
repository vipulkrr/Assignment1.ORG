DROP DATABASE IF EXISTS ORG;
CREATE DATABASE ORG;
USE ORG;
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255),
JoinDate DATE
);
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
Name VARCHAR(255),
Category VARCHAR(255),
Price DECIMAL(10, 2)
);
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
PricePerUnit DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers ( CustomerID, Name, Email, JoinDate )
VALUES ( 1, 'Vipul Roy', 'Vipulroy@example.com', '2020-01-10' ),
	   ( 2, 'Shivam Sinha', 'Shivamsinha@example.com', '2020-01-15' ),
       ( 3, 'Akash Kalp', 'Akashkalp@example.com', '2020-01-25' ),
       ( 4, 'Raj Aryan', 'Rajaryan@example.com', '2020-02-10' ),
       ( 5, 'Jitendra Kuamr', 'Jitendrakumar@example.com', '2020-02-20' ),
       ( 6, 'Dharmedar Singh', 'Dharmendarsingh@example.com', '2020-03-10' ),
       ( 7, 'Pinky Kumari', 'Pinkykumari@example.com', '2020-03-20' ),
       ( 8, 'Uday Yadav', 'Udayyadav@example.com', '2020-03-30' ),
       ( 9, 'Simmi Ydav', 'Simmiyadav@example.com', '2009-11-03' ),
       ( 10, 'Arush Yadav', 'Arushyadav@example.com', '2011-11-29' );

INSERT INTO Products ( ProductID, Name, Category, Price )
VALUES ( 1, 'Lamborghini', 'Automobile', 30000000 ),
	   ( 2, 'Defender', 'Automobile', 8000000 ),
       ( 3, 'AUDI A6', 'Automobile', 7000000 ),
       ( 4, 'Macbook', 'Electronics', 250000 ),
       ( 5, 'House', 'Home', 9000000 ),
       ( 6, 'Villa', 'Home', 20000000 ),
       ( 7, 'Television', 'Electronics', 300000 ),
       ( 8, 'House', 'Home', 7000000 ),
       ( 9, 'Bicyle', 'Sports', 50000 ),
       ( 10, 'Bicyle', 'Sports', 40000 );

INSERT INTO Orders ( OrderID, CustomerID, OrderDate, TotalAmount )
VALUES ( 1, 1, '2020-01-10', 30000000 ),
       ( 2, 2, '2020-01-15', 9000000 ),
       ( 3, 3, '2020-01-25', 7000000 ),
       ( 4, 4, '2020-02-10', 5000000 ),
       ( 5, 5, '2020-02-20', 6000000 ),
       ( 6, 9, '2020-03-10', 40000 ),
       ( 7, 6, '2020-03-20', 7000000 ),
       ( 8, 7, '2020-03-30', 6000000 ),
       ( 9, 8, '2020-04-10', 50000 ),
       ( 10, 10, '2020-04-20', 300000 );
       
INSERT INTO OrderDetails ( OrderDetailID, OrderID, ProductID, Quantity, PricePerUnit)
VALUES ( 1, 1, 1, 1, 30000000 ),
       ( 2, 5, 2, 1, 9000000 ),
       ( 3, 4, 10, 3, 30000 ),
       ( 4, 3, 9, 1, 7000000 ),
       ( 5, 2, 3, 2, 7000000 ),
       ( 6, 10, 8, 5, 50000 ),
       ( 7, 6, 5, 2, 6000000 ),
       ( 8, 9, 4, 5, 100000 ),
       ( 9, 7, 6, 1, 20000000 ),
       ( 10, 8, 7, 1, 8000000 );
















