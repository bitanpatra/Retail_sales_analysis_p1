# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `retail_sales`  
**Author**: Bitan Patra

This project demonstrates fundamental SQL skills through comprehensive analysis of retail sales data. The project covers data cleaning, exploratory data analysis, and business intelligence queries essential for data analyst roles, showcasing practical SQL problem-solving capabilities used in real-world business scenarios.

## Objectives

1. **Database Setup & Data Import**: Load and structure retail sales data for analysis
2. **Data Cleaning**: Identify and handle missing values to ensure data quality  
3. **Exploratory Data Analysis**: Understand dataset characteristics and patterns
4. **Business Intelligence**: Answer strategic business questions using SQL queries
5. **Advanced Analytics**: Implement window functions and time-series analysis

## Dataset Information

The dataset contains retail sales transactions with the following structure:

| Column | Data Type | Description |
|--------|-----------|-------------|
| transactions_id | INT | Unique transaction identifier |
| sale_date | DATE | Date of the transaction |
| sale_time | TIME | Time of the transaction |
| customer_id | INT | Unique customer identifier |
| gender | VARCHAR(10) | Customer gender |
| age | INT | Customer age |
| category | VARCHAR(35) | Product category |
| quantity | INT | Quantity of items sold |
| price_per_unit | FLOAT | Price per unit |
| cogs | FLOAT | Cost of goods sold |
| total_sale | FLOAT | Total sale amount |

## Project Structure

### 1. Data Cleaning & Quality Assurance

```sql
-- Comprehensive null value detection
SELECT * FROM retail_sales
WHERE transactions_id IS NULL OR sale_date IS NULL 
   OR sale_time IS NULL OR customer_id IS NULL 
   OR gender IS NULL OR category IS NULL 
   OR quantity IS NULL OR cogs IS NULL 
   OR total_sale IS NULL;

-- Data cleaning - removing incomplete records
DELETE FROM retail_sales WHERE [null conditions];
```

### 2. Exploratory Data Analysis

**Dataset Overview**
```sql
-- Total number of sales transactions
SELECT COUNT(*) as total_sales FROM retail_sales;

-- Number of unique customers
SELECT COUNT(DISTINCT customer_id) as unique_customers FROM retail_sales;
```

**Category Analysis**
```sql
-- Product categories available in dataset
SELECT DISTINCT category FROM retail_sales;
```

## Business Analysis & Key Insights

### Core Business Questions Analyzed:

**Q1. Seasonal Product Performance**
```sql
-- Clothing sales analysis for November 2022 with quantity threshold
SELECT * FROM retail_sales
WHERE category = 'clothing' AND quantity > 3 
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11';
```

**Q2. Category Performance Metrics**
```sql
-- Total sales and transaction volume by category
SELECT category, SUM(total_sale) as net_sales, COUNT(*) as total_orders
FROM retail_sales GROUP BY category;
```

**Q3. Customer Demographics Analysis**
```sql
-- Average customer age by product category
SELECT AVG(age) as avg_age FROM retail_sales WHERE category = 'beauty';
```

**Q4. Gender-Based Purchase Patterns**
```sql
-- Transaction distribution by gender across categories
SELECT category, gender, COUNT(*) as total_transaction
FROM retail_sales GROUP BY category, gender;
```

**Q5. Time-Based Sales Performance**
```sql
-- Best performing month each year using window functions
SELECT Year, Month, Average_Sale FROM (
    SELECT YEAR(sale_date) AS Year, MONTH(sale_date) AS Month,
           AVG(total_sale) AS Average_Sale,
           RANK() OVER (PARTITION BY YEAR(sale_date) 
                       ORDER BY AVG(total_sale) DESC) AS ranking
    FROM retail_sales GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS T1 WHERE ranking = 1;
```

**Q6. Customer Value Analysis**
```sql
-- Top 5 customers by total purchase value
SELECT TOP(5) customer_id, SUM(total_sale) as total_sales
FROM retail_sales GROUP BY customer_id ORDER BY total_sales DESC;
```

