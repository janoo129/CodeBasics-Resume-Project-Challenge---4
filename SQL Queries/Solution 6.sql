SELECT fpid.customer_code,
		dp.customer,
			ROUND(AVG(fpid.pre_invoice_discount_pct)*100,2) AS average_discount_percentage
				FROM fact_pre_invoice_deductions fpid INNER JOIN dim_customer dp
					ON fpid.customer_code = dp.customer_code 
						WHERE fpid.fiscal_year = 2021 AND dp.market = 'India'
							GROUP BY fpid.customer_code,dp.customer
								ORDER BY average_discount_percentage DESC
										LIMIT 5;
