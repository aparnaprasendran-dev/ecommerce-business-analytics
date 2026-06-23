# 10 Most bought products
SELECT P_Name, SUM(qty) quantity
FROM product p
JOIN orders o
	ON p.P_ID= o.P_ID
GROUP BY P_Name
ORDER BY quantity DESC
LIMIT 10;