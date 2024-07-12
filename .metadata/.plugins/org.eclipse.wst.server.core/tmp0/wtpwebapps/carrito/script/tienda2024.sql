---------------------------------------
-- Base de datos : tienda2024
-- Autor : JHON CHINO
---------------------------------------
use tienda2024;

-- Tabla : Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias(
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY (IdCategoria),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Categorias
INSERT INTO Categorias VALUES('CAT001','LIGA 1','liga1.jpg','1');
INSERT INTO Categorias VALUES('CAT002','PREMIERE LEAGUE','premiereleague.jpg','1');
INSERT INTO Categorias VALUES('CAT003','LA LIGA','laliga.jpg','1');
INSERT INTO Categorias VALUES('CAT004','SERIE A','seriea.jpg','1');
INSERT INTO Categorias VALUES('CAT005','BUNDESLIGA','bundesliga.jpg','1');
INSERT INTO Categorias VALUES('CAT006','LIGUE 1','ligue1.jpg','1');

-- Tabla : Productos
DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos(
    IdProducto CHAR(8) NOT NULL,
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Stock INT NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdProducto),
    FOREIGN KEY(IdCategoria) REFERENCES Categorias(IdCategoria),
    CHECK(PrecioUnidad > 0),
    CHECK(Stock > 0),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Productos
INSERT INTO Productos VALUES('CAM00001','CAT001','ALIANZA LIMA',
299,10,'CAM00001.jpg','1');
INSERT INTO Productos VALUES('CAM00002','CAT001','UNIVERSITARIO',
279,10,'CAM00002.jpg','1');
INSERT INTO Productos VALUES('CAM00003','CAT001','SPORTING CRISTAL',
269,10,'CAM00003.jpg','1');
INSERT INTO Productos VALUES('CAM00004','CAT001','MELGAR',
249,10,'CAM00004.jpg','1');
INSERT INTO Productos VALUES('CAM00005','CAT001','DEPORTIVO GARCILASO',
229,10,'CAM00005.jpg','1');
INSERT INTO Productos VALUES('CAM00006','CAT001','CIENCIANO',
229,10,'CAM00006.jpg','1');

INSERT INTO Productos VALUES('CAM00009','CAT002','MANCHESTER CITY',
299,10,'CAM00009.jpg','1');
INSERT INTO Productos VALUES('CAM00010','CAT002','LIVERPOOL',
299,10,'CAM00010.jpg','1');
INSERT INTO Productos VALUES('CAM00011','CAT002','ARSENAL',
299,10,'CAM00011.jpg','1');
INSERT INTO Productos VALUES('CAM00012','CAT002','MANCHESTER UNITED',
299,10,'CAM00012.jpg','1');

INSERT INTO Productos VALUES('CAM00017','CAT003','BARCELONA FC',
299,10,'CAM00017.jpg','1');
INSERT INTO Productos VALUES('CAM00018','CAT003','REAL MADRID',
279,10,'CAM00018.jpg','1');
INSERT INTO Productos VALUES('CAM00019','CAT003','ATLETICO DE MADRID',
229,10,'CAM00019.jpg','1');
INSERT INTO Productos VALUES('CAM00020','CAT003','BETIS',
209,10,'CAM00020.jpg','1');

INSERT INTO Productos VALUES('CAM00033','CAT004','INTER DE MILAN',
249,10,'CAM00033.jpg','1');
INSERT INTO Productos VALUES('CAM00034','CAT004','MILAN',
249,10,'CAM00034.jpg','1');
INSERT INTO Productos VALUES('CAM00035','CAT004','JUVENTUS',
249,10,'CAM00035.jpg','1');
INSERT INTO Productos VALUES('CAM00036','CAT004','NAPOLI',
249,10,'CAM00036.jpg','1');

INSERT INTO Productos VALUES('CAM00041','CAT005','BAYERN MUNICH',
259,10,'CAM00041.jpg','1');
INSERT INTO Productos VALUES('CAM00042','CAT005','BORUSSIA DORTMUND',
259,10,'CAM00042.jpg','1');
INSERT INTO Productos VALUES('CAM00043','CAT005','BAYER 04 LEVERKUSEN',
259,10,'CAM00043.jpg','1');
INSERT INTO Productos VALUES('CAM00044','CAT005','WERDER BREMEN',
259,10,'CAM00044.jpg','1');

INSERT INTO Productos VALUES('CAM00049','CAT006','PARIS SAINT-GERMAIN',
249,10,'CAM00049.jpg','1');
INSERT INTO Productos VALUES('CAM00050','CAT006','MONACO',
249,10,'CAM00050.jpg','1');
INSERT INTO Productos VALUES('CAM00051','CAT006','OLYMPIQUE DE LYON',
249,10,'CAM00051.jpg','1');
INSERT INTO Productos VALUES('CAM00052','CAT006','OLYMPIQUE DE MARSELLA',
249,10,'CAM00052.jpg','1');

-- Tabla : Clientes
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes(
    IdCliente CHAR(8) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    Tipo_user CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente),
    CHECK(Sexo IN ('M','F')),
    CHECK(Estado IN ('0','1'))
);
select * from Clientes;
INSERT INTO Clientes VALUES('CLI00001','RIVERA RIOS','JUAN CARLOS',
'AV.LIMA 1234-CERCADO','1990-05-01','M','jrivera@gmail.com','1234','1','A');
INSERT INTO Clientes VALUES('CLI00002','TORRES DURAN','CLAUDIA',
'AV.PRIMAVERA 1234-SURCO','1991-07-11','F','ctorres@gmail.com','1234','1','U');
INSERT INTO Clientes VALUES('CLI00003','VILLAR RAMOS','WALTER ISMAEL',
'AV.ARENALES 1525-LINCE','1989-12-01','M','wvillar@gmail.com','1234','1','U');
INSERT INTO Clientes VALUES('CLI00004','CHINO PORTILLA','JHON JESUS',
'AV.LIMA 1234-JESUS MARIA','2002-10-01','M','chino@gmail.com','1234','1','A');

