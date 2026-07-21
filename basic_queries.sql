-- ==========================================
-- Basic SQL Queries
-- Pizza Sales Analysis
-- ==========================================

-- Q1. Retrieve the total number of orders placed.

select count(order_id) as total_orders from orders; 

-- ------------------------------------------

-- Q2. Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id

-- ------------------------------------------

-- Q3. Identify the highest-priced pizza.

SELECT pizza_types.name , pizzas.price
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC LIMIT 1;

-- ------------------------------------------

-- Q4. Identify the most common pizza size ordered.

SELECT quantity , count(order_details_id) 
FROM orders_details GROUP BY quantity;

SELECT 
    pizzas.size,
    COUNT(orders_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- ------------------------------------------

-- Q5. List the top 5 most ordered pizza types along with their quantities.

SELECT pizza_types.name ,
sum(orders_details.quantity) as quantity
FROM pizza_types JOIN pizzas 	
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details
ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quantity DESC LIMIT 5;

SELECT ...
