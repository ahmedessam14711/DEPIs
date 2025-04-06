Northwind 2021: SQL Project in Microsoft SQL Server Management Studio
Welcome to the Northwind 2021 project! This repository contains the implementation of a comprehensive database system using SQL in Microsoft SQL Server Management Studio. 
The goal of this project is to create an efficient Customer Relationship Management (CRM) and order-tracking database with five interconnected tables, optimizing data processing and 
analysis performance.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

📂 Project Overview
This project involves designing and creating a relational database for a store’s CRM and inventory management system. The database includes the following key tables:

Orders Table: Records customer orders, identifying which customer placed each order using the CustomerID column.

OrderItem Table: Tracks the items in each order, connecting to the OrderID column from the Orders table to show which products were bought in each order.

Customers Table: Stores customer details, such as contact information and demographics.

Products Table: Records product descriptions, inventory levels, and other details, enabling tracking of available stock.

Suppliers Table: Maintains information about companies supplying products, linked through the SupplierID column.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

📊 Database Relationships
The database is designed with a one-to-many relationship structure for streamlined data management:

Orders Table ↔ Customers Table: Connected via the CustomerID column to identify who placed each order.

OrderItem Table ↔ Orders Table: Linked through the OrderID column to specify items purchased in each order.

OrderItem Table ↔ Products Table: Related using the ProductID column to track which products are included in orders.

Products Table ↔ Suppliers Table: Associated through the SupplierID column to identify the supplier of each product.

⚡ Highlights
Optimized Performance: Reduces data processing per record for faster analysis and efficient resource use.

Enhanced Scalability: Designed for scalability, supporting complex queries and analytics.

Relational Integrity: Ensures accuracy and consistency through well-defined relationships and constraints.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

🎯 Training Focus
As part of this project, we have tasked ourselves with learning and mastering SQL Queries. This includes developing skills to:

Create, modify, and manage tables.

Design efficient queries for data retrieval.

Optimize database performance.

Understand relationships and constraints in relational databases.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

💡 Applications
This database system is ideal for:

Customer order tracking

Inventory management and supplier relationship tracking

Data-driven insights for CRM and product performance
