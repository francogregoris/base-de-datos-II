USE sakila;

SELECT *
FROM address
WHERE postal_code IN ('42399','93896');


SELECT a.address_id, a.postal_code, c.city, co.country
FROM address a
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE a.postal_code NOT IN ('42399','93896');

-- c) Ver tiempos de ejecución
SHOW PROFILES;



CREATE INDEX idx_postal_code
ON address(postal_code);

-- b) Repetír las mismas consultas:
-- Query:
SELECT *
FROM address
WHERE postal_code IN ('42399','93896');

-- Hacer join:
SELECT a.address_id, a.postal_code, c.city, co.country
FROM address a
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE a.postal_code NOT IN ('42399','93896');

-- c) Probar:
SHOW PROFILES;



SELECT *
FROM actor
WHERE first_name = 'JULIA';


SELECT *
FROM actor
WHERE last_name = 'ZELLWEGER';


SELECT title, description
FROM film
WHERE description LIKE '%amazing%';


ALTER TABLE film_text
ADD FULLTEXT idx_fulltext_description (description);


SELECT title, description
FROM film_text
WHERE MATCH(description) AGAINST('amazing');


