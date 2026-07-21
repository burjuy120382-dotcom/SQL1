SELECT m.pizza_name, pi.name AS pizzeria_name
FROM pizzeria pi
LEFT JOIN menu m ON m.pizzeria_id = pi.id
LEFT JOIN person_order po ON po.menu_id = m.id
LEFT JOIN person p ON p.id = po.person_id WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY pizza_name, pizzeria_name