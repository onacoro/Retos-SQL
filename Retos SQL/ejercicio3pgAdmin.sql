/* 1. Crea una tabla llamada "Productos" con las columnas:
      id (entero, clave primaria), nombre (texto) y precio (numérico). */
CREATE TABLE Productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    precio NUMERIC);


/* 2. Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO Productos (id, nombre, precio)
VALUES
(1, 'Aceite', 4.50),
(2, 'Sal', 0.80),
(3, 'Azúcar', 1.20),
(4, 'Mantequilla', 2.30),
(5, 'Miel', 3.90);


/* 3. Actualiza el precio de un producto en la tabla "Productos". */
UPDATE Productos
SET precio = 3.00
WHERE id = 3;


/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM Productos
WHERE id = 5;


/* 5. Realiza una consulta que muestre los nombres de los usuarios
      junto con los nombres de los productos que han comprado.
      Para esto necesitamos una tabla intermedia "Compras". */

/* Creamos la tabla Compras (si no existe). */
CREATE TABLE Compras (
    id INTEGER PRIMARY KEY,
    usuario_id INTEGER,
    producto_id INTEGER,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);


/* Insertamos algunas compras de ejemplo. */
INSERT INTO Compras (id, usuario_id, producto_id)
VALUES
(1, 1, 1),  -- Ana compra Aceite
(2, 1, 2),  -- Ana compra Sal
(3, 1, 3);  -- Ana compra Azúcar



/* Consulta con INNER JOIN: usuarios + productos comprados */
SELECT
    Usuarios.nombre AS usuario,
    Productos.nombre AS producto
FROM Compras
INNER JOIN Usuarios ON Compras.usuario_id = Usuarios.id
INNER JOIN Productos ON Compras.producto_id = Productos.id;
