-- http://sqlfiddle.com


-- Database creation
CREATE TABLE customers (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE transactions (
  id INTEGER NOT NULL PRIMARY KEY,
  customerId INTEGER,
  amount DECIMAL(15,2) NOT NULL,
  FOREIGN KEY (customerId) REFERENCES customers(id)
);

INSERT INTO customers(id, name) VALUES(1, 'Ding');
INSERT INTO customers(id, name) VALUES(2, 'Joan');
INSERT INTO customers(id, name) VALUES(3, 'Fabien');
INSERT INTO customers(id, name) VALUES(4, 'Simone');

INSERT INTO transactions(id, customerId, amount) VALUES(1, 1, 100);
INSERT INTO transactions(id, customerId, amount) VALUES(2, 2, 150);
INSERT INTO transactions(id, customerId, amount) VALUES(3, 3, 300);
INSERT INTO transactions(id, customerId, amount) VALUES(4, 4, 20);
INSERT INTO transactions(id, customerId, amount) VALUES(5, 1, 50);
INSERT INTO transactions(id, customerId, amount) VALUES(6, 2, 90);
INSERT INTO transactions(id, customerId, amount) VALUES(7, 3, 120);
INSERT INTO transactions(id, customerId, amount) VALUES(8, 2, 10);
INSERT INTO transactions(id, customerId, amount) VALUES(9, 1, 70);
INSERT INTO transactions(id, customerId, amount) VALUES(10, 2, 60);

-- Select all transaction made by customer 'Fabien'
-- Select the total amount spent by each customer
-- Select the customer who has spent the most in total
-- Select all customers who have spent more than 200
