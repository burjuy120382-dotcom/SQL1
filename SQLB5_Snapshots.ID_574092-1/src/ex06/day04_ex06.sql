CREATE materialized view mv_dmitriy_visits_and_eats AS
SELECT pi.name FROM pizzeria pi 
INNER JOIN menu m ON m.pizzeria_id = pi.id 
INNER JOIN person_visits pv ON pv.pizzeria_id = pi.id 
INNER JOIN person p ON pv.person_id = p.id   
WHERE m.price < 800 AND 
pv.visit_date = '2022-01-08' AND
p.name = 'Dmitriy'