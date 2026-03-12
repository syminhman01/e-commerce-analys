--Top products
-- Top 10 products by sales

SELECT TOP 10 p.product,
		p.category,
		SUM(es.sales ) AS total_sales,
		SUM(es.profit ) AS total_profits
FROM e_commerce.ecom_sales es 
JOIN e_commerce.product p 
	ON es.product_code =p.product_code 
GROUP BY p.product,
		p.category
ORDER BY total_sales DESC;

