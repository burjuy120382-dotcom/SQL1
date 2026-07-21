WITH orders AS(
    SELECT pz.name AS pizzeria_name,
        p.gender FROM pizzeria pz
    JOIN menu m ON m.pizzeria_id=pz.id
    JOIN person_order po ON m.id=po.menu_id 
    JOIN person p ON p.id=po.person_id

)

(
    SELECT orders.pizzeria_name FROM orders WHERE orders.gender='male'
    EXCEPT  
    SELECT orders.pizzeria_name FROM orders WHERE orders.gender='female'

)
UNION
(
    SELECT orders.pizzeria_name FROM orders WHERE orders.gender='female'
    EXCEPT  
    SELECT orders.pizzeria_name FROM orders WHERE orders.gender='male'
) 
ORDER BY pizzeria_name