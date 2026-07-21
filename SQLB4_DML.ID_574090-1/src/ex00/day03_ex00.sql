SELECT m.pizza_name, m.price, piz.name, pv.visit_date 
FROM menu m
JOIN pizzeria piz ON m.pizzeria_id = piz.id
JOIN person_visits pv ON pv.pizzeria_id = piz.id
JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000 
ORDER BY m.pizza_name, m.price, piz.name