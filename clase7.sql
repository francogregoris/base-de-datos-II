use sakila ;

-- ejercicio 1
SELECT title, rating 
FROM film 
WHERE length = (SELECT MIN(length) FROM film);

-- ejercicio 2 
SELECT title
FROM film
WHERE length = (SELECT MIN(length) FROM film)
  AND (SELECT COUNT(*) 
       FROM film 
       WHERE length = (SELECT MIN(length) FROM film)) = 1;
       
       -- ejercicio 3 
SELECT c.customer_id, c.first_name, c.last_name, a.address, MIN(p.amount) AS lowest_payment
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.address;
-- ejercicio 4
SELECT c.customer_id, c.first_name, c.last_name, a.address,
       MIN(p.amount) AS lowest_payment,
       MAX(p.amount) AS highest_payment
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.address;