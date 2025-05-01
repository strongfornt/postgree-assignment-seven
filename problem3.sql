SELECT name, sum(quantity) as total_orders from customers
JOIN orders on orders.customer_id = customers.id GROUP BY name;