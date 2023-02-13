WITH productsbysegment_count_per_year AS 
(SELECT dp.segment, 
	SUM(CASE WHEN fgp.fiscal_year = 2020 THEN 1 END) AS product_count_2020,   
				SUM(CASE WHEN fgp.fiscal_year = 2021 THEN 1 END) AS product_count_2021
					FROM dim_product dp INNER JOIN fact_gross_price fgp
						ON dp.product_code = fgp.product_code
							GROUP BY dp.segment)	

SELECT *, CONCAT(    
			ROUND(
				(product_count_2021-product_count_2020)/product_count_2020*100,2),'%') AS difference
					FROM productsbysegment_count_per_year;
