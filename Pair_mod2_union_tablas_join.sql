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



/*________Ejercicio 5________*/ -- REVISAR

SELECT categories.category_id AS "Categoria_ID", 
	categories.category_name AS "Nombre_caegoria",  
    products.product_name AS "Nombre_producto", 
    SUM((order_details.unit_price * order_details.quantity)*(1-order_details.discount)) AS "Product_Sales"
FROM categories
	INNER JOIN products
	ON categories.category_id = products.category_id
	INNER JOIN order_details
	ON order_details.product_id = products.product_id
	INNER JOIN orders
    ON orders.order_id = order_details.order_id
    GROUP BY  categories.category_id, categories.category_name, products.product_name;
    

/*________Ejercicio 6________*/
SELECT  order_details.order_id AS "ORDER ID", customers.company_name AS "Nombre Empresa", orders.order_date AS "Fecha Pedido"
FROM orders
INNER JOIN order_details
ON order_details.order_id = orders.order_id
INNER JOIN customers
ON orders.customer_id = customers.customer_id
GROUP BY order_details.order_id;


/*_________Ejercicio 7_________*/
SELECT customers.company_name AS "Nombre Empresa", count(order_details.order_id) as "numero de pedidos"
FROM customers
INNER JOIN orders
ON customers.customer_id = ORDERS.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE customers.country = 'UK' 
GROUP BY customers.company_name ;

/*_________Ejercicio 8_________*/
SELECT order_details.order_id AS "Order ID", customers.company_name AS "Nombre Empresa", orders.order_date as "FechaPedido"
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN customers
ON customers.customer_id = ORDERS.customer_id
WHERE customers.country = 'UK' 
GROUP BY order_details.order_id;

/*_________Ejercicio 9_________*/
SELECT EMPLEADO.city AS "C.empleado" ,EMPLEADO.first_name as "N.Empleado", EMPLEADO.last_name as "A.empleado" ,
	JEFE.city AS "C.jefe" , JEFE.first_name as "N.jefe", JEFE.last_name as "A.jefe"
FROM employees AS EMPLEADO, employees AS JEFE
WHERE  EMPLEADO.reports_to = jefe.employee_id;

/*_________Ejercicio 10_________*/
SELECT orders.order_id, customers.company_name, orders.shipped_date
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id
UNION
SELECT orders.order_id, customers.company_name, orders.shipped_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;




