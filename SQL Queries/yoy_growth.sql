# What is the percent change in revenue over time?
WITH CTE AS
(SELECT year(order_date) years, ROUND(SUM(qty*price),2) total_revenue,
LAG(ROUND(SUM(qty*price),2)) OVER(ORDER BY year(order_date)) previous_year_revenue
FROM orders o
LEFT OUTER JOIN product p
	ON o.P_ID=p.P_ID
GROUP BY year(order_date)
)
SELECT *, ROUND((total_revenue- previous_year_revenue)*100/previous_year_revenue,2) Percentage_change
FROM CTE
WHERE previous_year_revenue IS NOT NULL;