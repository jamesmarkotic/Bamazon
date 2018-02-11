SELECT * FROM products;

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (1, "Patron", "Liquor", 50, 20),
(2, "Grey Goose", "Liquor", 30, 20),
(3, "Jameson", "Liquor", 30, 50),
(4, "Jack Daniels", "Liquor", 30, 50),
(5, "Dom Perignon", "Champagne", 200, 5),
(6, "Seven Deadly Zins", "Wine", 8, 100),
(7, "Barefoot", "Wine", 3, 200),
(8, "Corkscrew", "Accessory", 2, 300),
(9, "Aerator", "Accessory", 10, 20),
(10, "Napkin", "Liquor", 1, 500);




-- INSERT INTO products (flavor, price, quantity)
-- VALUES ("vanilla", 2.50, 100);
--
-- INSERT INTO products (flavor, price, quantity)
-- VALUES ("chocolate", 3.10, 120);
--
-- INSERT INTO products (flavor, price, quantity)
-- VALUES ("strawberry", 3.25, 75);

-- ### Alternative way to insert more than one row
-- INSERT INTO products (flavor, price, quantity)
-- VALUES ("vanilla", 2.50, 100), ("chocolate", 3.10, 120), ("strawberry", 3.25, 75);
