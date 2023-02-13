WITH prod_cost AS (SELECT fmc.product_code,dp.product,fmc.manufacturing_cost 
		FROM fact_manufacturing_cost fmc INNER JOIN dim_product dp
			ON fmc.product_code = dp.product_code
				ORDER BY fmc.manufacturing_cost DESC)
 
SELECT product_code,product,manufacturing_cost FROM prod_cost
	WHERE manufacturing_cost IN (SELECT MAX(manufacturing_cost) FROM prod_cost)	
 UNION
 SELECT product_code,product,manufacturing_cost FROM prod_cost
	WHERE manufacturing_cost IN (SELECT MIN(manufacturing_cost) FROM prod_cost)	
