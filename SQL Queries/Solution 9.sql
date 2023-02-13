WITH sales_by_channel AS 
	(SELECT dc.channel,
		ROUND(SUM(fgp.gross_price*fsm.sold_quantity),2) AS gross_sales_mln
				FROM dim_customer dc INNER JOIN fact_sales_monthly fsm ON dc.customer_code = fsm.customer_code
					INNER JOIN fact_gross_price fgp ON fgp.product_code = fsm.product_code
						WHERE fsm.fiscal_year = 2021
							GROUP BY dc.channel
								ORDER BY gross_sales_mln DESC)
 
SELECT channel,
		gross_sales_mln,
				CONCAT(
					ROUND((gross_sales_mln / total_sales)*100,2),
													'%') 
						AS percentage FROM 
							(SELECT *,SUM(gross_sales_mln) OVER () AS total_sales FROM sales_by_channel) x;
