CREATE database bank;
USE bank;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    balance DECIMAL(10, 2),
    IsVIP BOOLEAN DEFAULT FALSE
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    interest_rate DECIMAL(5, 2),
    due_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, age, balance) VALUES
(1, 'Alice', 62, 15000.00),
(2, 'Bob', 55, 8500.00),
(3, 'Charlie', 70, 12000.00);

INSERT INTO loans (loan_id, customer_id, interest_rate, due_date) VALUES
(1, 1, 5.00, '2024-08-15'),
(2, 2, 4.50, '2024-09-01'),
(3, 3, 6.00, '2024-08-05');

UPDATE loans
SET interest_rate = interest_rate - 1.00
WHERE customer_id IN (SELECT customer_id FROM customers WHERE age > 60);

UPDATE customers
SET IsVIP = TRUE
WHERE balance > 10000.00;

SELECT 
    c.name, 
    l.due_date, 
    CONCAT('Reminder: Your loan with ID ', l.loan_id, ' is due on ', l.due_date) AS reminder_message
FROM 
    customers c
JOIN 
    loans l ON c.customer_id = l.customer_id
WHERE 
    l.due_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
