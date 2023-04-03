SELECT COUNT(*) AS "products", p.country
FROM products AS p
WHERE p.country IN ('United States of America', 'Canada')
GROUP BY p.country
ORDER BY "products" DESC