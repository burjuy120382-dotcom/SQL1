SELECT pizza_name FROM menu
UNION
SELECT pizza_name FROM menu WHERE 1=0
ORDER BY pizza_name DESC