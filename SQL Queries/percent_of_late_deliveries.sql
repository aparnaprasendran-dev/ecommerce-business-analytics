# What percentage of returns are caused by late deliveries?
WITH CTE1 AS
(SELECT sum(CASE WHEN reason = "late delivery" THEN 1 ELSE 0 END)  returns_due_to_late_deliveries,
       sum(CASE WHEN reason != "late delivery" THEN 1 ELSE 0 END) returns_due_to_other_reasons, count(*) total_returns
FROM returns
)
SELECT *, ROUND(returns_due_to_late_deliveries*100/total_returns,2) delivery_delay_percentage
FROM CTE1;