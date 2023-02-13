WITH Quarterly_Sales AS(SELECT *,CASE WHEN EXTRACT(MONTH FROM date) BETWEEN 1 AND 3 THEN 'Qtr 1'
			WHEN EXTRACT(MONTH FROM date) BETWEEN 4 AND 6 THEN 'Qtr 2'
            WHEN EXTRACT(MONTH FROM date) BETWEEN 7 AND 9 THEN 'Qtr 3'
            WHEN EXTRACT(MONTH FROM date) BETWEEN 10 AND 12 THEN 'Qtr 4' END AS Quarter
			FROM fact_sales_monthly
				WHERE EXTRACT(YEAR FROM date) = 2020)
 
 SELECT Quarter,SUM(sold_quantity) AS total_sold_quantity FROM Quarterly_Sales
			GROUP BY Quarter
				ORDER BY total_sold_quantity DESC;
