-- Retail sales analysis --


-- Data cleaning --
-- Identify null values--
select
    *
from
    retail_sales
where
    transactions_id is null
    or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or category is null
    or quantity is null
    or cogs is null
    or total_sale is null;

-- Delete null values --
delete from retail_sales
where
    transactions_id is null
    or sale_date is null
    or sale_time is null
    or customer_id is null
    or gender is null
    or category is null
    or quantity is null
    or cogs is null
    or total_sale is null;

-- Data Exploration --

-- No of Sales --
select
    count(*) as total_sales
from
    retail_sales
    -- No of unique customers --
select
    count(distinct customer_id)
from
    retail_sales;

-- Data anlysis & Business problems --
-- Q1. Retrive all transactions where category is 'clothing' and quantity sold is more than 3 in the month of november 2022 --
SELECT
    *
FROM
    retail_sales
WHERE
    category = 'clothing'
    AND quantity > 3
    AND FORMAT (sale_date, 'yyyy-MM') = '2022-11';

-- Q2. Total sales for each category --
select
    category,
    sum(total_sale) as net_sales,
    count(*) as total_orders
from
    retail_sales
group by
    category;

-- Q3. Find average age of customers who purchased item from 'Beauty' category --
select
    avg(age) as avg_age
from
    retail_sales
where
    category = 'beauty';

-- Q4. Find total number of trasactions made by each gender in each category --
select
    category,
    gender,
    count(*) as total_transaction
from
    retail_sales
group by
    category,
    gender;

-- Q5. Calculate the average sale for each month, find out best selling month in each year. --
SELECT
    Year,
    Month,
    Average_Sale
FROM
    (
        SELECT
            YEAR (sale_date) AS Year,
            MONTH (sale_date) AS Month,
            AVG(total_sale) AS Average_Sale,
            RANK() OVER (
                PARTITION BY
                    YEAR (sale_date)
                ORDER BY
                    AVG(total_sale) DESC
            ) AS ranking
        FROM
            retail_sales
        GROUP BY
            YEAR (sale_date),
            MONTH (sale_date)
    ) AS T1
WHERE
    ranking = 1;

-- Q6. Find the top 5 customers based on highest total sales. --
select
    top (5) customer_id,
    sum(total_sale) as total_sales
from
    retail_sales
group by
    customer_id
order by
    total_sales desc
    -- Q7. Find the number of unique customer who purchased the item from each category. --
select
    category,
    count(distinct customer_id) as unique_customer
from
    retail_sales
group by
    category;

-- Q8. Calculate the total profit and gross margin percentage for each product category. --
select
    category,
    sum(total_sale) as total_sales,
    sum(cogs) as total_cogs,
    sum(total_sale - cogs) as total_profit,
    sum(total_sale - cogs) * 100 / nullif(sum(total_sale), 0) as gross_profit_margin
from
    retail_sales
group by
    category
order by
    total_profit desc;

-- Q9. Identify customers who have bought products from at least two different categories.--
SELECT
    customer_id,
    COUNT(DISTINCT category) AS distinct_categories_purchased
FROM
    retail_sales
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT category) >= 2
ORDER BY
    distinct_categories_purchased DESC;

-- End of project --
