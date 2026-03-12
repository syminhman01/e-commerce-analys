--Product contribution
-- How much percentage did product obtain sales in category

WITH sales_products_category AS ( 
	SELECT 	
			p.product ,
			p.category,
			SUM(es.sales ) AS product_sales
	FROM e_commerce.ecom_sales es 
	JOIN e_commerce.product p 
		ON es.product_code = p.product_code 
	GROUP BY 
			p.product,
			p.category
)


	SELECT *,
			SUM(product_sales) OVER(PARTITION BY category) AS category_sales,
			CAST(product_sales*100.0/SUM(product_sales) OVER(PARTITION BY category)
			AS DECIMAL(5,4)) AS product_distribution_category
	FROM sales_products_category;
