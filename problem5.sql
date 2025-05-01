SELECT name, sum(quantity) as orders_count
from customers
    join orders on orders.customer_id = customers.id
GROUP BY
    name
HAVING
    SUM(orders.quantity) > 1;