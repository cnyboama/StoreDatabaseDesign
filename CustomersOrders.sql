CREATE DATABASE customersOrders;
USE customersOrders;

-- Customer's challenge --
CREATE TABLE customers (
id INTEGER PRIMARY KEY AUTO_INCREMENT, 
name TEXT, 
email TEXT);

INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");


CREATE TABLE orders (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
customer_id INTEGER,
item TEXT,
price REAL);

INSERT INTO orders (customer_id, item, price) VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price) VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price) VALUES (1, "TARDIS", 1000000.00);


-- Querying our database
SELECT * FROM customers;
SELECT * FROM orders;


-- Selecting name and email of customers with purchased items and corresponding price -
SELECT customers.name AS "Customer Name",
	   customers.email AS "Customer Email", 
       orders.item AS "Iter Ordered", 
       orders.price AS "Item Price"
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id;

SELECT customers.name, 
	   customers.email,
       SUM(orders.price) AS "Total Amount Spent" 
FROM customers
LEFT OUTER JOIN orders
ON customers.id = orders.customer_id
GROUP BY customers.name, customers.email
ORDER BY "Total Amount Spent";