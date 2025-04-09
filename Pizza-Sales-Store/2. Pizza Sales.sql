CREATE DATABASE pizza_store

use Pizza_store
go 


-- 1. Total Revenue

SELECT CAST(SUM(p.total_price) AS DECIMAL(10,2)) AS 'Total Reveue'
FROM pizza_sales$ p

-- 2. Average Order Value

SELECT (SUM(p.total_price) / COUNT(DISTINCT p.order_id)) AS 'Average Order Value'
FROM pizza_sales$ p 

-- 3. Total Pizzas Sold

SELECT SUM(p.quantity) AS 'Total Pizza Sold'
FROM pizza_sales$ p 

-- 4. Total Orders

SELECT COUNT(DISTINCT p.order_id) AS 'Total Orders'
FROM pizza_sales$ p

-- 5. Average Pizzas Per Order

SELECT CAST((CAST(SUM(P.quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT p.order_id) AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS 'Average Pizzas Per Order'
FROM pizza_sales$ p

-- B. Daily Trend for Total Orders

SELECT DATENAME( WEEKDAY, p.order_date ) as 'Order Day', COUNT(DISTINCT p.order_id) as 'Total Orders'
FROM pizza_sales$ p
GROUP BY DATENAME( dw, p.order_date )

-- C. Hourly Trend for Orders

SELECT DATEPART(HOUR, p.order_time) AS 'Order Time', 
COUNT(DISTINCT p.order_id) AS 'Total Orders'
FROM pizza_sales$ p
GROUP BY DATEPART(HOUR, p.order_time)
ORDER BY DATEPART(HOUR, p.order_time)

-- D. % of Sales by Pizza Category

SELECT p.pizza_category AS 'Pizza Category', 
CAST( (SUM(p.total_price) / (SELECT SUM(p.total_price) FROM pizza_sales$ p)) AS DECIMAL(10,2)) * 100 AS'% of Sales by Pizza Category' 
FROM pizza_sales$ p
GROUP BY p.pizza_category

-- E. % of Sales by Pizza Size

SELECT p.pizza_size AS 'Pizza Size' , 
CAST( (SUM(p.total_price) / (SELECT SUM(p.total_price) FROM pizza_sales$ p) ) AS DECIMAL(10,4)) * 100 AS '% of Sales by Pizza Size'
FROM pizza_sales$ p
GROUP BY p.pizza_size

-- F. Total Pizzas Sold by Pizza Category

SELECT p.pizza_category AS 'Pizza Category',
SUM(p.quantity)
FROM pizza_sales$ p
GROUP BY p.pizza_category

-- G. Top 5 Best Sellers by Total Pizzas Sold

SELECT TOP(5) p.pizza_name AS 'Pizza Name' ,SUM(p.quantity) AS 'Total Pizza Sold'
FROM pizza_sales$ p
GROUP BY p.pizza_name
ORDER BY SUM(p.quantity) DESC

-- H. Bottom 5 Best Sellers by Total Pizzas Sold

SELECT TOP(5) p.pizza_name AS 'Pizza Name' ,SUM(p.quantity) AS 'Total Pizza Sold'
FROM pizza_sales$ p
GROUP BY p.pizza_name
ORDER BY SUM(p.quantity) ASC