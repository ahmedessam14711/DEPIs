-- 1- Display a list of all Customers

SELECT * FROM Customer;

-- 2- For customers who live in Mexico, display a list of their full name and phone

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS FullName, c.Phone
FROM Customer c
WHERE c.Country = 'Mexico'

-- 3- For products with price over 50$, display the product name, package and price after Taxes.
-- Note: taxes = 15%

SELECT p.ProductName, p.Package, (p.UnitPrice + (p.UnitPrice * 0.15)) AS PriceAfterTax
FROM Product p

-- 4- For Suppliers, outside USA and UK, display a list of company name, city and phone

SELECT S.CompanyName, S.City, S.Phone FROM Supplier s WHERE s.Country NOT IN ('USA', 'UK')

-- 5- For Suppliers located in USA, display a list of company name, product name and unitprice sorted Alphabetically

SELECT s.CompanyName, p.ProductName, p.UnitPrice
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
WHERE s.Country = 'USA'
ORDER BY s.CompanyName, p.ProductName

-- 6- For each customer, display a list of full name and how many orders he made and how much he totaly paid

SELECT CONCAT(c.FirstName , ' ',c.LastName) AS FullName,
COUNT(o.Id) AS "Number of orders",
SUM(o.TotalAmount) AS "Total Paid"
FROM Customer c
JOIN Orders o ON c.Id = o.CustomerId
GROUP BY c.Id,CONCAT(c.FirstName , ' ',c.LastName)

-- 7- For Suppliers, who supplied more than 5 products, display company name and how many products it supplied, 
-- sorted by the number of products in descending order

SELECT s.CompanyName, COUNT(*) AS No_of_Products
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
GROUP BY s.CompanyName
ORDER BY COUNT(p.ProductName) DESC

-- 8- Display a top 5 list of the most expensive products

SELECT TOP(5) p.ProductName, p.UnitPrice
FROM Product p
ORDER BY P.UnitPrice DESC

-- 9- Display a list of th top 3 best-selling products

SELECT TOP(3) p.ProductName, SUM(o.Quantity * o.UnitPrice) AS TotalSales
FROM Product p
JOIN OrderItem o ON p.Id = o.ProductId
GROUP BY p.ProductName
ORDER BY SUM(o.Quantity * o.UnitPrice) DESC

-- 10- Display a list of product with prices more than the average price

SELECT p.ProductName, p.UnitPrice AS "Price more than AVG"
FROM Product p
WHERE p.UnitPrice > (SELECT AVG(p.UnitPrice) FROM Product p)

-- 11- Display a list of customers who bought one or more products that mr Horst already bought

SELECT c.FirstName, p.ProductName, COUNT(o.Id) "No of selling"
FROM Customer c
JOIN Orders o ON c.Id = o.CustomerId
JOIN OrderItem oi ON o.Id = oi.OrderId
JOIN Product p ON oi.ProductId = p.Id
WHERE p.ProductName IN (SELECT p.ProductName
							from Customer c
							JOIN Orders o ON c.Id = o.CustomerId
							JOIN OrderItem oi ON o.Id = oi.OrderId
							JOIN Product p ON oi.ProductId = p.Id
							WHERE c.FirstName  = 'Horst') and c.FirstName NOT IN ('Horst')
group by c.FirstName, p.ProductName
HAVING COUNT(o.Id) >=1
ORDER BY COUNT(o.Id), p.ProductName 

