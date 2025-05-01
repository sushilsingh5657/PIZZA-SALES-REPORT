CREATE DATABASE PizzaDB;
USE PizzaDB;
SELECT*FROM pizza_sales;
ALTER TABLE pizza_sales_csv_file
RENAME TO pizza_sales;

-- Que1:- Total Revenue?
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Que2:- Average order value?
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- Que3:- Total Pizzas Sold?
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- Que4:- Total Orders?
SELECT COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales;

-- Que5:- Average Pizzas Per Order?
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Average_Pizzas_Per_Order FROM pizza_sales;

-- Que6:- Daily Trend for Total Orders?
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE order_date IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY FIELD(order_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Q7:- Monthly Trend For Total Orders?
SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY Total_Orders DESC;

-- Q8:- Percentage of sales by pizza category?
SELECT pizza_category,ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS Sales_Percentage
FROM pizza_sales
GROUP BY pizza_category;

-- Que9:- Percentage of sales by pizza size?
SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_Sales,ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS Sales_Percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Sales_Percentage DESC;

-- Q10:- Total pizzas sold by pizza category?
SELECT pizza_category, SUM(quantity) AS Total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;

-- Que11:- Top 5 Best sellers by revenue, total quantity and total orders?
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;

-- Que12:- Bottom 5 Best sellers by revenue, total quantity and total orders?
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;








