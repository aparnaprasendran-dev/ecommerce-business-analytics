# Products which generated the highest revenue
SELECT P_Name, round(SUM(price*qty),2) revenue
FROM product p
JOIN orders o
	ON p.P_ID= o.P_ID
LEFT OUTER JOIN returns r
	ON o.Or_ID= r.Or_ID
WHERE R.Or_ID IS NULL OR
	  Return_Refund = "REJECTED"
GROUP BY P_Name
ORDER BY revenue DESC
LIMIT 5;