-- ==========================================
-- Intermediate SQL Queries
-- Pizza Sales Analysis
-- ==========================================

-- Q1. Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- ------------------------------------------

-- Q2. Determine the distribution of orders by hour of the day.

vselect hour(order_time) , count(order_id) as total_orders
from orders
group by hour(order_time)
order by total_orders desc;

-- ------------------------------------------

-- Q3. Join relevant tables to find the category-wise distribution of pizzas.

select category, 
count(name) as total_pizzas_in_categories
from pizza_types
group by category 
order by total_pizzas_in_categories desc;

-- ------------------------------------------

-- Q4. Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(quantity),0) from 
(select orders.order_date , sum(orders_details.quantity) as quantity
from orders join orders_details
on orders.order_id = orders_details.order_id 
group by orders.order_date) as orders_per_day;

-- ------------------------------------------

-- Q5. Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name,
sum(orders_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join orders_details 
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3;

SELECT ...
