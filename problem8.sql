-- Active: 1745197382299@@127.0.0.1@5432@bookstore_db

--Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);

