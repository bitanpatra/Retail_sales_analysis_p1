# Retail Sales Analysis with SQL Server

## Project Overview

**Project Title**: Retail Sales Analysis
**Level**: Intermediate
**Database**: p1_retail_db

This project is a comprehensive analysis of a retail sales dataset using **SQL Server**. The project goes beyond basic data exploration to solve key business problems and derive actionable insights on sales performance, profitability, and customer behavior. This project demonstrates SQL skills and techniques essential for any data analyst.

## Objectives

1.  **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2.  **Data Cleaning**: Identify and remove any records with missing or null values.
3.  **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4.  **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

-   **Database Creation**: The project starts by creating a database named `p1_retail_db`.
-   **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE p1_retail_db;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

### 2. Data Exploration & Cleaning

