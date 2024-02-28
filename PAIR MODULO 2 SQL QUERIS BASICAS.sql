USE northwind;
/*__________Ejercicio 4 __________*/
SELECT `first_name`, `last_name`, `employee_id`
FROM `employees`;

/*__________Ejercicio 5 __________*/
SELECT product_name, unit_price
FROM products
WHERE unit_price < 5;

/*__________Ejercicio 6 __________*/
SELECT product_name, unit_price
FROM products
WHERE unit_price IS NULL;

/*__________Ejercicio 7 __________*/
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price < 15 AND product_id < 10;

/*__________Ejercicio 8 __________*/
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price  > 15 AND product_id > 10;

/*__________Ejercicio 9 __________*/
SELECT DISTINCT ship_country
FROM orders;

/*__________Ejercicio 10 __________*/
SELECT product_id, product_name,unit_price
FROM products
LIMIT 10;

/*__________Ejercicio 11 __________*/
SELECT product_id, product_name,unit_price
FROM products
ORDER BY  product_id DESC
LIMIT 10;

/*__________Ejercicio 12 __________*/
SELECT count(DISTINCT order_id)
FROM order_details;

/*__________Ejercicio 13 __________*/
SELECT  unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 3;
 
/*__________Ejercicio 14 __________*/ 
SELECT  order_id, unit_price * quantity  AS importe_total
	FROM order_details
	ORDER BY importe_total DESC
	LIMIT 5 OFFSET 5;
    
/*__________Ejercicio 15__________*/     
SELECT category_name AS "nombre de categoria"
FROM categories;

/*__________Ejercicio 16__________*/     
SELECT date_add(shipped_date, INTERVAL 5 DAY) AS FechaRetrasada
FROM orders;

/*__________Ejercicio 17__________*/ 
SELECT product_id,product_name
FROM products
WHERE unit_price BETWEEN  15 AND 50;

/*__________Ejercicio 18__________*/ 

SELECT product_id,product_name,unit_price
FROM products
WHERE unit_price IN(18,19,20)
    
    


