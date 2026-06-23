# Repeated V/S one time customer
WITH CTE1 AS 
(SELECT c_name, count(o.c_id) no_of_times_ordered
FROM orders o
JOIN customer c
	ON o.C_ID=c.C_ID
GROUP BY c_name
)
SELECT *, CASE
			WHEN no_of_times_ordered > 1 THEN "repeated customer"
            ELSE "One time customer"
		  END customer_type
FROM CTE1;