SELECT * FROM Clientes;

-- Tabla : Ventas
DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas(
    IdVenta CHAR(10) NOT NULL,
    IdCliente CHAR(8) NOT NULL,
    FechaVenta DATE NOT NULL,
    MontoTotal DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente,IdVenta),
    CHECK(MontoTotal > 0),

    CHECK(Estado IN ('0','1'))
);

-- Tabla : Detalle
DROP TABLE IF EXISTS Detalle;
CREATE TABLE Detalle(
    IdVenta CHAR(10) NOT NULL,
    IdProducto CHAR(8) NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdVenta, IdProducto),
    FOREIGN KEY(IdVenta) REFERENCES Ventas(IdVenta),
    CHECK(Cantidad > 0),
    CHECK(PrecioUnidad >0),
    CHECK(Estado IN ('0','1'))
);

CREATE INDEX idx_idventa ON Ventas(IdVenta);
-- PROCEDIMIENTOS ALMACENADOS

-- Store Procedure : ListarProductos
DROP PROCEDURE IF EXISTS ListarProductos;
DELIMITER @@
CREATE PROCEDURE ListarProductos()
BEGIN
    SELECT * FROM Productos;
END @@
DELIMITER;

-- Llamada al procedimiento almacenado
CALL ListarProductos()


-- Store Procedure : 	ListarCategorias
drop procedure if exists ListarCategorias;
DELIMITER @@
CREATE PROCEDURE ListarCategorias()
BEGIN
	SELECT * FROM Categorias;
END @@
DELIMITER ;

CALL ListarCategorias();

-- Store ´rocedure : InfoProducto
drop procedure if exists InfoProducto;
delimiter @@
CREATE PROCEDURE InfoProducto(iDProd CHAR(8))
BEGIN
	SELECT * FROM Productos Where IdProducto=IdProd;
END @@
delimiter ;

CALL InfoProducto('PRO00003');

-- Store Procedure : ListarProductos
DROP PROCEDURE IF EXISTS ListarProductos;
DELIMITER @@
CREATE PROCEDURE ListarProductos()
BEGIN
    SELECT * FROM Productos;
END @@
DELIMITER;

DROP PROCEDURE IF EXISTS ListarCategorias;
DELIMITER @@
CREATE PROCEDURE ListarCategorias()
BEGIN
    SELECT * FROM categorias;
END @@
DELIMITER;

-- Llamada al procedimiento almacenado
CALL ListarProductos()

-- Store Procedure : ListarProductosXCategoria
DROP PROCEDURE IF EXISTS ListarProductosXCategoria;
DELIMITER //
CREATE PROCEDURE ListarProductosXCategoria(IdCat CHAR(6))
BEGIN
    SELECT * FROM Productos
    WHERE IdCategoria = IdCat;
END //
DELIMITER;

CALL ListarProductosXCategoria('CAT001');

-- Store Procedure : InfoCliente
DROP PROCEDURE IF EXISTS InfoCliente;
DELIMITER @@
CREATE PROCEDURE InfoCliente(IdCli CHAR(8))
BEGIN
    SELECT * FROM Clientes
    WHERE IdCliente = IdCli;
END @@
DELIMITER;

CALL InfoCliente('CLI00001');

