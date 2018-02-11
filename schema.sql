DROP DATABASE IF EXISTS Bamazon;
CREATE database Bamazon;

USE Bamazon;

CREATE TABLE products (
  item_id INT(15) NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price INT(10) NOT NULL,
  stock_quantity INT(10) NOT NULL,
  PRIMARY KEY (item_id)
);

SELECT * FROM products;




-- CREATE TABLE products (
--   id INT NOT NULL AUTO_INCREMENT,
--   flavor VARCHAR(45) NULL,
--   price DECIMAL(10,2) NULL,
--   quantity INT NULL,
--   PRIMARY KEY (id)
-- );
--
--
