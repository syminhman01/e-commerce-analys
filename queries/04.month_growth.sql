--Month over Month Growth
--How fast is the company growing?

WITH sales_month AS (
	SELECT *, 
			LAG(t.total_sales ) OVER(ORDER BY t.year_month ASC) AS previous_month_sales
			
	FROM (
		SELECT 
			DATEFROMPARTS(YEAR(es.order_date),MONTH(es.order_date),1) AS year_month,
			SUM(es.sales ) AS total_sales,
			SUM(es.profit ) AS total_profits
		FROM e_commerce.ecom_sales es 
		GROUP BY DATEFROMPARTS(YEAR(es.order_date),MONTH(es.order_date),1)
	) t
)
SELECT *,
		CAST((total_sales-previous_month_sales)*100.0/previous_month_sales
		AS DECIMAL(5,2))
		AS growth
FROM sales_month
