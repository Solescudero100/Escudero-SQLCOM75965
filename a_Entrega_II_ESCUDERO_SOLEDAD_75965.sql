 -- Consigna -Entrega 1: descripción de la temática, DER, listado de tablas, script--

-- Descripcion de la tematica- puntos calves varios puntos:
-- Se trata de una cadena de tiendas deportivas que comercializa calzado, indumentaria y artículos deportivos en distintas provincias de Argentina--
-- El objetivo de crear un tablero es poder visualizar rapidamente las ventas mensuales (tanto aumentos como disminuciones), analizar el comportamiento de los clientes (quiénes compran más de una vez, quiénes ingresan solo a mirar, etc) y conocer los niveles de satisfacción --
-- También se busca contar con información actualizada del personal para responder con agilidad ante cualquier consulta o requerimiento relacionado con la empresa--


USE solo_deportes;
CREATE DATABASE Solo_deportes;
use Solo_deportes;

CREATE TABLE Clientes (
    Id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30)NOT NULL,
    apellido varchar(40)NOT NULL,
    email VARCHAR(100)NULL,
    provincia varchar(30) default "Buenos_Aires", -- si no se ingresa nada por default se registra automaticamente buenos aires--
    fecha_registro DATE -- almacena fechas en yyyy mm dd--
); 
INSERT INTO Clientes (nombre,apellido,email, provincia, fecha_registro) VALUES
("Santiago", "Dinner", "santiago@gmail.com", "Buenos Aires","2025-03-02"),
("Florencia", "Bossio", "florencia@gmail.com", "Entre Rios",'2025-01-02'),
("Andrea", "Ormeño", "andrea@gmail.com", "Corrientes",'2025-02-05'),
("Wanda", "Plaza", "wanda@gmail.com", "Jujuy",'2025-04-01'),
("Mateo", "Escudero", "mateo@hotmail.com", "Formosa",'2025-04-01'),
("Julia", "Mora", "julia@gmail.com", "Buenos Aires",'2025-04-01'),
("Juan", "Anselmo", "juan@hotmail.com", "Buenos Aires",'2025-03-31'),
("Leonardo", "Ronchetti", "leonardo@gmail.com","Buenos Aires",'2025-04-20'),
("Alicia", "Leston", "alicia@gmail.com", "Mendoza",'2025-02-01');
Select * from Clientes;

CREATE TABLE Productos (
id_producto INT PRIMARY KEY auto_increment NOT NULL,
nombre varchar(50) NOT NULL,
categoría varchar(50) NOT NULL,
precio decimal (10,2) NOT NULL
);
 INSERT INTO Productos (nombre, categoría, precio) VALUES
('Pelota de fútbol', 'Deportes', 12000.00),
('Raqueta de tenis', 'Tenis', 45000.50),
('Botines de fútbol', 'Calzado', 38000.99),
('Mancuernas 5kg', 'Fitness', 15000.75),
('Camiseta de básquet', 'Indumentaria', 22000.00),
('Guantes de boxeo', 'Boxeo', 30000.00),
('Bicicleta de montaña', 'Ciclismo', 150000.00),
('Gorra deportiva', 'Accesorios', 8000.00),
('Reloj deportivo', 'Tecnología', 55000.00);
Select * from Productos;

CREATE TABLE Ventas (
    Id_ventas INT PRIMARY KEY NOT NULL,
    Id_cliente INT NOT NULL,
    Id_producto INT NOT NULL,
    Id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto),
    FOREIGN KEY (Id_empleado) REFERENCES Empleados1(Id_empleado)  
);
ALTER TABLE Ventas MODIFY COLUMN Id_ventas INT AUTO_INCREMENT; -- esto es para que funcione el stored procedures de registrar ventas por día-- 


INSERT INTO Ventas (Id_ventas,Id_cliente, Id_producto, Id_empleado, fecha, monto) VALUES
(01,1, 1, 1000, '2025-04-04', 12000.00),
(02,2, 2, 1001, '2025-04-04', 45000.50),
(03,3, 3, 1002, '2025-04-04', 38000.99),
(04, 4, 4, 1003, '2025-04-04', 15000.75),
(05, 5, 5, 1004, '2025-04-04', 22000.00),
(06, 6, 6, 1005, '2025-04-04', 30000.00),
(07, 7, 7, 1006, '2025-04-04', 150000.00),
(08, 8, 8, 1007, '2025-04-04', 8000.00),
(09, 9, 9, 1008, '2025-04-04', 55000.00);
Select * from ventas;

