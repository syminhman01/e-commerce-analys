-- Sales by region
-- Which region generates the most revenue?

SELECT r.region,
		SUM(es.sales ) AS total_sales,
		SUM(es.profit ) AS total_profit
FROM e_commerce.ecom_sales es 
JOIN e_commerce.region r 
	ON es.region_code =r.region_code 
GROUP BY r.region
ORDER BY total_sales;
