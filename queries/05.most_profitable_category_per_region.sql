--Most profitable category per region
-- In each region, which category biggest?
WITH profit_category_per_region AS (
	SELECT r.region,
			p.category,
			SUM(es.profit ) AS category_profits
	FROM e_commerce.ecom_sales es 
	JOIN e_commerce.product p 
		ON es.product_code = p.product_code 
	JOIN e_commerce.region r 
		ON es.region_code =r.region_code 
	GROUP BY  r.region,
			  p.category
)

SELECT *
FROM (
	SELECT *,
			RANK() OVER(PARTITION BY region ORDER BY category_profits DESC) AS rank_no
	FROM profit_category_per_region
)t
WHERE t.rank_no =1;
