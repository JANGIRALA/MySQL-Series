Create database Super_Market;
use Super_Market;
# Create the table to reflect the Super_Market firm in SQL workbench:

# 1. MySQL Query to Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity INT
);

-- Inserting Values
INSERT INTO Products (ProductID, ProductName, Price, Quantity)
VALUES
    (1, 'Milk', 2.5, 100),
    (2, 'Bread', 1.2, 150),
    (3, 'Eggs', 1.0, 200),
    (4, 'Cheese', 3.0, 50),
    (5, 'Apple', 0.8, 120),
    (6, 'Pasta', 2.0, 80),
    (7, 'Chicken', 5.0, 30),
    (8, 'Rice', 1.5, 90),
    (9, 'Yogurt', 1.8, 70),
    (10, 'Orange', 1.2, 100);

# 2. MySQL Query to Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- Inserting Values
INSERT INTO Customers (CustomerID, CustomerName, Address, ContactNumber)
VALUES
    (101, 'John Doe', '123 Main St', '555-1234'),
    (102, 'Jane Smith', '456 Oak St', '555-5678'),
    (103, 'Alice Brown', '789 Pine St', '555-9876'),
    (104, 'Bob Johnson', '101 Elm St', '555-4321'),
    (105, 'Emma White', '202 Maple St', '555-8765'),
    (106, 'James Black', '303 Birch St', '555-2109'),
    (107, 'Sarah Grey', '404 Cedar St', '555-6543'),
    (108, 'Chris Lee', '505 Pine St', '555-1098'),
    (109, 'Olivia Green', '606 Oak St', '555-5432'),
    (110, 'Daniel Taylor', '707 Elm St', '555-9876');
    
# 3. MySQL Query to Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (501, 101, '2024-02-16', 8.7),
    (502, 102, '2024-02-17', 2.4),
    (503, 103, '2024-02-18', 15.2),
    (504, 104, '2024-02-19', 6.5),
    (505, 105, '2024-02-20', 12.0),
    (506, 106, '2024-02-21', 9.8),
    (507, 107, '2024-02-22', 5.3),
    (508, 108, '2024-02-23', 7.2),
    (509, 109, '2024-02-24', 11.5),
    (510, 110, '2024-02-25', 4.6);
    
# 4. MySQL Query to Create OrderDetails Table
CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES
    (1001, 501, 1, 2, 5.0),
    (1002, 501, 2, 3, 3.6),
    (1003, 502, 3, 1, 1.0),
    (1004, 503, 4, 4, 12.0),
    (1005, 503, 5, 2, 1.6),
    (1006, 504, 6, 1, 2.0),
    (1007, 505, 7, 3, 15.0),
    (1008, 506, 8, 2, 3.0),
    (1009, 507, 9, 2, 3.6),
    (1010, 508, 10, 3, 3.6);

# Check whether the data is read correctly or not. See the tables.
# View all products:
SELECT * FROM Products;
# View all customers:
SELECT * FROM Customers;
# View all orders:
SELECT * FROM Orders;
# View all order details:
SELECT * FROM OrderDetails;

# Q1 : List all products and their prices:
SELECT ProductName, Price FROM Products;

# Q2 : Get products with a price greater than $2.00:
SELECT ProductID, ProductName, Price FROM Products
WHERE Price > 2.00;

# Q3 : Find the product with the highest price:
SELECT ProductID, ProductName, Price FROM Products
ORDER BY Price DESC LIMIT 1;

# Q4 : Count the total number of products:
SELECT COUNT(*) AS TotalProducts FROM Products;

# Q5 : Increase the quantity of all products by 10:
UPDATE Products
SET Quantity = Quantity + 10;

# Queries on the Customers Table
# Q6 : Retrieve all customers:
SELECT * FROM Customers;

# Q7 : Get customer names and their contact numbers:
SELECT CustomerName, ContactNumber FROM Customers;

# Q8 : Find customers whose names start with 'J':
SELECT * FROM Customers
WHERE CustomerName LIKE 'J%';

# Q9 : Count the total number of customers:
SELECT COUNT(*) AS TotalCustomers FROM Customers;

# Q10: Update the address of a specific customer (e.g., CustomerID = 102):
UPDATE Customers
SET Address = '789 Updated St'
WHERE CustomerID = 102;

select * from customers;

#  Queries on the Orders Table
# Q11: Get orders placed after February 20, 2024:
SELECT * FROM Orders
WHERE OrderDate > '2024-02-20';

# Q12: Find the total number of orders:
SELECT COUNT(*) AS TotalOrders FROM Orders;

# Q13: Retrieve orders with a total amount greater than $10.00:
SELECT OrderID, CustomerID, TotalAmount FROM Orders
WHERE TotalAmount > 10.00;

# Q14: Delete an order with OrderID = 510:
DELETE FROM Orders
WHERE OrderID = 510;

select * from orders;

# Queries on the OrderDetails Table
# Q15: Get order details where the quantity is more than 2:
SELECT * FROM OrderDetails
WHERE Quantity > 2;

# Q16: Find the total quantity ordered for each product:
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID;

