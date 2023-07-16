--Find the highest and lowest priced products along with the prices

SELECT product_name, unit_price
FROM products
WHERE unit_price = (SELECT MAX(unit_price) FROM products)
   OR unit_price = (SELECT MIN(unit_price) FROM products);
   
--find the total number of orders in each month in the year 2022

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS total_orders
FROM orders
WHERE order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY month;

--Find the average unit price and unit cost (2 decimals) for each product category
SELECT product_category, ROUND(AVG(unit_price), 2), ROUND(AVG(unit_cost_95), 2)
FROM products
GROUP BY product_category;

--Find all orders that were placed on or after August 1, 2022
SELECT *
FROM orders
WHERE order_date >= '2022-08-01';


