CREATE DATABASE OnlineShop;
USE OnlineShop;
CREATE TABLE Customers(
	CustomerID VARCHAR (10)PRIMARY KEY,
	CustomerName VARCHAR (50)NOT NULL,
	CustomerAddress VARCHAR (100),
	CustomerEmail VARCHAR (50),
);

CREATE TABLE Products(
	ProductID VARCHAR (10)PRIMARY KEY,
	ProductName VARCHAR (50)NOT NULL,
	ProductPrice DECIMAL (10,2) NOT NULL
);

CREATE TABLE Orders(
	OrderID VARCHAR (10)PRIMARY KEY,
	OrderDate DATE NOT NULL,
	CustomerID VARCHAR (10)NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Order_Items(
	OrderID VARCHAR (10)NOT NULL,
	ProductID VARCHAR (10)NOT NULL,
	Quantity INT NOT NULL,
	PRIMARY KEY (OrderID,ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
);
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail)VALUES ('C01','Alice Smith','alice@email.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail)VALUES ('C02','Bob Johnson','bob@email.com');
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail)VALUES ('C03','Charlie Brown','charlie@email.com');

INSERT INTO Products (ProductID, ProductName, ProductPrice)VALUES ('P01','Laptop','1200.00');
INSERT INTO Products (ProductID, ProductName, ProductPrice)VALUES ('P02','Wireless Mouse','25.50');
INSERT INTO Products (ProductID, ProductName, ProductPrice)VALUES ('P03','Mechanical Keyboard','75.00');

INSERT INTO Orders(OrderID, OrderDate, CustomerID)VALUES ('001','2025-01-20','C01');
INSERT INTO Orders(OrderID, OrderDate, CustomerID)VALUES ('002','2025-01-22','C02');

INSERT INTO Order_Items(OrderID, ProductID, Quantity)VALUES ('001','P01',1);
INSERT INTO Order_Items(OrderID, ProductID, Quantity)VALUES ('001','P02',1);
INSERT INTO Order_Items(OrderID, ProductID, Quantity)VALUES ('002','P03',2);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Order_Items;

SELECT ProductName,ProductPrice FROM Products;
SELECT * FROM Products WHERE ProductID='P02';
SELECT * FROM Products WHERE ProductPrice>100.00;
SELECT * FROM Orders ORDER BY OrderDate DESC;
SELECT OrderID, Quantity FROM Order_Items WHERE OrderID = '001';

SELECT DISTINCT CustomerID FROM Customers;

SELECT * FROM Products
WHERE ProductPrice >= 20.00 AND ProductPrice <= 100.00; 

SELECT * FROM Customers
WHERE CustomerName='Alice Smith' OR CustomerName ='Bob Johnson';

SELECT * FROM Orders
WHERE CustomerID IN ('C01','C03');

SELECT * FROM Products
WHERE ProductName NOT IN ('Laptop','Wireless Mouse');

SELECT * FROM Orders
WHERE OrderDate BETWEEN '2025-01-20' AND '2025-01-22';

SELECT * FROM Products
WHERE ProductPrice NOT BETWEEN 50.00 AND 100.00;
