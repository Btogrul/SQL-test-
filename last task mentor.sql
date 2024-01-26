CREATE TABLE Books(
    book_id INT PRIMARY KEY,
    title VARCHAR(250),
    author VARCHAR(250),
    price INT,
    stock_quantity INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(250),
    last_name VARCHAR(250),
    email VARCHAR(250)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Books VALUES
(4, 'Naruto', 'Masashi Kishimoto', 21, 90),
(5, 'One Piece', 'Eiichiro Oda',17, 110),
(6, 'Attack on Titan', 'Hajime Isayama', 11, 80),
(7, 'My Hero Academia', 'Kohei Horikoshi', 23, 100),
(8, 'Death Note', 'Tsugumi Ohba', 15, 120);

INSERT INTO Customers VALUES
(3, 'Sakura', 'Haruno', 'sakura.haruno@e.com'),
(4, 'Luffy', 'Monkey D.', 'luffy.monkey@g.com'),
(5, 'Levi', 'Ackerman', 'levi.ackerman@g.com');

INSERT INTO Orders VALUES
(3, 3, '2024-01-22'),
(4, 4, '2024-01-23'),
(5, 5, '2024-01-24');


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT SUM(stock_quantity)  FROM Books;
SELECT
    C.customer_id,
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    COUNT(O.order_id) AS total_orders
FROM Customers C
LEFT JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, customer_name;

SELECT
    O.order_id,
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    B.title AS book_title,
    B.price AS book_price
FROM Orders O
JOIN Customers C ON O.customer_id = C.customer_id
JOIN Books B ON O.order_id = B.book_id;

UPDATE Books SET price =60 WHERE book_id = 1;
UPDATE Orders SET order_date = '2024-01-01' WHERE order_id = 3;
DELETE FROM Orders WHERE customer_id = 4;
DELETE FROM Customers WHERE customer_id = 31;
DELETE FROM Books WHERE book_id = 2;