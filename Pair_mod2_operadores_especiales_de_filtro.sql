USE NORTHWIND;

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

/*_______Ejercicio 1_________*/
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'A%' OR city LIKE 'B%';


/*_______Ejercicio 2_________*/
SELECT customers.city, customers.company_name, customers.contact_name, COUNT(orders.order_id)
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE city LIKE 'L%'
GROUP BY customers.city, customers.company_name, customers.contact_name;

/*_______Ejercicio 3________*/
SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE '%sales%';

/*_______Ejercicio 4________*/
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_a%';

/*_______Ejercicio 5________*/
SELECT city, company_name, contact_name, 'Customer' AS 'Relationship'
FROM customers
UNION
SELECT city, company_name, contact_name, 'Supplier' AS 'Relationship'
FROM suppliers;

/*_______Ejercicio 6________*/
SELECT category_name
FROM categories
WHERE `description` LIKE '%Sweet%' OR `description` LIKE '%sweet%';

/*_______Ejercicio 7________*/
SELECT CONCAT(first_name, ' ', last_name)
FROM employees
UNION 
SELECT contact_name
FROM customers;
