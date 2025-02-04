--1.	Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name
--(No data Provided for Supplier)

--2.	Display the employee details whose joined at first
SELECT * FROM Employees ORDER BY JoiningDate;

--3.	Display the employee details whose joined at recently
SELECT * FROM Employees ORDER BY JoiningDate DESC;

--4.	Write a query to get most expense and least expensive Product list (name and unit price).
WITH cte AS (SELECT MAX(UnitPrice) AS max_price, MIN(UnitPrice) AS min_price FROM Product)
SELECT ProductName, UnitPrice FROM Product
WHERE UnitPrice IN ((SELECT max_price FROM cte), (SELECT min_price FROM cte))
ORDER BY UnitPrice DESC;

--5.	Display the list of products that are out of stock
SELECT * FROM Product
WHERE isDiscontinued = 1;

--6.	Display the list of products whose unitinstock is less than unitonorder
--(No data Regarding unit in stock is provided)

--7.	Display list of categories and suppliers who supply products within those categories
--(No data For Supplier is provided)

--8.	Display complete list of customers, the OrderID and date of any orders they have made
SELECT Customer.*, [Order].Id, [Order].OrderDate
FROM Customer Join [Order]
ON Customer.Id = [Order].CustomerId;

--9.	Write  query that determines the customer who has placed the maximum number of orders
WITH cte AS (SELECT CustomerId, Count(*) as c FROM [Order] GROUP BY CustomerId)
SELECT * FROM Customer WHERE Id IN (
SELECT CustomerId FROM cte WHERE c = (
SELECT MAX(c) FROM cte));

--10.	Display the customerid whose name has substring �RA�
SELECT Id FROM Customer
WHERE FirstName+' '+LastName LIKE '%RA%';

--11.	Display the first letter of all the customer name
SELECT SUBSTRING(FirstName, 1, 1) AS FirstLetter
FROM Customer ORDER BY Id;