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
```
### 2. Data Exploration & Cleaning

-   **Record Count**: Determine the total number of records in the dataset.
-   **Customer Count**: Find out how many unique customers are in the dataset.
-   **Category Count**: Identify all unique product categories in the dataset.
-   **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
    gender IS NULL OR age IS NULL OR category IS NULL OR
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR
    gender IS NULL OR age IS NULL OR category IS NULL OR
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions and provide actionable insights into the retail sales data.

1.  **Profitability Analysis**: Calculated the total profit and gross margin percentage for each category to identify which products are most profitable.
2.  **Cross-Category Purchase Analysis**: Identified customers who have purchased from at least two different product categories, an indicator of customer loyalty and diversification.
3.  **Sales Performance Analysis**: Used a window function to determine the best-selling month in each year, revealing seasonal sales trends.
4.  **Top Customer Identification**: Found the top 5 customers based on their highest total sales.
5.  **Customer Demographics**: Analyzed customer age and gender to understand purchasing habits.
6.  **Hourly Sales Trends**: Created a query to identify sales trends across different shifts (Morning, Afternoon, Evening).

---

## Key Insights and Findings

* **Profitability is not just about revenue.** By calculating the profit (Revenue - COGS) and gross margin percentage for each category, the analysis revealed that categories with high total sales were not necessarily the most profitable. This highlights the importance of analyzing profit margins.
* **Highly engaged customers exist.** The project successfully identified a group of customers who consistently purchase from multiple categories, demonstrating strong loyalty. These customers could be targeted with specific marketing campaigns.
* **Sales show seasonal trends.** The analysis revealed that sales performance peaks during certain months of the year, which can inform future marketing and inventory decisions.