# Q17: Retrieve order details for a specific OrderID (e.g., 501):
SELECT * FROM OrderDetails
WHERE OrderID = 501;

# Q18: Calculate the total sales (Subtotal sum) for each OrderID:
SELECT OrderID, SUM(Subtotal) AS TotalSales
FROM OrderDetails
GROUP BY OrderID;

# Queries Joining the Tables
# Q19: Get customer names and their order dates:
SELECT C.CustomerName, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

# Q20: Retrieve products ordered with their order IDs and customer names:
SELECT OD.OrderID, P.ProductName, C.CustomerName
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN Customers C ON O.CustomerID = C.CustomerID;

# Q21: Find total amount spent by each customer:
SELECT C.CustomerID, C.CustomerName, SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName;

# Q22: Get the details of orders with products' names and quantities ordered:
SELECT O.OrderID, P.ProductName, OD.Quantity
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID;

# Q23: List customers who ordered more than one type of product:
SELECT C.CustomerID, C.CustomerName, COUNT(DISTINCT OD.ProductID) AS ProductTypesOrdered
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(DISTINCT OD.ProductID) > 1;

# Q24: Get a list of customers who placed orders with their order information:
SELECT C.CustomerID, C.CustomerName, O.OrderID, O.OrderDate, O.TotalAmount
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

# Q25: Find orders placed in February 2024:
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2024-02-01' AND '2024-02-29';

# Q26: Retrieve product details for each order (including quantity and subtotal):
SELECT OD.OrderID, OD.ProductID, P.ProductName, OD.Quantity, OD.Subtotal
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID;

# Q27: Calculate total quantity of each product in orders:
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS TotalOrdered
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName;

# Q28: Retrieve all customer details who have placed orders:
SELECT DISTINCT C.CustomerID, C.CustomerName, C.Address, C.ContactNumber
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

# Q29: Total amount spent by each customer:
SELECT C.CustomerID, C.CustomerName, SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName;

# Q30: Retrieve order details along with the product names for each order:
SELECT O.OrderID, O.OrderDate, C.CustomerName, P.ProductName, OD.Quantity, OD.Subtotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Customers C ON O.CustomerID = C.CustomerID;

# Q31: Get the total quantity of each product sold:
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS TotalQuantitySold
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName;

# Q32: Find the customer who spent the most:
SELECT C.CustomerID, C.CustomerName, SUM(O.TotalAmount) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
#WHERE O.TotalAmount > 10
GROUP BY C.CustomerID, C.CustomerName 
ORDER BY TotalSpent desc
LIMIT 1;

# Q33: Retrieve orders with total amount greater than 10:
SELECT O.OrderID, C.CustomerName, O.OrderDate, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
WHERE O.TotalAmount > 10;

# Q34: Find products with a remaining stock less than 50 units:
SELECT ProductID, ProductName, Quantity
FROM Products
WHERE Quantity <50;

select * from customers;
# Q35: Get order details for a specific customer (e.g., CustomerID = 101):
SELECT O.CustomerID, O.OrderID, O.OrderDate, OD.ProductID, P.ProductName, OD.Quantity, OD.Subtotal
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE O.CustomerID = 101;

# Q36: Get customer information and their last order date:
SELECT c.CustomerName, c.Address, MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName, c.Address;

select * from orderdetails;
# Q37: Calculate the total sales per product:
SELECT p.ProductName, SUM(od.Subtotal) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductID, p.ProductName;

# Q38: List the total amount spent by each customer:
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

# Q39: Get the total quantity ordered of each product:
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;

# Q40: Retrieve all orders with their respective customer and product details:
SELECT o.OrderID, c.CustomerName, o.OrderDate, p.ProductName, od.Quantity, od.Subtotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

# Q41: Find the top 3 customers by total spending:
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 3;

# Q42: Get the most frequently ordered product:
SELECT p.ProductName, SUM(od.Quantity) AS TotalOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalOrdered DESC
LIMIT 1;

# Q43: List orders where the total amount is greater than $10:
SELECT o.OrderID, c.CustomerName, o.OrderDate, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 10;

# Q44: Find customers who ordered more than a specific quantity of a particular product (e.g., "Milk" with quantity > 2):
SELECT c.CustomerName, od.Quantity, p.ProductName
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Milk' AND od.Quantity > 2;

# Q45: Get all customers who have placed at least one order:
SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

# Q46: Find the total number of products sold:
SELECT SUM(od.Quantity) AS TotalProductsSold
FROM OrderDetails od;

# Q47: Retrieve orders with more than one product:
SELECT o.OrderID, COUNT(od.DetailID) AS ProductCount
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING ProductCount > 1;

# Q48: Get the customer who spent the highest total amount:
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 1;

# Q49: Calculate average price of all products:
SELECT AVG(Price) AS AveragePrice FROM Products;

# Q50: List customers with no orders:
SELECT c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

# Q51: Find orders placed within the last 30 days:
SELECT * FROM Orders
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

# Q52: Get the total value of all orders:
SELECT SUM(TotalAmount) AS TotalOrderValue FROM Orders;