CREATE TABLE Encuestas (
    Id_encuesta INT PRIMARY KEY auto_increment NOT NULL,
    Id_cliente  INT NOT NULL,
    puntaje INT NOT NULL,
    comentarios TEXT NULL,
    FOREIGN KEY (Id_cliente ) REFERENCES Clientes(Id_cliente ));
    
    INSERT INTO Encuestas (Id_cliente, puntaje, comentarios) VALUES
(1, 5, 'Muy buen producto y servicio.'),
(2, 4, 'Me gustó, pero podría mejorar el envío.'),
(3, 3, 'El producto no era como esperaba.'),
(4, 5, 'Excelente calidad.'),
(5, 2, 'Tardó mucho en llegar.'),
(6, 4, 'Buena compra, lo recomiendo.'),
(7, 5, 'Todo perfecto.'),
(8, 3, 'Regular, esperaba más.'),
(9, 4, 'Buena relación calidad-precio.');
Select * from Encuestas;

CREATE TABLE Empleados1 (
Id_empleado INT PRIMARY KEY NOT NULL,
nombre varchar(50)NOT NULL ,
apellido Varchar(50)NOT NULL,
fecha_de_nacimiento date NOT NULL,
fecha_de_ingreso DATE NOT NULL,
nivel_educativo varchar(50)NOT NULL,
sueldo_bruto DECIMAL (10, 2)NOT NULL,
afiliacion_gremial varchar (50) NOT NULL,
departamento_laboral varchar(80) NOT NULL);

INSERT INTO Empleados1 (Id_empleado, nombre, apellido, fecha_de_nacimiento, fecha_de_ingreso, nivel_educativo, sueldo_bruto, afiliacion_gremial, departamento_laboral) VALUES
(1000,'Pablo', 'Gómez', '1990-05-12', '2020-06-01', 'Secundario', 120000.00, 'Si', 'Ventas'),
(1001, 'Laura', 'Fernández', '1985-03-22', '2018-02-15', 'Universitario', 150000.00, 'Si', 'Administración'),
(1002, 'Diego', 'Rodríguez', '1993-07-14', '2021-09-10', 'Secundario', 110000.00, 'No', 'Depósito'),
(1003, 'Sofía', 'Martínez', '1988-11-30', '2017-05-20', 'Universitario', 160000.00, 'Si', 'Gerencia'),
(1004,'Mariano', 'López', '1995-09-08', '2022-01-05', 'Terciario', 115000.00, 'No', 'Atención al Cliente'),
(1005,'Néstor', 'Cuiule', '1969-09-08', '2006-01-05', 'Terciario', 115000.00, 'si', 'Logistica'),
(1006,'Gabriel', 'Torres', '1994-04-25', '2020-11-30', 'Universitario', 140000.00, 'Si', 'Marketing'),
(1007,'Valeria', 'García', '1987-12-02', '2015-07-22', 'Universitario', 170000.00, 'Si', 'Recursos Humanos'),
(1008,'Ezequiel', 'Pérez', '1996-02-14', '2023-03-18', 'Terciario', 105000.00, 'No', 'Mantenimiento');
Select * from Empleados1;

-- ENTREGA II--
-- CREACIÓN DE VISTAS --  
CREATE VIEW vista_clientes_top AS 
SELECT                             
    c.Id_cliente,
    c.nombre,
    c.apellido,
    COUNT(v.Id_ventas) AS cantidad_compras,
    SUM(v.monto) AS monto_total
FROM Clientes c
JOIN Ventas v ON c.Id_cliente = v.Id_cliente
GROUP BY c.Id_cliente
ORDER BY cantidad_compras DESC;

CREATE VIEW vista_clientes_activos AS 
SELECT 
    DISTINCT c.Id_cliente,
    c.nombre,
    c.apellido,
    v.fecha AS fecha_ultima_compra
FROM Clientes c
JOIN Ventas v ON c.Id_cliente = v.Id_cliente
WHERE v.fecha >= CURDATE() - INTERVAL 30 DAY;
SELECT * FROM vista_clientes_activos; 

SELECT * 
FROM Ventas 
WHERE fecha >= CURDATE() - INTERVAL 30 DAY
ORDER BY fecha DESC; -- no tengo ninguna compra en los últimos 30 días -- 

