-- Answering the questions

-- 1. How have the orders changed overtime (monthly)?

SELECT to_char(order_date,'Month, YYYY') AS month_year,
       COUNT(*) total_orders
FROM delivery de
GROUP BY month_year
ORDER BY month_year
/*LIMIT 3*/

-- 2. Are there any weekly flunctuations in the size of orders?

SELECT extract(week from order_date) AS weeks, 
       count(*) order_size
FROM delivery de
GROUP BY weeks
ORDER BY weeks;

/* From the results of the above query,
we could see that orders placed changes on a weekly basis.
Hence, there is a flunctuation in the size of weekly orders.*/

-- 3.  What is the average number of orders placed by day of the week?

SELECT to_char (order_date, 'Day') AS day_of_week,
       ROUND(avg(count), 2) avg_orders
FROM (
    SELECT
        order_date,
        count(*)
    FROM delivery de
    GROUP BY order_date) order_counts
GROUP BY day_of_week
ORDER BY avg_orders;

-- 4.  What is the hour of the day with the highest number of orders?

SELECT COUNT(order_id) AS num_orders, order_hour_of_day
FROM orders
GROUP BY order_hour_of_day
ORDER BY num_orders DESC
LIMIT 1;

-- 5. Which department has the highest average spend per customer?

SELECT d.department, CEILING(AVG(pr.unit_price)) AS avg_spend_per_customer
FROM departments d
JOIN products p ON d.department_id = p.department_id
JOIN price pr ON pr.product_id = p.product_id
GROUP BY d.department
ORDER BY avg_spend_per_customer DESC
LIMIT 1;

-- 6. Which product generated more profit?

SELECT p.product_id,
	   p.product_name,
	   (unit_price - unit_cost) AS profit
FROM products p
JOIN price pr ON p.product_id = pr.product_id 
GROUP BY 1, 2, 3
ORDER BY profit DESC
LIMIT 1;

-- 7. What are the 3 aisles with the most orders, and which departments do those orders belong to?

SELECT a.aisle,
	   COUNT(o.order_id) AS num_order,
	   d.department
FROM orders o
JOIN products p USING (product_id)
JOIN aisle a USING (aisle_id) 
JOIN departments d USING (department_id)
GROUP BY a.aisle, d.department_id
ORDER BY num_order DESC
LIMIT 3;

-- 8. Which 3 users generated the highest revenue and how many aisles did they order from?   

SELECT o.user_id,
	   SUM( pr.unit_price - pr.unit_cost) AS Revenue,
	   COUNT(p.aisle_id) AS num_aisle_order
FROM orders o
JOIN products p USING (product_id)
JOIN price pr USING (product_id) 
GROUP BY o.user_id
ORDER BY Revenue DESC
LIMIT 3;