# Q53: Get the quantity of 'Rice' sold:
SELECT SUM(od.Quantity) AS QuantitySold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Rice';

# Q54: List orders with total amount between $5 and $15:
SELECT * FROM Orders
WHERE TotalAmount BETWEEN 5 AND 15;

# Q55: Find the top 2 products by total quantity sold:
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID
ORDER BY TotalQuantity DESC
LIMIT 2;

# Q56: Retrieve the total number of customers from each city:
SELECT Address, COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Address;

# Q57: Find orders where the subtotal of any product exceeds $10:
SELECT o.OrderID, od.Subtotal
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE od.Subtotal > 10;

# Q58: Get the highest priced product:
SELECT ProductName, Price FROM Products
ORDER BY Price DESC
LIMIT 1;

# Q59: Find the average order value:
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

# Q60: Retrieve orders containing 'Cheese':
SELECT o.OrderID, c.CustomerName
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE p.ProductName = 'Cheese';

# Q61: Find customers who have placed more than 2 orders:
SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING OrderCount > 2;

# Q62: Calculate the total revenue generated by 'Pasta':
SELECT SUM(od.Subtotal) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Pasta';

# Q63: Find customers whose orders have an average total amount above $7:
SELECT c.CustomerName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING AvgOrderValue > 7;

# Q64: Retrieve the most recent order for each customer:
SELECT c.CustomerName, MAX(o.OrderDate) AS RecentOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# Q65: Get all customer names and their order IDs:
SELECT c.CustomerName, o.OrderID
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

# Q66: Retrieve all orders with customer names and total order amount:
SELECT c.CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

# Q67: List all products purchased by a customer:
SELECT c.CustomerName, p.ProductName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

# Q68: Find the total number of orders for each customer:
SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# Q69: Get the total revenue generated per customer:
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# Q70: Calculate the quantity of each product sold:
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID;

# Q71: Retrieve the most popular product based on total quantity sold:
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 1;

# Q72: Find customers who have not made any orders:
SELECT c.CustomerName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

# Q73: Get the average order value per customer:
SELECT c.CustomerName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# Q74: List orders containing the product 'Bread':
SELECT o.OrderID, c.CustomerName
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE p.ProductName = 'Bread';

# Q75: Retrieve customers who have placed more than three orders:
SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING OrderCount > 3;

# Q76: Get orders with more than two products:
SELECT o.OrderID, COUNT(od.DetailID) AS ProductCount
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING ProductCount > 2;

# Q77: Calculate total revenue for 'Milk' product:
SELECT SUM(od.Subtotal) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Milk';

# Q78: List customers with orders in the last 7 days:
SELECT DISTINCT c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);

# Q79: Get the total number of products sold per order:
SELECT o.OrderID, SUM(od.Quantity) AS TotalProductsSold
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;

# Q80: Retrieve orders where the total amount exceeds $100:
SELECT o.OrderID, o.TotalAmount, c.CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 100;

# Q81: Get all customers and their most recent order date:
SELECT c.CustomerName, MAX(o.OrderDate) AS RecentOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

# Q82: Find orders containing more than one type of product:
SELECT o.OrderID
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING COUNT(DISTINCT od.ProductID) > 1;

# Q83: Retrieve the highest-priced product bought by a customer:
SELECT c.CustomerName, p.ProductName, MAX(p.Price) AS HighestPrice
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID;

# Q84: Calculate the total order value for each product:
SELECT p.ProductName, SUM(od.Subtotal) AS TotalOrderValue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID;

# Q85: Create a view for customer orders with total order amounts:
CREATE VIEW CustomerOrderSummary AS
SELECT c.CustomerID, c.CustomerName, o.OrderID, SUM(od.Quantity * od.UnitPrice) AS TotalOrderAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName, o.OrderID;

# Q86: Select all data from the view created in query 85:
SELECT * FROM CustomerOrderSummary;

# Q87: Create a view for product sales summary:
CREATE VIEW ProductSalesSummary AS
SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantitySold, SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

# Q88: Retrieve the top 5 products based on total sales revenue from the view:
SELECT * FROM ProductSalesSummary
ORDER BY TotalRevenue DESC
LIMIT 5;

# Q89: Create a view for customers who have placed orders within the last month:
CREATE VIEW RecentCustomers AS
SELECT DISTINCT c.CustomerID, c.CustomerName, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

# Q90: Select customers from the recent customers view:
SELECT * FROM RecentCustomers;

# Q91: Create a view that filters out products with zero stock:
CREATE VIEW AvailableProducts AS
SELECT ProductID, ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock > 0;

# Q92: Count the number of available products using the view:
SELECT COUNT(*) AS AvailableProductCount FROM AvailableProducts;

# Q93: Create a view combining orders with their customer and product details:
CREATE VIEW OrderDetailsView AS
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity, od.UnitPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

# Q94: Get the total number of orders for each customer using the view:
SELECT CustomerName, COUNT(OrderID) AS TotalOrders
FROM OrderDetailsView
GROUP BY CustomerName;