INSERT INTO Ventas (Id_ventas, Id_cliente, Id_producto, Id_empleado, fecha, monto) -- inserto ventas para poder crear la vista -- 
VALUES (11, 1, 2, 1001, CURDATE(), 45000.00),
       (12, 1, 3, 1000, '2025-05-02', 45000.00),
	   (13, 1, 4, 1003, '2025-05-20', 45000.00),
	   (14, 1, 5, 1008, '2025-04-30', 45000.00),
       (15, 1, 6, 1007, '2025-05-10', 45000.00),
       (16, 1, 7, 1005, '2025-05-03', 45000.00);
       
UPDATE Ventas SET Id_cliente = 2 WHERE Id_ventas = 11;
UPDATE Ventas SET Id_cliente = 3 WHERE Id_ventas = 12;
UPDATE Ventas SET Id_cliente = 4 WHERE Id_ventas = 13;
UPDATE Ventas SET Id_cliente = 5 WHERE Id_ventas = 14;
UPDATE Ventas SET Id_cliente = 6 WHERE Id_ventas = 15;

SELECT * FROM Ventas; 
SELECT * FROM vista_clientes_activos;

CREATE VIEW vista_ventas_por_categoria AS 
SELECT 
    p.categoría,
    COUNT(v.Id_ventas) AS cantidad_ventas,
    SUM(v.monto) AS total_facturado
FROM Ventas v
JOIN Productos p ON v.Id_producto = p.id_producto
GROUP BY p.categoría;

SELECT * FROM vista_ventas_por_categoria;

CREATE VIEW vista_satisfaccion_de_clientes AS
SELECT 
    c.Id_cliente,
    c.nombre,
    c.apellido,
    AVG(e.puntaje) AS puntaje_promedio,
    COUNT(e.Id_encuesta) AS cantidad_encuestas
FROM Clientes c
JOIN Encuestas e ON c.Id_cliente = e.Id_cliente
GROUP BY c.Id_cliente, c.nombre, c.apellido;
SELECT * FROM vista_satisfaccion_de_clientes ;

UPDATE Encuestas SET Id_cliente = 1 WHERE puntaje = 3;
UPDATE Encuestas SET Id_cliente = 4 WHERE puntaje = 1;
UPDATE Encuestas SET Id_cliente = 9 WHERE puntaje = 4;

CREATE OR REPLACE VIEW vista_descuentos_aplicados AS 
SELECT 
    v.Id_ventas,
    c.nombre AS Nombre_del_cliente,
    c.apellido AS Apellido_del_cliente,
    p.nombre AS Producto,
    v.monto,
    calcular_descuento(v.monto) AS Descuento_Aplicado,
    v.monto - calcular_descuento(v.monto) AS Total_con_descuento,
    v.fecha
FROM Ventas v
JOIN Clientes c ON v.Id_cliente = c.Id_cliente
JOIN Productos p ON v.Id_producto = p.id_producto;
SELECT * FROM vista_descuentos_aplicados;


-- CREACION DE  FUNCIONES:  
DELIMITER //

