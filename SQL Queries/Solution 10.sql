WITH division_rank AS (SELECT dp.division,
			dp.product_code,
					dp.product,
							SUM(fsm.sold_quantity) AS total_sold_quantity,
								RANK() OVER (PARTITION BY division ORDER BY SUM(fsm.sold_quantity) DESC) AS rank_order
									FROM dim_product dp INNER JOIN fact_sales_monthly fsm ON dp.product_code = fsm.product_code
										WHERE fsm.fiscal_year = 2021
											GROUP BY dp.division,dp.product_code,dp.product)

SELECT * FROM division_rank
		WHERE rank_order <= 3;
