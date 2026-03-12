--Region best product
-- Find the product with highest sales in each region

WITH sales_products_region AS (
	SELECT p.product ,
			r.region ,
			SUM(es.sales ) AS total_sales
	FROM e_commerce.ecom_sales es 
	JOIN e_commerce.region r 
		ON es.region_code =r.region_code
	JOIN e_commerce.product p 
		ON es.product_code =p.product_code 
	GROUP BY p.product ,
			r.region
)
SELECT *
FROM  ( 
	SELECT *,
			ROW_NUMBER() OVER(PARTITION BY region ORDER BY total_sales DESC) AS rank_no
	FROM sales_products_region  
) t
WHERE t.rank_no =1;
