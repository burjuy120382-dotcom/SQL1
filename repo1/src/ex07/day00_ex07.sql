SELECT DISTINCT p.name, po.person_id,
       CASE
           WHEN p.age BETWEEN 10 AND 20 THEN 'interval #1'
           WHEN p.age > 20 AND p.age < 24 THEN 'interval #2'
           ELSE 'interval #3'
       END AS interval_info
FROM person p
JOIN person_order po ON po.person_id = p.id
ORDER BY interval_info;
