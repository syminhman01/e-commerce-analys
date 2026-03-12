-- Sales by months

SELECT DATEFROMPARTS(YEAR(es.order_date),MONTH(es.order_date),1) AS year_month,
		SUM(es.sales ) AS total_sales,
		SUM(es.profit ) AS total_profits
FROM e_commerce.ecom_sales es 
GROUP BY DATEFROMPARTS(YEAR(es.order_date),MONTH(es.order_date),1)
ORDER BY year_month ASC;
