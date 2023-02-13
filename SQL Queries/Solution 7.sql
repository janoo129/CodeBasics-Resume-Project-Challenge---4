SELECT EXTRACT(MONTH FROM fsm.date) AS Month, EXTRACT(YEAR FROM fsm.date) AS Year,
ROUND(SUM(fsm.sold_quantity*fgp.gross_price),2) AS 'Gross sales Amount' FROM fact_sales_monthly fsm 
INNER JOIN fact_gross_price fgp ON fsm.product_code = fgp.product_code
INNER JOIN dim_customer dc ON fsm.customer_code = dc.customer_code WHERE dc.customer = 'Atliq Exclusive' GROUP BY 2,1 ORDER BY 2,1;
