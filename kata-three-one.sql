---- Kata: SQL Basics: Group By Day


SELECT
CAST (e.created_at AS date) AS "day",
e.description AS "description",
COUNT(*) AS "count"

FROM events AS e

WHERE name = 'trained'

GROUP BY "day", "description"


---- Kata: Countries Capitals for Trivia Night (SQL for Beginners #6)

SELECT 
capital

FROM countries

WHERE
continent IN ('Africa', 'Afrika') AND  country LIKE 'E%'

ORDER BY capital

LIMIT 3


---- Kata: SQL Bug Fixing: Fix the QUERY - Totaling

SELECT 
CAST (s.transaction_date AS date) AS day,
d.name AS "department",
COUNT(s.id) AS "sale_count"
  
FROM sale AS s
JOIN department d ON d.id = s.department_id

GROUP BY day, d.name
ORDER BY day


































