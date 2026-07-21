SELECT 
      COALESCE (p.name, '-') AS person_name, 
	  f.visit_date,
	  COALESCE (pi.name, '-') AS pizzeria_name
FROM person p
FULL JOIN 
     (SELECT person_id, pizzeria_id, visit_date
	 FROM person_visits pv
	 WHERE visit_date <= '2022-01-03' AND visit_date >= '2022-01-01') AS f
	 ON f.person_id = p.id
FULL JOIN pizzeria pi ON pi.id = f.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name