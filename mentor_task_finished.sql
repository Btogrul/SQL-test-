CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT,
    quantity INT
);

INSERT INTO products VALUES
                         (1,'new skin',5, 10),
                         (2,'battle pass',10, 100),
                         (3,'game pass', 20, 5),
                         (4,'new dlc', 6, 50),
                         (5,'version 2 ', 3, 40);


DELETE FROM products WHERE product_id =5;

UPDATE products SET quantity = 41 WHERE product_id = 2;

SELECT * FROM products;

SELECT AVG(price) FROM products;

SELECT MIN(price) FROM products;

SELECT product_name, price FROM products WHERE price = (SELECT MAX(price) FROM products) ;
