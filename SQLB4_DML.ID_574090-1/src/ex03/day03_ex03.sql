WITH visits AS(
    SELECT pz.name AS pizzeria_name,
        p.gender FROM pizzeria pz
    JOIN person_visits pv ON pv.pizzeria_id=pz.id
    JOIN person p ON p.id=pv.person_id 
)
(
    SELECT visits.pizzeria_name FROM visits WHERE visits.gender='male'
    EXCEPT ALL 
    SELECT visits.pizzeria_name FROM visits WHERE visits.gender='female'

)
UNION ALL
(
    SELECT visits.pizzeria_name FROM visits WHERE visits.gender='female'
    EXCEPT ALL 
    SELECT visits.pizzeria_name FROM visits WHERE visits.gender='male'
) 
ORDER BY pizzeria_name