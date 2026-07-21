WITH f AS
	(SELECT pizza_name, price, pizzeria_id FROM menu)
SELECT f.pizza_name, pi.name AS pizzeria_name, f.price
FROM f
LEFT JOIN pizzeria pi ON f.pizzeria_id = pi.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name
