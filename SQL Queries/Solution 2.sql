WITH product_count_per_year AS (SELECT SUM(CASE WHEN fiscal_year = 2020 THEN 1 END) AS unique_products_2020,   
		SUM(CASE WHEN fiscal_year = 2021 THEN 1 END) AS unique_products_2021 FROM fact_gross_price)    

SELECT *,
		CONCAT(    
			ROUND((unique_products_2021-unique_products_2020)/unique_products_2020*100,2),'%') AS percentage_chg      
					FROM product_count_per_year
