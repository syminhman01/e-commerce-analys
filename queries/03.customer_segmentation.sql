--customer_segmentation
-- High value
-- Medium value
-- Low value
-- Base on:
-- total_sales per customer


WITH total_sales_per_customer AS (
	SELECT es.customer_id,
			c.first_name,
			c.last_name,
			SUM(es.sales) AS customer_sales
	FROM e_commerce.ecom_sales es
	JOIN e_commerce.customer c 
		ON es.customer_id =c.customer_id 
	GROUP BY es.customer_id,
			c.first_name,
			c.last_name
)

SELECT *,
		CASE
			WHEN customer_sales <1000 THEN 'Low value'
			WHEN customer_sales <3000 THEN 'Medium value'
			ELSE 'High value'
		END AS customer_segmentation
		
FROM total_sales_per_customer
ORDER BY customer_sales DESC;

