--How much did the company sell overall? 

SELECT SUM(es.sales )  AS total_revenue,
		SUM(es.profit )  AS total_profit,
		SUM(es.quantity ) AS total_quantity,
		COUNT(DISTINCT es.order_id ) AS total_orders
FROM e_commerce.ecom_sales es 
