(SELECT pz.name AS pizzeria_name FROM pizzeria pz
JOIN person_visits pv ON pv.pizzeria_id=pz.id
JOIN person p ON p.id=pv.person_id
WHERE p.name = 'Andrey')
EXCEPT
(SELECT pz.name FROM pizzeria pz
JOIN menu m ON m.pizzeria_id=pz.id
JOIN person_order po ON po.menu_id=m.id
JOIN person p ON p.id=po.person_id
WHERE p.name = 'Andrey')
ORDER BY pizzeria_name
