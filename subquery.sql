CREATE TABLE products (
  product_id int,
  product_name VARCHAR(250),
  price int
);

CREATE TABLE trancasction (
  trancasction_id SERIAL,
  customer_id int,
  amount int
);

CREATE TABLE sales (
  sale_id SERIAL,
  customer_id int,
  product VARCHAR(255),
  quantity int,
  price_per_unit FLOAT,
  sale_date TIMESTAMP
);

INSERT INTO products (product_id, product_name, price) VALUES 
(1,'Laptop',1000),
(2,'Mouse',50),
(3,'Keyboard',200);

SELECT product_id, product_name, price
FROM  products
WHERE price > (
    SELECT AVG(price)
    FROM products 
)
-- SELECT MAX(price) 
-- FROM products;

-- Correlated Subquery
INSERT INTO trancasction (customer_id, amount) VALUES 
(101,500),
(101,300),
(102,150);

SELECT t1.customer_id, t1.amount
FROM  trancasction t1
WHERE amount > (
    SELECT AVG(amount)
    FROM trancasction t2
    WHERE t1.customer_id = t2.customer_id
);

SELECT * FROM trancasction;


INSERT INTO sales (customer_id, product, quantity, price_per_unit, sale_date) VALUES 
(101,'Keyboard',2,25.00,'2024-04-01'),
(102,'Mouse',1,15.00,'2024-04-01'),
(101,'Monitor',1,200.00,'2024-04-02'),
(103,'Keyboard',1,25.00,'2024-04-02'),
(101,'Mouse',3,15.00,'2024-04-03');

WITH recap AS (
    SELECT customer_id, product, quantity * price_per_unit AS total_price
    FROM sales 
    WHERE product = 'Keyboard'
)
SELECT customer_id, product, total_price
FROM recap
WHERE total_price > 30;


WITH recap2 AS (
    SELECT customer_id, product, count(quantity) AS total_price
    FROM sales 
    GROUP BY customer_id, product
    HAVING count(quantity) = 1
)
SELECT customer_id, product, total_price
FROM recap2

SELECT * FROM sales;


WITH recap AS (
    SELECT customer_id, product, SUM(quantity) AS jumlah_product, SUM(quantity * price_per_unit) AS total_price
    FROM sales 
    GROUP BY customer_id, product
)
SELECT customer_id, product, jumlah_product, total_price
FROM recap
WHERE jumlah_product > 1;


