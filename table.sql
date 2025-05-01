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
    alter COLUMN price TYPE NUMERIC(10,2)


SELECT * from books;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email  VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

ALTER Table customers 
ADD CONSTRAINT email_format_check CHECK (email ~ '^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$');


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date DATE DEFAULT CURRENT_DATE
);

