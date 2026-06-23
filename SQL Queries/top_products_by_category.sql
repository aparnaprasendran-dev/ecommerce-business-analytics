# Top 3 most bought products from each category
WITH cte AS 
(SELECT Category, p_name, SUM(qty) quantity, DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(qty) DESC) ranks
FROM product p
JOIN orders o
	ON p.P_ID= o.P_ID
GROUP BY Category, p_name
)
SELECT category, p_name, quantity
FROM CTE
WHERE ranks IN (1,2,3);


