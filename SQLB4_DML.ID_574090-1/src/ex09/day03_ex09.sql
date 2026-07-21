INSERT INTO person_visits(visit_date, pizzeria_id, person_id, id)
VALUES(
    '2022-02-24',
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT MAX(id)+1 FROM person_visits)
    ),
    (
    '2022-02-24',
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT MAX(id)+2 FROM person_visits)
    )
    