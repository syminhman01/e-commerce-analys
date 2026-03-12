--Top customers by total sales

SELECT	c.customer_id ,
		c.first_name,
		c.last_name ,
		COUNT(DISTINCT es.order_id) AS total_orders,
		SUM(es.sales) AS total_sales,
		SUM(es.profit) AS total_profits
		
FROM e_commerce.ecom_sales es 
JOIN e_commerce.customer c 
	ON es.customer_id =c.customer_id 
GROUP BY c.customer_id ,
		c.first_name,
		c.last_name
ORDER BY total_sales DESC;
