
-- Consigna: descripción de la temática, DER, listado de tablas, script--

-- Descripcion de la tematica- puntos calves varios puntos:
-- Se trata de una cadena de tiendas deportivas que comercializa calzado, indumentaria y artículos deportivos en distintas provincias de Argentina--
-- El objetivo de crear un tablero es poder visualizar rapidamente las ventas mensuales (tanto aumentos como disminuciones), analizar el comportamiento de los clientes (quiénes compran más de una vez, quiénes ingresan solo a mirar, etc) y conocer los niveles de satisfacción --
-- También se busca contar con información actualizada del personal para responder con agilidad ante cualquier consulta o requerimiento relacionado con la empresa-- 

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


CREATE TABLE Ventas (
    Id_ventas INT PRIMARY KEY NOT NULL,
    Id_cliente INT NOT NULL,
    Id_producto INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_cliente) REFERENCES Clientes(Id_cliente),-- el id cliente de la tabla ventas debe coincidir  con un cliente id en la tabla clientes--
    FOREIGN KEY (Id_producto) REFERENCES Productos(Id_producto));      -- indica que el producto id en ventas debe existir en la tabla productos --

INSERT INTO Ventas (Id_ventas,Id_cliente, Id_producto, fecha, monto) VALUES
(01,1, 1, '2025-04-04', 12000.00),
(02,2, 2, '2025-04-04', 45000.50),
(03,3, 3, '2025-04-04', 38000.99),
(04, 4, 4, '2025-04-04', 15000.75),
(05, 5, 5, '2025-04-04', 22000.00),
(06, 6, 6, '2025-04-04', 30000.00),
(07, 7, 7, '2025-04-04', 150000.00),
(08, 8, 8, '2025-04-04', 8000.00),
(09, 9, 9, '2025-04-04', 55000.00);


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


CREATE TABLE Empleados (
Id_empleado INT PRIMARY KEY NOT NULL,
nombre varchar(50)NOT NULL ,
apellido Varchar(50)NOT NULL,
fecha_de_nacimiento date NOT NULL,
fecha_de_ingreso DATE NOT NULL,
nivel_educativo varchar(50)NOT NULL,
sueldo_bruto DECIMAL (10, 2)NOT NULL,
afiliacion_gremial varchar (50) NOT NULL,
departamento_laboral varchar(80) NOT NULL);

INSERT INTO Empleados (Id_empleado, nombre, apellido, fecha_de_nacimiento, fecha_de_ingreso, nivel_educativo, sueldo_bruto, afiliacion_gremial, departamento_laboral) VALUES
(1,'Pablo', 'Gómez', '1990-05-12', '2020-06-01', 'Secundario', 120000.00, 'Sí', 'Ventas'),
(2, 'Laura', 'Fernández', '1985-03-22', '2018-02-15', 'Universitario', 150000.00, 'Sí', 'Administración'),
(3, 'Diego', 'Rodríguez', '1993-07-14', '2021-09-10', 'Secundario', 110000.00, 'No', 'Depósito'),
(4, 'Sofía', 'Martínez', '1988-11-30', '2017-05-20', 'Universitario', 160000.00, 'Sí', 'Gerencia'),
(5,'Mariano', 'López', '1995-09-08', '2022-01-05', 'Terciario', 115000.00, 'No', 'Atención al Cliente'),
(6,'Carolina', 'Sánchez', '1991-06-17', '2019-08-12', 'Secundario', 125000.00, 'Sí', 'Logística'),
(7,'Gabriel', 'Torres', '1994-04-25', '2020-11-30', 'Universitario', 140000.00, 'Sí', 'Marketing'),
(8,'Valeria', 'García', '1987-12-02', '2015-07-22', 'Universitario', 170000.00, 'Sí', 'Recursos Humanos'),
(9,'Ezequiel', 'Pérez', '1996-02-14', '2023-03-18', 'Terciario', 105000.00, 'No', 'Mantenimiento');


ALTER table VENTAS
add column Id_empleado INT NOT NULL;
SELECT * FROM ventas;


-- DIAGRAMA DE ENTIDAD RELACION-- adjunto en otro archivo
 


