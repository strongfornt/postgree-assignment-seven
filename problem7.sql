
--Increase the price of all books published before 2000 by 10%.
UPDATE books SET price = price * 1.10 WHERE published_year < 2000;
