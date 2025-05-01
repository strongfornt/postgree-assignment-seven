-- Active: 1745197382299@@127.0.0.1@5432@bookstore_db

--Find books that are out of stock.
SELECT title from books where stock = 0;