**Q7. Customer Diversity by Category**
```sql
-- Unique customer count per product category
SELECT category, COUNT(DISTINCT customer_id) as unique_customer
FROM retail_sales GROUP BY category;
```

**Q8. Profitability Analysis**
```sql
-- Comprehensive profit margin analysis by category
SELECT category, SUM(total_sale) as total_sales, SUM(cogs) as total_cogs,
       SUM(total_sale - cogs) as total_profit,
       SUM(total_sale - cogs) * 100 / NULLIF(SUM(total_sale), 0) as gross_profit_margin
FROM retail_sales GROUP BY category ORDER BY total_profit DESC;
```

**Q9. Cross-Category Customer Behavior**
```sql
-- Customers purchasing across multiple categories
SELECT customer_id, COUNT(DISTINCT category) AS distinct_categories_purchased
FROM retail_sales GROUP BY customer_id 
HAVING COUNT(DISTINCT category) >= 2
ORDER BY distinct_categories_purchased DESC;
```

**Q10. Revenue Trend Analysis**
```sql
-- Month-over-month revenue growth analysis
WITH monthly_sales AS (
    SELECT YEAR(sale_date) AS yr, MONTH(sale_date) AS mn,
           SUM(total_sale) AS revenue
    FROM retail_sales GROUP BY YEAR(sale_date), MONTH(sale_date)
)
SELECT yr, mn, revenue, LAG(revenue) OVER (ORDER BY yr, mn) AS prev_month,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY yr, mn)) 
             / NULLIF(LAG(revenue) OVER (ORDER BY yr, mn), 0), 2) AS pct_change
FROM monthly_sales ORDER BY yr, mn;
```

## Key Findings & Business Insights

- **Customer Segmentation**: Identified high-value customers contributing significantly to total revenue
- **Category Performance**: Beauty and clothing categories show distinct customer demographic patterns
- **Seasonal Trends**: Month-over-month analysis reveals seasonal purchasing patterns
- **Profitability**: Calculated gross profit margins across product categories for strategic decision-making
- **Customer Loyalty**: Analysis of cross-category purchasing behavior indicates customer engagement levels

## Technical Skills Demonstrated

- ✅ **Data Cleaning**: NULL value detection and handling
- ✅ **Aggregate Functions**: SUM, COUNT, AVG operations
- ✅ **Window Functions**: RANK(), LAG() for advanced analytics  
- ✅ **Date Functions**: YEAR(), MONTH(), FORMAT() for time-series analysis
- ✅ **Subqueries & CTEs**: Complex query structuring for multi-step analysis
- ✅ **Conditional Logic**: HAVING, CASE statements for business logic
- ✅ **Data Types**: Working with DATE, TIME, numeric data types

## How to Use This Project

1. **Database Setup**: Create a database and import the retail sales dataset
2. **Run Cleaning Scripts**: Execute data cleaning queries to ensure data quality
3. **Explore the Data**: Use exploratory queries to understand the dataset
4. **Business Analysis**: Run the business intelligence queries to gain insights
5. **Extend Analysis**: Modify queries or create new ones based on your interests

## Project Evolution

This project demonstrates progressive SQL skill development through:
- Comprehensive data cleaning and validation
- Implementation of advanced SQL techniques
- Complex business intelligence analysis  
- Time-series and profitability insights

## Future Enhancements

- [ ] Customer lifetime value analysis
- [ ] Cohort analysis for customer retention
- [ ] Forecasting models using SQL
- [ ] Geographic analysis (if location data available)

## Connect With Me

- **GitHub**: https://github.com/bitanpatra
- **LinkedIn**: www.linkedin.com/in/bitan-patra-data-analyst  
- **Email**: bitanpatra09323@gmail.com

---

*This project demonstrates SQL skills essential for data analyst positions, showcasing data cleaning, business analysis, and advanced query techniques.*
