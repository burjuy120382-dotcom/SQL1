WITH no_id AS
    (SELECT id AS menu_id FROM menu
    EXCEPT
    SELECT menu_id FROM person_order)
SELECT m.pizza_name, m.price, piz.name AS pizzeria_name 
FROM menu m
JOIN pizzeria piz ON piz.id = m.pizzeria_id
JOIN no_id ON no_id.menu_id = m.id
ORDER BY pizza_name, price