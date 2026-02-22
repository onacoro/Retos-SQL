
/*EJERCICIO 1*/

/*Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto).*/
CREATE TABLE IF NOT EXISTS Clientes(
		id SERIAL PRIMARY KEY, 
		nombre TEXT NOT NULL,
		email TEXT );

/*Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email=" juan@example.com".*/
INSERT INTO Clientes (id, nombre, email)
VALUES (1, 'Juan', 'juan@example.com');

/*Actualizar el email del cliente con id=1 a " juan@gmail.com".*/

UPDATE Clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/*4.Eliminar el cliente con id=1 de la tabla "Clientes".*/
DELETE FROM Clientes
WHERE id = 1;

/*5.Crear una tabla llamada "Pedidos" con las columnas: 
id (entero, clave primaria), cliente_id (entero,clave externa referenciando a la tabla "Clientes"),
producto (texto) y cantidad (entero).*/

CREATE TABLE IF NOT EXISTS Pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES Clientes(id),
    producto TEXT NOT NULL,
    cantidad INTEGER NOT NULL
);


/*6. Insertar un nuevo pedido en la tabla "Pedidos" 
con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/

INSERT INTO clientes (id, nombre, email)
VALUES (1, 'Cliente1', 'cliente1@example.com');

/*Vuelvo a crear el cliente con id = 1 porque en un paso anterior lo eliminé. 
(La tabla "pedidos" tiene una clave foránea hacia "clientes", 
así que es obligatorio que exista un cliente con id = 1 antes de insertar un pedido).*/


INSERT INTO pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE pedidos 
SET cantidad = 3 
WHERE id = 1;

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM pedidos
WHERE id = 1;

/*9. Crear una tabla llamada "Productos" con las columnas: 
id (entero, clave primaria), nombre (texto) y precio (decimal).*/

CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    precio DECIMAL
);

/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */

INSERT INTO productos (id, nombre, precio)
VALUES
(1, 'Camiseta', 15.00),
(2, 'Bufanda', 12.50),
(3, 'Gorra', 8.90),
(4, 'Guantes', 10.75);

/* 11. Consultar todos los clientes de la tabla "Clientes". */
SELECT * FROM clientes;

/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
SELECT pedidos.*, clientes.nombre
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id;

/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */
SELECT *
FROM productos
WHERE precio > 50;

/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */
SELECT *
FROM pedidos
WHERE cantidad >= 5;

/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */
SELECT *
FROM clientes
WHERE nombre LIKE 'A%';

/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT clientes.nombre, COUNT(pedidos.id) AS total_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre;

/* 17. Realizar una consulta que muestre el nombre del producto
y la cantidad total de pedidos de ese producto. */

SELECT productos.nombre, COUNT(pedidos.id) AS total_pedidos
FROM productos
LEFT JOIN pedidos ON productos.id = CAST(pedidos.producto AS INTEGER)
GROUP BY productos.nombre;

/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */
ALTER TABLE pedidos
ADD COLUMN fecha DATE;

/* 19. Agregar una clave externa a la tabla "Pedidos"
que haga referencia a la tabla "Productos" en la columna "producto". */

ALTER TABLE pedidos
ALTER COLUMN producto TYPE INTEGER
USING producto::integer;

ALTER TABLE pedidos
ADD CONSTRAINT pedidos_producto_fkey
FOREIGN KEY (producto) REFERENCES productos(id);

/* 20. Realizar una consulta que muestre los nombres de los clientes,
   los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */
SELECT clientes.nombre AS cliente,
       productos.nombre AS producto,
       pedidos.cantidad
FROM pedidos
JOIN clientes ON pedidos.cliente_id = clientes.id
JOIN productos ON pedidos.producto = productos.id;





