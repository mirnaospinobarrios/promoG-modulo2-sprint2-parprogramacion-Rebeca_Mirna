USE northwind;

-- EJERCICIO 1

SELECT orders.customer_id AS identificador, COUNT(order_details.order_id) AS numpedidos, customers.company_name AS nombre_empresa
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.country = "UK"
GROUP BY company_name;


-- EJERCICIO 2

SELECT customers.company_name AS nombre_empresa,  year(orders.order_date) AS año, SUM(order_details.quantity) AS N_objetos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = "UK"
GROUP BY nombre_empresa, año;

-- EJERCICIO 3

SELECT customers.company_name AS nombre_empresa,  year(orders.order_date) AS año, SUM(order_details.quantity) AS N_objetos, SUM(order_details.unit_price*order_details.quantity*(1-order_details.discount)) AS dinero_tot
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = "UK"
GROUP BY nombre_empresa, año;

-- EJERCICIO 4

SELECT orders.order_id AS identificador, customers.company_name AS nombre_empresa,  orders.order_date AS año
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = "UK"
GROUP BY nombre_empresa, año;