-- Store Procedure : InsertaVenta
DROP PROCEDURE IF EXISTS InsertaVenta;
DELIMITER @@
CREATE PROCEDURE InsertaVenta(
    IdVenta CHAR(10),
    IdCliente CHAR(8),
    FechaVenta DATE,
    MontoTotal DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Ventas VALUES(IdVenta,IdCliente,FechaVenta,MontoTotal,Estado);
END @@
DELIMITER;

-- Store Procedure : InsertaDetalle
DROP PROCEDURE InsertaDetalle;
DELIMITER @@
CREATE PROCEDURE InsertaDetalle(
    IdVenta CHAR(10),
    IdProducto CHAR(8),
    Cantidad INT,
    PrecioUnidad DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Detalle VALUES(IdVenta,IdProducto,Cantidad,PrecioUnidad,Estado);
END @@
DELIMITER ;

-- Store Procedure : SuprimirDetalle
drop procedure if exists SuprimirDetalle;
delimiter @@
create procedure SuprimirDetalle(Id CHAR(10),
	IdProd CHAR(8),Cant int, PrecUni decimal(10,0), Est CHAR(1))
begin
	delete from detalle where IdVenta = Id;
end @@
delimiter ;


DROP PROCEDURE IF EXISTS ListarClientes;
DELIMITER @@
CREATE PROCEDURE ListarClientes()
BEGIN
    SELECT * FROM Clientes;
END @@
DELIMITER ;


DROP PROCEDURE IF EXISTS ListarVentas;
DELIMITER @@
CREATE PROCEDURE ListarVentas()
BEGIN
    SELECT * FROM Ventas;
END @@
DELIMITER ;

DROP PROCEDURE IF EXISTS RegistrarClientes;
DELIMITER @@
CREATE PROCEDURE RegistrarClientes(
    Apellidos VARCHAR(50),
    Nombres VARCHAR(50),
    Direccion VARCHAR(50),
    FechaNacimiento DATE,
    Sexo CHAR(1),
    Correo VARCHAR(50),
    Password VARCHAR(50)
)
BEGIN
    DECLARE NuevoIdCliente CHAR(8);
    DECLARE Tipo_user CHAR(1);

    -- Generar un nuevo ID de cliente
    SET NuevoIdCliente = CONCAT('CLI', LPAD((SELECT COUNT(*) + 1 FROM Clientes), 5, '0'));

    -- Establecer el tipo de usuario (puedes modificar esta lógica según tus necesidades)
    SET Tipo_user = 'U'; -- Por defecto se establece como usuario regular

    -- Insertar el nuevo cliente en la tabla Clientes
    INSERT INTO Clientes (IdCliente, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, Estado, Tipo_user)
    VALUES (NuevoIdCliente, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, '1', Tipo_user);
    
    -- Devolver el ID del nuevo cliente
    SELECT NuevoIdCliente AS 'Nuevo ID de Cliente';
END @@
DELIMITER ;

-- Store Procedure : InsertarProducto
DROP PROCEDURE IF EXISTS InsertarProducto;
DELIMITER @@
CREATE PROCEDURE InsertarProducto(
    IdProd CHAR(8),
    IdCat CHAR(6),
    Descripcion VARCHAR(200),
    PrecioUnidad DECIMAL,
    Stock INT,
    Imagen VARCHAR(50),
    Estado CHAR(1)
)
BEGIN
    -- Insertar el nuevo producto en la tabla Productos
    INSERT INTO Productos (IdProducto, IdCategoria, Descripcion, PrecioUnidad, Stock, Imagen, Estado)
    VALUES (IdProd, IdCat, Descripcion, PrecioUnidad, Stock, Imagen, Estado);
END @@
DELIMITER ;


DROP PROCEDURE IF EXISTS RegistrarClientes;
DELIMITER @@
CREATE PROCEDURE RegistrarClientes(
    Apellidos VARCHAR(50),
    Nombres VARCHAR(50),
    Direccion VARCHAR(50),
    FechaNacimiento DATE,
    Sexo CHAR(1),
    Correo VARCHAR(50),
    Password VARCHAR(50)
)
BEGIN
    DECLARE NuevoIdCliente CHAR(8);
    DECLARE Tipo_user CHAR(1);

    -- Generar un nuevo ID de cliente
    SET NuevoIdCliente = CONCAT('CLI', LPAD((SELECT COUNT(*) + 1 FROM Clientes), 5, '0'));

    -- Establecer el tipo de usuario (puedes modificar esta lógica según tus necesidades)
    SET Tipo_user = 'U'; -- Por defecto se establece como usuario regular

    -- Insertar el nuevo cliente en la tabla Clientes
    INSERT INTO Clientes (IdCliente, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, Estado, Tipo_user)
    VALUES (NuevoIdCliente, Apellidos, Nombres, Direccion, FechaNacimiento, Sexo, Correo, Password, '1', Tipo_user);
    
    -- Devolver el ID del nuevo cliente
    SELECT NuevoIdCliente AS 'Nuevo ID de Cliente';
END @@
DELIMITER ;

-- SP: BuscarCliente
drop procedure if exists BuscarCliente;
delimiter @@
create procedure BuscarCliente(Id CHAR(8))
begin
select * from clientes where IdCliente = Id;
end @@
delimiter ;
call BuscarCliente('CLI00001');

-- SP: BuscarVenta
drop procedure if exists BuscarVenta;
delimiter @@
create procedure BuscarVenta(Id CHAR(10))
begin
select * from ventas where IdVenta = Id;
end @@
delimiter ;
call BuscarVenta('VTA0000013');


SELECT * FROM ventas;
SELECT * FROM detalle;