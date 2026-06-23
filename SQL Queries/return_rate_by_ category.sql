# Return rate by category
WITH CTE1 AS
(SELECT category, sum(qty) total_qty
FROM orders o
JOIN product p
	ON o.P_ID= p.P_ID
GROUP BY category
),
CTE2 AS
(SELECT category, sum(qty) returned_qty
FROM returns r
JOIN orders o
	ON o.or_id = r.or_id
JOIN product p
	ON r.p_id = p.p_id
WHERE Return_Refund = "Approved"
GROUP BY category
)
SELECT c1.category, c1.total_qty, c2.returned_qty,
round(c2.returned_qty/c1.total_qty*100,2) percent_returned
FROM CTE1 c1
JOIN CTE2 c2
	ON c1.category=c2.category
ORDER BY 4 DESC;


