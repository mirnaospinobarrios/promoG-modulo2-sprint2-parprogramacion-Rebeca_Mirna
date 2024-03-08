USE NORTHWIND;

/*____ejercicio 1____*/
SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS orders1
WHERE orders1.order_date >= ALL (SELECT MAX(order_date)
									FROM orders AS orders2
									GROUP BY employee_id
                                    HAVING orders1.employee_id = orders2.employee_id);
                                    
                                    
/*____ejercicio 2____*/
SELECT  product_id, unit_price
FROM products AS P1
WHERE P1.unit_price >= ALL (SELECT MAX(unit_price)
							FROM products AS P2
                            WHERE P1.unit_price = P2.unit_price
                            GROUP BY product_id);
                            
                            
/*____ejercicio 3____*/                                 
SELECT product_id, product_name, category_id
FROM products AS C1
WHERE C1.category_id IN(
						SELECT category_id
						FROM categories AS C2
						WHERE category_id = 1);
                        
/*____ejercicio 4____*/       
SELECT distinct (country)
FROM customers
WHERE country NOT IN ( SELECT COUNTRY
						FROM suppliers);
                        
/*____ejercicio 5____*/                          
SELECT  order_id, customer_id
FROM orders AS O1
WHERE order_id in(	 	
				SELECT order_id
				FROM order_details AS OD2
				WHERE OD2.product_id = 6 and OD2.quantity > 20);
                

/*____ejercicio 6____*/   
SELECT product_name AS "Ten most expensive products", unit_price
FROM products 
WHERE unit_price IN (SELECT unit_price
						FROM products
						ORDER BY unit_price desc)
                        LIMIT 10;

/*____ejercicio 7____*/   
                
SELECT PRODUCTS.product_name , SUM(order_details.quantity)
FROM PRODUCTS
INNER JOIN order_details
ON PRODUCTS.product_id = order_details.product_id
GROUP BY PRODUCTS.product_id
HAVING SUM(order_details.quantity) >= (SELECT MAX(SUMAPRODUCTOS) AS MAXIMO
										FROM( 
												SELECT SUM(quantity) AS SUMAPRODUCTOS
												FROM order_details
												GROUP BY product_id)
                                            AS SUBQUERI);




