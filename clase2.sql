	-- clase 2

DROP DATABASE IF EXISTS imdb;
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

CREATE TABLE film (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year YEAR NOT NULL
);

CREATE TABLE actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE film_actor (
    actor_id INT,
    film_id INT,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (film_id) REFERENCES film(film_id) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE film ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE actor ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


INSERT INTO film (title, description, release_year) VALUES
('Inception', 'A mind-bending thriller about dreams within dreams.', 2010),
('The Matrix', 'A hacker discovers the true nature of reality.', 1999),
('Interstellar', 'A journey through space and time.', 2014);


INSERT INTO actor (first_name, last_name) VALUES
('Leonardo', 'DiCaprio'),
('Keanu', 'Reeves'),
('Matthew', 'McConaughey');


INSERT INTO film_actor (actor_id, film_id) VALUES
(1, 1), -- Leonardo DiCaprio en Inception
(2, 2), -- Keanu Reeves en The Matrix
(3, 3); -- Matthew McConaughey en Interstellar


SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;