CREATE FUNCTION calcular_descuento(monto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    IF monto >= 150000 THEN
        RETURN monto * 0.10;
    ELSEIF monto >= 45000 THEN
        RETURN monto * 0.05; 
    ELSE
        RETURN 0;
    END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE FUNCTION nivel_satisfaccion(puntaje_promedio DECIMAL(3,1))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(50);

    IF puntaje_promedio >= 4 THEN
        SET resultado = 'Excelente';
    ELSEIF puntaje_promedio >= 3.5 THEN
        SET resultado = 'Buena';
    ELSEIF puntaje_promedio >= 2.5 THEN
        SET resultado = 'Regular';
    ELSE
        SET resultado = 'Mala';
    END IF;

    RETURN resultado;
END;
//

DELIMITER ;

SELECT nivel_satisfaccion(4.8);  -- Devuelve: Excelente
SELECT nivel_satisfaccion(3.6);  -- Devuelve: Buena
SELECT nivel_satisfaccion(2.8);  -- Devuelve: Regular
SELECT nivel_satisfaccion(1.9);  -- Devuelve: Mala
  
DELIMITER //

CREATE FUNCTION obtener_nombre_completo(Id_empleado INT) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(200);

    SELECT CONCAT(nombre, ' ', apellido)
    INTO nombre_completo 
    FROM empleados1 
    WHERE id_empleado = Id_empleado
    LIMIT 1;

    RETURN nombre_completo;
END;
//

DELIMITER ;

DELIMITER //

CREATE FUNCTION obtener_nombre_completo_de_cliente(Id_cliente INT) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(200);

    SELECT CONCAT(nombre, ' ', apellido)
    INTO nombre_completo 
    FROM Clientes 
    WHERE Id_cliente = Id_cliente
    LIMIT 1;

    RETURN nombre_completo;
END;
//

DELIMITER ;


-- CREACIÓN DE STORED PROCEDURES -- 
DELIMITER //

CREATE PROCEDURE ObtenerVentasPorDia() -- Con este procedimiento puedo ver la cantidad de ventas por día y el monto total facturado. Involucra la tabla de ventas (fecha y monto).
BEGIN
    SELECT 
        fecha,
        COUNT(*) AS cantidad_ventas,
        SUM(monto) AS total_facturado
    FROM ventas
    GROUP BY fecha
    ORDER BY fecha;
END //

DELIMITER ;

select * from Ventas;
CALL ObtenerVentasPorDia();

DELIMITER //

CREATE PROCEDURE RegistrarVenta( -- Este procedimiento me permite registrar las ventas diarias. Involucra tabla de Ventas. 
    IN p_id_cliente INT,
    IN p_id_producto INT,
    IN p_id_empleado INT,
    IN p_fecha DATE,
    IN p_monto DECIMAL(10,2)
)
BEGIN
    INSERT INTO ventas (Id_cliente, Id_producto, Id_empleado, fecha, monto)
    VALUES (p_id_cliente, p_id_producto, p_id_empleado, p_fecha, p_monto);
END //

DELIMITER ;
CALL RegistrarVenta(8, 3, 1000, '2025-05-22', 68000.00); -- Ingreso ventas diarias para probar el procedimiento --
CALL RegistrarVenta(9, 7, 1005, '2025-05-22', 888000);
CALL RegistrarVenta(1, 4, 1003, '2025-05-22', 50000);
select * from ventas;



USE solo_deportes;

-- Se copia documento de Word explicando cada creación. -- 
-- Negocio: solo_deportes
Se trata de una cadena de tiendas deportivas que comercializa calzado, indumentaria y artículos deportivos en distintas provincias de Argentina 
Todo lo trabajé desde MySQL, conectándome a la base de datos ya creada ‘solo_deportes’.
Todos los datos de las tablas fueron cargados con la sentencia INSERT INTO, verificando la carga de datos a través del SELECT * FROM.
Cada paso se dejó registrado en MySQL adjunto. 


Segunda entrega: 
-	Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen: 

•	vista_clientes_activos: El objetivo es saber los clientes que hicieron una compra en los últimos 30 días. Incluye la tabla de clientes (id_cliente, nombre, apellido) y tabla ventas (id_cliente).

•	vista_clientes_top: El objetivo de esta vista es saber quiénes son los mejores clientes. Incluye el id_cliente, nombre y apellido de la tabla Clientes e incluye el Id_ventas y monto de la tabla Ventas.

•	vista_descuentos_aplicados: Esta vista la creé para poder usar y ver la FUNCIÓN DE DESCUENTO.  Nos muestra el id_ventas, nombre y apellido, el producto, monto, descuento aplicado, total descuento y la fecha.

•	vista_satisfaccion_de_clientes: Nos muestra la cantidad de encuestas y el puntaje promedio. Incluye la tabla de Clientes (Id, nombre y apellido) y de la tabla Encuestas el id_cliente.

•	vista_ventas_por_categoria:  el objetivo es ver el total facturado y cuántos productos se vendieron por categoría. Incluye tabla de Productos (categoría) y tabla de Ventas (id_producto).




-	Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas:

•	calcular_descuento: Esta función lo que hace es aplicar un descuento del 10% si el monto es mayor o = a 150.000 y si es mayor o = a 45.000 se aplica un 0.5% y sino no se aplica ningún descuento. 

•	nivel_satisfaccion: se usa para saber el nivel se satisfacción del cliente de acuerdo al puntaje. Si el nivel de satisfacción es 4 devuelve (Excelente); si el puntaje_promedio >= 3.5 (Buena) y si es puntaje_promedio >= 2.5 (Regular).

•	obtener_nombre_completo: con esta función obtenemos el nombre y apellido del empleado (tabla Empleados1) rápidamente para responder a informes, hacer reportes, etc.  

•	obtener_nombre_completo_de_cliente: lo mismo que la anterior función, pero para la tabla clientes.

-	Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas:

•	ObtenerVentasPorDia: Nos muestra la cantidad de ventas por día y el monto total facturado. Involucra la tabla de ventas (fecha y monto)

•	RegistrarVenta: Registra las ventas diarias. Involucra tabla de Ventas.


 

 

