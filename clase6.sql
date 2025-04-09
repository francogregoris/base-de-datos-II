

USE sakila;


SELECT first_name, last_name 
FROM actor
WHERE last_name IN (
    SELECT last_name 
    FROM actor 
    GROUP BY last_name 
    HAVING COUNT(*) > 1
)
ORDER BY last_name, first_name;


SELECT actor_id, first_name, last_name 
FROM actor
WHERE actor_id NOT IN (
    SELECT actor_id 
    FROM film_actor
);

SELECT customer_id, first_name, last_name  
FROM customer
WHERE customer_id IN (
    SELECT customer_id 
    FROM rental 
    GROUP BY customer_id 
    HAVING COUNT(DISTINCT inventory_id) = 1
);


SELECT customer_id, first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id 
    FROM rental 
    GROUP BY customer_id 
    HAVING COUNT(DISTINCT inventory_id) > 1
);

SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name 
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_id IN (
    SELECT film_id 
    FROM film 
    WHERE title IN ('BETRAYED REAR', 'CATCH AMISTAD')
)
ORDER BY actor.actor_id;


SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name 
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_id IN (
    SELECT film_id 
    FROM film 
    WHERE title = 'BETRAYED REAR'
)
AND actor.actor_id NOT IN (
    SELECT actor_id 
    FROM film_actor 
    WHERE film_id IN (
        SELECT film_id 
        FROM film 
        WHERE title = 'CATCH AMISTAD'
    )
)
ORDER BY actor.actor_id;


SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name 
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_id IN (
    SELECT film_id 
    FROM film 
    WHERE title = 'BETRAYED REAR'
)
AND actor.actor_id IN (
    SELECT actor_id 
    FROM film_actor 
    WHERE film_id IN (
        SELECT film_id 
        FROM film 
        WHERE title = 'CATCH AMISTAD'
    )
)
ORDER BY actor.actor_id;


SELECT actor.actor_id, actor.first_name, actor.last_name 
FROM actor
WHERE actor.actor_id NOT IN (
    SELECT actor_id 
    FROM film_actor 
    WHERE film_id IN (
        SELECT film_id 
        FROM film 
        WHERE title IN ('BETRAYED REAR', 'CATCH AMISTAD')
    )
)
ORDER BY actor.actor_id;
