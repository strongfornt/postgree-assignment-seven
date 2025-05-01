-- Active: 1745197382299@@127.0.0.1@5432@bookstore_db

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price INT CHECK (price >= 0),
    stock INT DEFAULT 0,
    published_year INT
);

ALTER table books 
    alter COLUMN price TYPE NUMERIC(10,2);


INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30, 8, 2014),
('Refactoring', 'Martin Fowler', 50, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);



SELECT * from books;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email  VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

ALTER Table customers 
ADD CONSTRAINT email_format_check CHECK (email ~ '^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$');


INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');

Drop TABLE customers;
SELECT * from customers;


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');

SELECT * from orders;

