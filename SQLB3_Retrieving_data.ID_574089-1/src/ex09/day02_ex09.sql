SELECT p.name FROM person p
INNER JOIN person_order po ON p.id=po.person_id
INNER JOIN menu m ON m.id=po.menu_id
WHERE p.gender='female' 
AND m.pizza_name IN('pepperoni pizza','cheese pizza')
GROUP BY p.name
HAVING COUNT(DISTINCT m.pizza_name)=2
ORDER BY p.name
