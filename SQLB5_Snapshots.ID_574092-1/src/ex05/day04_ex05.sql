CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, 
    round(price - price*0.1) AS discount_price FROM menu m
JOIN person_order po ON po.menu_id = m.id
JOIN person p ON p.id = po.person_id
ORDER BY name, pizza_name