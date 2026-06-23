# What is the total revenue generated?
SELECT round(sum(qty*Price),2) Revenue 
FROM orders o
JOIN product p
	ON p.P_ID= o.P_ID;


# What is the month-over-month sales trend and rolling sum?
WITH CTE AS
(SELECT YEAR(order_date) years, substring(`ORDER_DATE`, 1, 7) months, round(sum(qty*price),2) Sales
FROM orders o
JOIN product p
	ON o.P_ID= p.P_ID
GROUP BY YEAR(order_date), substring(`ORDER_DATE`, 1, 7)
)
SELECT months, sales, round(sum(sales) OVER(PARTITION BY years ORDER BY months),2) rolling_sum
FROM CTE;

