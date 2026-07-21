SELECT m.id FROM menu m 
EXCEPT
SELECT po.menu_id FROM person_order po
ORDER BY id