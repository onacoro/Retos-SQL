/* EJERCICIO 2 ejecutado en el QueryTool de ''MiBaseDeDatos'''*/

/* 1. Crea una base de datos llamada "MiBaseDeDatos". */
CREATE DATABASE MiBaseDeDatos;


/* 2. Crea una tabla llamada "Usuarios". */
DROP TABLE IF EXISTS Usuarios;
CREATE TABLE Usuarios (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER
);

/* 3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO Usuarios (id, nombre, edad)
VALUES
(1, 'Ana', 25),
(2, 'Luis', 30);

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE Usuarios
SET edad = 26
WHERE id = 1;

/* 5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM Usuarios
WHERE id = 2;



/*EJERCICIO 2 — NIVEL MODERADO*/

/* 1. Crea una tabla llamada "Ciudades". */
CREATE TABLE Ciudades (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    pais TEXT
);

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO Ciudades (id, nombre, pais)
VALUES
(1, 'Madrid', 'España'),
(2, 'Gante', 'Bélgica'),
(3, 'Melbourne', 'Australia');

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con Ciudades(id). */
/* Primero añadimos la columna ciudad_id si no existe. */
ALTER TABLE Usuarios
ADD COLUMN ciudad_id INTEGER;

/* Ahora añadimos la clave externa. */
ALTER TABLE Usuarios
ADD CONSTRAINT usuarios_ciudad_fkey
FOREIGN KEY (ciudad_id) REFERENCES Ciudades(id);

/* (Opcional) Asignamos ciudades a los usuarios existentes. */
UPDATE Usuarios SET ciudad_id = 1 WHERE id = 1;


/* 4. Consulta con LEFT JOIN: usuarios + ciudad + país. */
SELECT Usuarios.nombre AS usuario,
       Ciudades.nombre AS ciudad,
       Ciudades.pais
FROM Usuarios
LEFT JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;

/* 5. Consulta con INNER JOIN: solo usuarios con ciudad asociada. */

SELECT Usuarios.nombre AS usuario,
       Ciudades.nombre AS ciudad,
       Ciudades.pais
FROM Usuarios
INNER JOIN Ciudades ON Usuarios.ciudad_id = Ciudades.id;
