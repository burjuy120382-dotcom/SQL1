
WITH RECURSIVE
cities AS (
    SELECT DISTINCT point1 AS city FROM edges
),
city_count AS (
    SELECT COUNT(*) AS total FROM cities
),
tours AS (
    -- ANCHOR
    SELECT
        CAST('a'  AS VARCHAR)  AS current_city,
        CAST('a'  AS VARCHAR)  AS visited,
        CAST('{a' AS VARCHAR)  AS tour,
        0                      AS total_cost,
        1                      AS steps
    FROM city_count

    UNION ALL

    -- RECURSIVE
    SELECT
        e.point2                                       AS current_city,
        t.visited    || ',' || e.point2                AS visited,
        t.tour       || ',' || e.point2                AS tour,
        t.total_cost + e.cost                          AS total_cost,
        t.steps + 1                                    AS steps
    FROM tours t
    JOIN edges e
        ON  e.point1 = t.current_city
        AND t.visited NOT LIKE '%' || e.point2 || '%'
    JOIN city_count cc
        ON  t.steps < cc.total
),
complete_tours AS (
    SELECT
        t.total_cost + e.cost  AS total_cost,
        t.tour || ',a}'        AS tour
    FROM tours t
    JOIN edges e
        ON  e.point1 = t.current_city
        AND e.point2 = 'a'
    JOIN city_count cc
        ON  t.steps = cc.total
),
-- минимальная и максимальная стоимость
cost_bounds AS (
    SELECT
        MIN(total_cost) AS min_total,
        MAX(total_cost) AS max_total
    FROM complete_tours
)
SELECT
    ct.total_cost,
    ct.tour
FROM complete_tours ct
JOIN cost_bounds cb
    ON  ct.total_cost = cb.min_total
    OR  ct.total_cost = cb.max_total
ORDER BY ct.total_cost, ct.tour;