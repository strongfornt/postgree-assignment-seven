SELECT sum(price * quantity) as total_revenue FROM books 
JOIN orders on orders.book_id = books.id;