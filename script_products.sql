USE botecoseuze;
CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    in_stock INT NOT NULL
);

INSERT INTO products (name, price, in_stock) VALUES ("Coca-cola", 7.5, 10);

INSERT INTO products (name, price, in_stock) VALUES ("Frango a passarinho", 25.5, 30);