USE northwind;
SELECT `first_name`, `last_name`, `employee_id`
FROM `employees`;

SELECT product_name, unit_price
FROM products
WHERE unit_price < 5;

SELECT product_name, unit_price
FROM products
WHERE unit_price IS NULL;

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price < 15 AND product_id < 10;

SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price  > 15 AND product_id > 10;

SELECT DISTINCT ship_country
FROM orders;

SELECT product_id, product_name,unit_price
FROM products
LIMIT 10;

SELECT product_id, product_name,unit_price
FROM products
ORDER BY  product_id DESC
LIMIT 10;

SELECT DISTINCT order_id
FROM order_details;

SELECT  unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 3;
    
SELECT  order_id, unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 5 OFFSET 5;


