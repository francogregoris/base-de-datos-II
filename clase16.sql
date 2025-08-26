-- ===============================================
-- Clase 16 - Constraints y Triggers con MySQL y Sakila
-- ===============================================

-- 1️⃣ Insertar un nuevo empleado con NULL en email
-- Si email tiene NOT NULL, esto dará error. Si no, se insertará con valor NULL.
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, jobTitle)
VALUES (1003, 'Smith', 'John', 'x2003', NULL, 1, 'Sales Rep');

-- 2️⃣ Efecto de modificar employeeNumber (PRIMARY KEY)
-- Si restar 20 genera duplicados, MySQL cancelará la actualización.
UPDATE employees SET employeeNumber = employeeNumber - 20;

-- Si aumentar 20 genera duplicados, MySQL también cancelará la actualización.
UPDATE employees SET employeeNumber = employeeNumber + 20;

-- 3️⃣ Agregar columna age con restricción CHECK
-- Solo se permiten edades entre 16 y 70 años.
ALTER TABLE employees ADD age INT CHECK (age BETWEEN 16 AND 70);

-- 4️⃣ Integridad referencial entre film, actor y film_actor en Sakila
-- film_actor(film_id) → film(film_id)
-- film_actor(actor_id) → actor(actor_id)
-- Esto asegura que solo se puedan asignar actores y películas existentes.

-- 5️⃣ Triggers para lastUpdate y lastUpdateUser
ALTER TABLE employees ADD lastUpdate DATETIME, ADD lastUpdateUser VARCHAR(50);

-- Trigger BEFORE INSERT
DELIMITER //
CREATE TRIGGER employees_before_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
  SET NEW.lastUpdate = NOW();
  SET NEW.lastUpdateUser = CURRENT_USER();
END;
//
DELIMITER ;

-- Trigger BEFORE UPDATE
DELIMITER //
CREATE TRIGGER employees_before_update
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
  SET NEW.lastUpdate = NOW();
  SET NEW.lastUpdateUser = CURRENT_USER();
END;
//
DELIMITER ;

-- 6️⃣ Triggers de Sakila relacionados con film_text
-- ins_film: Inserta en film_text cuando se inserta en film
-- upd_film: Actualiza film_text cuando se actualiza film
-- del_film: Borra de film_text cuando se borra film

-- Ejemplo del trigger ins_film en Sakila:
-- (Este código ya existe en la base de datos Sakila)
-- CREATE TRIGGER `ins_film` AFTER INSERT ON `film`
-- FOR EACH ROW
-- INSERT INTO film_text (film_id, title, description)
-- VALUES (NEW.film_id, NEW.title, NEW.description);
