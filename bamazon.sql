DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL UNIQUE,
  product_name VARCHAR(45) NULL,
  department_name VARCHAR(45) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (item_id)
);

USE bamazon;

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (100, "Lighter Fluid", "Outdoor", 12.50, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (101, "Dining Chairs", "Furniture", 10.75, 80);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (202, "Laptops", "Electronics", 1200.00, 120);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (103, "Notebooks", "Home Organization", 9.50, 750);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (204, "iPads", "Electronics", 800.00, 60);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (405, "Black Leggings", "Clothing", 22.50, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (406, "T-shirts", "Clothing", 10.50, 100);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (501, "iPads", "Electronics", 800.00, 60);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (502, "Independence Day", "Movies", 5.00, 40);

INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (503, "Gears of War", "Games", 55.00, 55);

select * from products;

UPDATE products
SET product_name = "Collateral Beauty", department_name = "Movies", price = 8.00, stock_quantity = 90
WHERE item_id = 501;


