-- Final Dashboard Dataset
SELECT es.order_date,
		r.region,
		p.category,
		p.product,
		es.sales,
		es.profit,
		es.quantity,
		es.customer_id 
FROM e_commerce.ecom_sales es 
JOIN e_commerce.product p 
	ON es.product_code = p.product_code 
JOIN e_commerce.region r 
	ON es.region_code = r.region_code 
	
