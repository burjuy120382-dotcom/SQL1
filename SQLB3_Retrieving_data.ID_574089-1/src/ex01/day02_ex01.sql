SELECT f.visit_date::date AS missing_date 
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS f(visit_date)
LEFT JOIN person_visits p1 ON p1.visit_date = f.visit_date AND p1.person_id = 1
LEFT JOIN person_visits p2 ON p2.visit_date = f.visit_date AND p2.person_id = 2
WHERE p1.visit_date IS NULL AND p2.visit_date IS NULL
ORDER BY missing_date
