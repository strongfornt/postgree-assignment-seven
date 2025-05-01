
--Retrieve the most expensive book in the store.
SELECT * from books where price = (SELECT max(price) from books);