USE NORTHWIND;
/*___________EJERCICIO 1________*/
SELECT MAX(unit_price) AS highestPrice, MIN(unit_price) AS lowestPrice 
FROM products;

/*___________EJERCICIO 2________*/
SELECT avg(unit_price) AS PRECIO_MEDIO, MAX(product_id) AS N_TOTAL
FROM products;

/*___________EJERCICIO 3_________*/

SELECT MIN(freight), MAX(freight)
FROM ORDERS
WHERE ship_country =  'UK'
GROUP BY ship_country;

SELECT MIN(freight), MAX(freight)
FROM ORDERS
GROUP BY ship_country
HAVING ship_country =  'UK';

/*___________EJERCICIO 4_________*/
SELECT AVG(unit_price) AS PRECIO_MEDIO
FROM PRODUCTS;
	/*__ PRECIO MEDIO 28.87__*/
    
SELECT product_name, unit_price
FROM PRODUCTS
WHERE unit_price > 28.87
ORDER BY unit_price desc;

/*___________EJERCICIO 5_________*/
--revisar--
SELECT discontinued
FROM PRODUCTS
GROUP BY discontinued
HAVING discontinued = 1;

/*___________EJERCICIO 6_________*/
SELECT product_id,product_name
FROM PRODUCTS
WHERE discontinued = 0
order by product_id DESC
LIMIT 10;


/*___________EJERCICIO 7_________*/

SELECT employee_id, MAX(freight), COUNT(order_id)
FROM ORDERS
GROUP BY employee_id;

/*___________EJERCICIO 8_________*/
SELECT employee_id, MAX(freight), COUNT(order_id)
FROM ORDERS
WHERE shipped_date > 0
GROUP BY employee_id
ORDER BY employee_id ASC;


/*___________EJERCICIO 9_________*/
SELECT DAY(shipped_date),month(shipped_date),year(shipped_date), count(order_id)
FROM ORDERS
WHERE shipped_date > 0
group by DAY(shipped_date),month(shipped_date),year(shipped_date);

/*___________EJERCICIO 10_________*/
SELECT month(shipped_date),year(shipped_date), count(order_id)
FROM ORDERS
WHERE shipped_date > 0
group by month(shipped_date),year(shipped_date);


/*___________EJERCICIO 11_________*/
SELECT CITY
FROM employees
GROUP BY CITY
HAVING COUNT(CITY) >4;


/*___________EJERCICIO 12_________*/
SELECT order_id, (unit_price*quantity) AS total,
CASE
	WHEN (unit_price*quantity) < 2000 then "Bajo"
    ELSE "Alto"
    END Categoria_pedido
FROM order_details;