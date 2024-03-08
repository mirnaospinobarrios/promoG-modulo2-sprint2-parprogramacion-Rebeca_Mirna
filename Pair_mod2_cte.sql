USE northwind;

/*______Ejercicio 1_____*/

WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid , CompanyName
FROM CUSTOMER_CTE;


/*______Ejercicio 2_____*/
WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers
          WHERE country = 'Germany')
          
SELECT Custid , CompanyName
FROM CUSTOMER_CTE;

/*______Ejercicio 3_____*/

WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid, CompanyName, order_id, order_date
FROM orders
INNER JOIN CUSTOMER_CTE
	ON CUSTOMER_CTE.Custid = orders.customer_id;
    
    
 /*______Ejercicio 4____*/   
 WITH CUSTOMER_CTE AS 
		(SELECT customer_id AS 'Custid', company_name AS 'CompanyName'
		  FROM customers)
          
SELECT Custid, CompanyName, COUNT(order_id)
FROM orders
INNER JOIN CUSTOMER_CTE
	ON CUSTOMER_CTE.Custid = orders.customer_id
group by customer_id;


 /*______Ejercicio 5____*/   
WITH producto_CTE  AS 
					(SELECT product_id AS ID_PROD, product_name as PRODUCTO
					 FROM products)

SELECT producto_CTE.PRODUCTO, AVG(quantity) AS Total
FROM order_details
INNER JOIN producto_CTE
ON order_details.product_id = producto_CTE.ID_PROD
GROUP BY  product_id                
    

 /*______Ejercicio 6____*/ 
 
 WITH CATEGORIA_CTE  AS 
					(SELECT category_id as id_categoria, category_name as nombre_categoria
					FROM categories)
                    
SELECT CATEGORIA_CTE.nombre_categoria AS CATEGORIA, category_id, MAX(unit_price) AS MAXIMO, min(unit_price) AS MINIMO, AVG(unit_price) AS MINIMO
FROM products
INNER JOIN CATEGORIA_CTE
ON CATEGORIA_CTE.id_categoria = products.category_id
GROUP BY products.category_id
 
 
/*______Ejercicio 7____*/ 
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id 

 /*______Ejercicio 8____*/ 
 
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, YEAR(order_date) AS ANIO ,COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id, ANIO


 /*______Ejercicio 9_____*/  
WITH CLIENTES AS
				(SELECT customer_id, company_name AS NOMBRE_CLIENTE, phone AS TELEFONO
                FROM customers)
                
SELECT CLIENTES.NOMBRE_CLIENTE , CLIENTES.TELEFONO, YEAR(order_date) AS ANIO ,COUNT(orders.order_id)
FROM orders
INNER JOIN CLIENTES
on orders.customer_id = CLIENTES.customer_id
GROUP BY orders.customer_id, ANIO
HAVING ANIO = 1998 AND COUNT(orders.order_id) > 6

 /*______Ejercicio 10_____*/ 
WITH  CLIENTE AS(
					SELECT customer_id,  order_id
                    FROM orders)

SELECT CLIENTE.customer_id AS ID_Cliente, order_details.order_id, SUM(unit_price*quantity) AS TOTAL_PEDIDO
FROM order_details
INNER JOIN CLIENTE
ON CLIENTE.order_id = order_details.order_id
GROUP BY order_details.order_id