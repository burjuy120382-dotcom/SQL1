DROP TABLE IF EXISTS edges;

CREATE TABLE edges (
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost   INT
);

INSERT INTO edges VALUES
    ('a', 'b', 10), ('b', 'a', 10),
    ('a', 'c', 15), ('c', 'a', 15),
    ('a', 'd', 20), ('d', 'a', 20),
    ('b', 'c', 35), ('c', 'b', 35),
    ('b', 'd', 25), ('d', 'b', 25),
    ('c', 'd', 30), ('d', 'c', 30);

WITH RECURSIVE
-- получаем список всех уникальных городов
cities AS (
    SELECT DISTINCT point1 AS city FROM edges
),
-- считаем сколько всего городов
city_count AS (
    SELECT COUNT(*) AS total FROM cities
),
-- рекурсивный обход графа
tours AS (
    -- ANCHOR: стартуем из города 'a'
    SELECT
        CAST('a' AS VARCHAR) AS current_city,
        CAST('a' AS VARCHAR) AS visited,        -- города которые уже посетили
        CAST('{a' AS VARCHAR) AS tour,           -- строим маршрут
        0 AS total_cost,
        1 AS steps
    FROM city_count

    UNION ALL

    -- RECURSIVE: идём в следующий город
    SELECT
        e.point2                                    AS current_city,
        t.visited || ',' || e.point2                AS visited,
        t.tour    || ',' || e.point2                AS tour,
        t.total_cost + e.cost                       AS total_cost,
        t.steps + 1                                 AS steps
    FROM tours t
    JOIN edges e
        ON  e.point1 = t.current_city
        AND t.visited NOT LIKE '%' || e.point2 || '%'  -- не посещали этот город
    JOIN city_count cc
        ON  t.steps < cc.total                         -- ещё не все города посещены
),
-- завершаем тур: возвращаемся в 'a'
complete_tours AS (
    SELECT
        t.total_cost + e.cost AS total_cost,
        t.tour || ',a}'       AS tour
    FROM tours t
    JOIN edges e
        ON  e.point1 = t.current_city
        AND e.point2 = 'a'
    JOIN city_count cc
        ON  t.steps = cc.total   -- все города посещены
),
-- находим минимальную стоимость
min_cost AS (
    SELECT MIN(total_cost) AS min_total FROM complete_tours
)
SELECT
    ct.total_cost,
    ct.tour
FROM complete_tours ct
JOIN min_cost m ON ct.total_cost = m.min_total
ORDER BY ct.total_cost, ct.tour;