-- Revenue by product category
-- Which category generates the most revenue?

SELECT p.category,
		SUM(es.sales ) AS total_sales,
		SUM(es.profit )AS total_profit,
		SUM(es.quantity ) AS total_quantity
FROM e_commerce.ecom_sales es 
JOIN e_commerce.product p 
	ON es.product_code =p.product_code 
GROUP BY p.category 
ORDER BY total_sales DESC;
