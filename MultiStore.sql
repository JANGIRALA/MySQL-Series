Create database Employee_Logistic;
use Employee_Logistic;
# Create the table to reflect the multistore firm in SQL workbench:
CREATE TABLE Stores (
  Serial_No INT PRIMARY KEY,
  Store_Name VARCHAR(50),
  Store_Location VARCHAR(50),
  No_Of_Employees INT,
  Yearly_Turnover DECIMAL(10, 2)
);

show tables;

INSERT INTO Stores (Serial_No, Store_Name, Store_Location, No_Of_Employees, Yearly_Turnover)
VALUES
  (1, 'Store1',  'Delhi1', 11, 3.00),
  (2, 'Store2', 'Delhi2', 6, 4.00),
  (3, 'Store3', 'Delhi3', 14, 10.00),
  (4, 'Store4', 'Delhi4', 13, 2.00),
  (5, 'Store5', 'Delhi5', 11, 3.00),
  (6, 'Store6', 'Delhi1', 12, 6.00),
  (7, 'Store7', 'Delhi2', 6, 3.00),
  (8, 'Store8', 'Delhi3', 11, 6.00),
  (9, 'Store9', 'Delhi4', 7, 2.00),
  (10, 'Store10', 'Delhi5', 7, 3.00),
  (11, 'Store11', 'Delhi1', 15, 9.00),
  (12, 'Store12', 'Delhi2', 15, 10.00),
  (13, 'Store13', 'Delhi3', 6, 9.00),
  (14, 'Store14', 'Delhi4', 12, 5.00),
  (15, 'Store15', 'Delhi5', 6, 2.00),
  (16, 'Store16', 'Delhi1', 10, 2.00),
  (17, 'Store17', 'Delhi2', 7, 10.00),
  (18, 'Store18', 'Delhi3', 10, 4.00),
  (19, 'Store19', 'Delhi4', 8, 7.00),
  (20, 'Store20', 'Delhi5', 11, 4.00);

# 2. Write SQL query to display stores in descending order of number of employees:

SELECT * FROM Stores
ORDER BY No_Of_Employees DESC;

# 3. Write a query to display stores based on annual turnover in ascending order:

SELECT * FROM Stores
ORDER BY Yearly_Turnover ASC;

# 4. Write queries to display stores with “employees<10”:

SELECT * FROM Stores
WHERE No_Of_Employees <10;

# 5. Write a query to display stores “per employee annual turnover” and name this column as appropriate :

SELECT *, Yearly_Turnover / No_Of_Employees AS Per_Employee_Turnover
FROM Stores;

# 6. Write a query to display stores that are located to “Delhi_3”:

SELECT * FROM Stores
WHERE Store_Location = 'Delhi3';

# 7. Write a query to display store that have highest employee and highest turnover in “Delhi_5”:
SELECT * FROM Stores
where Store_Location = 'Delhi5'
ORDER BY No_Of_Employees DESC, Yearly_Turnover DESC
Limit 1;

# 8. Write a query to display location wise annual turnover (of all stores):
SELECT Store_Location, SUM(Yearly_Turnover) as Location_Wise_Turnover 
FROM Stores 
GROUP BY Store_Location ;

# 9. Write a query to display the total number of employees across all stores:
SELECT SUM(No_Of_Employees) as Total_Employees FROM Stores;

# 10. Write a query to display the average yearly turnover for all stores:
SELECT Avg(Yearly_Turnover) as Average_Turnover FROM Stores;

# 11. Write a query to display the store with the lowest yearly turnover:
SELECT * FROM Stores
ORDER BY Yearly_Turnover ASC
LIMIT 1 ;

# 12. Write a query to display the stores with yearly turnover greater than the average yearly turnover:
SELECT * FROM Stores 
WHERE Yearly_Turnover > (SELECT AVG(Yearly_Turnover) FROM Stores) ;

# 13. Write a query to display the stores with an even number of employees:
SELECT * FROM Stores 
WHERE (No_Of_Employees % 2 = 0) ;

# 14. Write a query to display the stores with yearly turnover between 2 and 5 crores:
SELECT * FROM Stores 
WHERE (Yearly_Turnover >= 2 AND Yearly_Turnover <= 5) ;

# 15. Write a query to display the location-wise count of stores:
SELECT Store_Location, Count(*) as Location_Wise_Store_Count FROM Stores 
GROUP BY Store_Location  ;


