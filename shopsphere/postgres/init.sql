CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    created_at DATE
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO customers
(customer_name, email, city, state, created_at)
VALUES
('Ravi Kumar', 'ravi@example.com', 'Bangalore', 'Karnataka', '2026-01-10'),
('Anita Sharma', 'anita@example.com', 'Mysore', 'Karnataka', '2026-02-15'),
('Rahul Singh', 'rahul@example.com', 'Mumbai', 'Maharashtra', '2026-03-20'),
('Priya Patel', 'priya@example.com', 'Ahmedabad', 'Gujarat', '2026-04-05'),
('Arjun Rao', 'arjun@example.com', 'Hyderabad', 'Telangana', '2026-05-12');

INSERT INTO products
(product_name, category, price)
VALUES
('Laptop', 'Electronics', 75000),
('Mouse', 'Electronics', 1200),
('Keyboard', 'Electronics', 2500),
('Office Chair', 'Furniture', 12000),
('Desk', 'Furniture', 18000);

INSERT INTO orders
(customer_id, order_date, status)
VALUES
(1, '2026-08-01', 'Completed'),
(2, '2026-08-02', 'Completed'),
(3, '2026-08-05', 'Completed'),
(1, '2026-08-10', 'Completed'),
(4, '2026-08-15', 'Completed');

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 75000),
(1, 2, 2, 1200),
(2, 3, 1, 2500),
(3, 4, 1, 12000),
(4, 5, 1, 18000),
(5, 1, 1, 75000);
