-- Host: localhost -- Versión del servidor: 8.0.36 - MySQL Community Server (GPL) -- SO del servidor: Win64

SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT;

SET NAMES utf8;

SET NAMES utf8mb4;

SET
    @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;

SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';

-- Volcando estructura de base de datos para platzi-market
CREATE DATABASE IF NOT EXISTS platzi_market DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;

USE platzi_market;

-- Volcando estructura para tabla platzi_market.categorias
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria int(11) NOT NULL AUTO_INCREMENT, descripcion varchar(45) NOT NULL DEFAULT '0', estado int(11) NOT NULL DEFAULT '0', PRIMARY KEY (id_categoria), KEY id_categoria (id_categoria)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = latin1;

-- Volcando datos para la tabla platzi_market.categorias: ~8 rows (aproximadamente)
DELETE FROM categorias;

ALTER TABLE categorias DISABLE KEYS;

INSERT INTO
    categorias (
        id_categoria, descripcion, estado
    )
VALUES (1, 'Frutas y verduras', 1),
    (2, 'Pastelería', 1),
    (3, 'Carnes y pescados', 1),
    (4, 'Frutas y verduras', 1),
    (5, 'Bebidas', 1),
    (6, 'Licores', 1),
    (7, 'Cuidado personal', 1),
    (8, 'Despensa', 1);

ALTER TABLE categorias ENABLE KEYS;

-- Volcando estructura para tabla platzi_market.clientes
CREATE TABLE IF NOT EXISTS clientes (
    id varchar(20) NOT NULL, nombre varchar(40) DEFAULT NULL, apellidos varchar(100) DEFAULT NULL, celular decimal(10, 0) DEFAULT '0', direccion varchar(80) DEFAULT '0', correo_electronico varchar(70) DEFAULT '0', PRIMARY KEY (id), KEY id (id)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- Volcando datos para la tabla platzi_market.clientes: ~3 rows (aproximadamente)
DELETE FROM clientes;

ALTER TABLE clientes DISABLE KEYS;

INSERT INTO
    clientes (
        id, nombre, apellidos, celular, direccion, correo_electronico
    )
VALUES (
        '2552243', 'Galileo', 'Galilei', 3462257293, 'Cl 1 # 11 - 11', 'gali@leo.com'
    ),
    (
        '4546221', 'Johannes', 'Kepler', 3104583224, 'Cl 3 # 33 - 33', 'kepler@me.com'
    ),
    (
        '983824', 'Nicolás', 'Copernico', 3019392466, 'Cl 2 # 22 - 22', 'nico@cope.com'
    );

ALTER TABLE clientes ENABLE KEYS;

-- Volcando estructura para tabla platzi_market.compras
CREATE TABLE IF NOT EXISTS compras (
    id_compra int(11) NOT NULL AUTO_INCREMENT, id_cliente varchar(20) NOT NULL DEFAULT '', fecha datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, medio_pago char(1) DEFAULT '', comentario varchar(300) DEFAULT '', estado char(1) DEFAULT '', PRIMARY KEY (id_compra), KEY id_compra (id_compra), KEY id_cliente (id_cliente), CONSTRAINT FK_compras_clientes FOREIGN KEY (id_cliente) REFERENCES clientes (id)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = latin1;

-- Volcando datos para la tabla platzi_market.compras: ~1 rows (aproximadamente)
DELETE FROM compras;

ALTER TABLE compras DISABLE KEYS;

INSERT INTO
    compras (
        id_compra, id_cliente, fecha, medio_pago, comentario, estado
    )
VALUES (
        1, '4546221', '1992-10-08 17:30:00', 'E', '', 'P'
    );

ALTER TABLE compras ENABLE KEYS;

-- Volcando estructura para tabla platzi_market.compras_productos
CREATE TABLE IF NOT EXISTS compras_productos (
    id_compra int(11) NOT NULL, id_producto int(11) NOT NULL, cantidad int(11) DEFAULT NULL, total decimal(16, 2) DEFAULT NULL, estado tinyint(4) DEFAULT NULL, KEY id_compra (id_compra), KEY id_producto (id_producto), CONSTRAINT FK_compras_productos_compras FOREIGN KEY (id_compra) REFERENCES compras (id_compra), CONSTRAINT id_productofk FOREIGN KEY (id_producto) REFERENCES productos (id_producto)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- Volcando datos para la tabla platzi_market.compras_productos: ~6 rows (aproximadamente)
DELETE FROM compras_productos;

ALTER TABLE compras_productos DISABLE KEYS;

INSERT INTO
    compras_productos (
        id_compra, id_producto, cantidad, total, estado
    )
VALUES (1, 1, 10, 3000.00, 1),
    (1, 36, 1, 40000.00, 1),
    (1, 27, 1, 9000.00, 1),
    (1, 49, 2, 16400.00, 1),
    (1, 24, 1, 4000.00, 1);

ALTER TABLE compras_productos ENABLE KEYS;

-- Volcando estructura para tabla platzi_market.productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto int(11) NOT NULL AUTO_INCREMENT, nombre varchar(50) DEFAULT '0', id_categoria int(11) NOT NULL DEFAULT '0', codigo_barras varchar(50) DEFAULT '0', precio_venta decimal(16, 2) DEFAULT '0.00', cantidad_stock int(11) NOT NULL DEFAULT '0', estado tinyint(4) DEFAULT '0', PRIMARY KEY (id_producto), KEY id_producto (id_producto), KEY id_categoria (id_categoria), CONSTRAINT FK_productos_categorias FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
) ENGINE = InnoDB AUTO_INCREMENT = 51 DEFAULT CHARSET = latin1;

-- Volcando datos para la tabla platzi_market.productos: ~50 rows (aproximadamente)
DELETE FROM productos;

ALTER TABLE productos DISABLE KEYS;

INSERT INTO
    productos (
        id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado
    )
VALUES (
        1, 'Guayaba Feijoa', 1, '7029 A42 23', 300.00, 500, 1
    ),
    (
        2, 'Mango', 1, '0316 R56 01', 2100.00, 250, 1
    ),
    (
        3, 'Manzana', 1, '7923 T23 19', 700.00, 130, 1
    ),
    (
        4, 'Aguacate', 1, '9322 Q33 02', 2500.00, 98, 1
    ),
    (
        5, 'Lechuga', 1, '9742 S22 21', 4000.00, 86, 1
    ),
    (
        6, 'Tomate', 1, '0483 R00 97', 290.00, 430, 1
    ),
    (
        7, 'Pera', 1, '9999 X10 01', 750.00, 210, 1
    ),
    (
        8, 'Apio', 1, '3390 F29 45', 150.00, 115, 1
    ),
    (
        9, 'Papaya', 1, '5291 J34 32', 4500.00, 73, 1
    ),
    (
        10, 'Limón', 1, '7886 N18 32', 350.00, 425, 1
    ),
    (
        11, 'Brownie', 2, '6683 H15 20', 2500.00, 80, 1
    ),
    (
        12, 'Pan tajado', 2, '5745 F05 47', 4500.00, 120, 1
    ),
    (
        13, 'Torta', 2, '3831 D97 99', 10000.00, 35, 1
    ),
    (
        14, 'Tortilla', 2, '4335 Z33 84', 6400.00, 87, 1
    ),
    (
        15, 'Tostadas', 2, '6584 M19 25', 4000.00, 45, 1
    ),
    (
        16, 'Chocorramo', 2, '4487 S00 97', 2000.00, 105, 1
    ),
    (
        17, 'Salmón', 3, '4546 A00 01', 28000.00, 55, 1
    ),
    (
        18, 'Punta de anca', 3, '3678 E57 22', 12000.00, 32, 1
    ),
    (
        19, 'Posta', 3, '8893 O01 03', 7800.00, 40, 1
    ),
    (
        20, 'Costilla de cerdo', 3, '4534 Q12 88', 8600.00, 70, 1
    ),
    (
        21, 'Tilapia', 3, '5684 R53 02', 17000.00, 60, 1
    ),
    (
        22, 'Merluza', 3, '3523 R04 00', 23000.00, 45, 1
    ),
    (
        23, 'Leche de vaca', 4, '2323 T56 33', 2500.00, 500, 1
    ),
    (
        24, 'Queso', 4, '7786 K19 56', 4000.00, 300, 1
    ),
    (
        25, 'Huevos de gallina feliz', 4, '3478 M74 01', 400.00, 1000, 1
    ),
    (
        26, 'Clara de huevo', 4, '7932 R31 46', 3200.00, 200, 1
    ),
    (
        27, 'Suero costeño', 4, '5463 W23 33', 9000.00, 110, 1
    ),
    (
        28, 'Agua', 5, '8965 I32 11', 2000.00, 600, 1
    ),
    (
        29, 'Jugo de naranja', 5, '7445 T87 44', 7400.00, 200, 1
    ),
    (
        30, 'Gaseosa Colombiana', 5, '3434 R34 63', 3100.00, 175, 1
    ),
    (
        31, 'Jugo de Lulo', 5, '9753 W33 19', 8250.00, 630, 1
    ),
    (
        32, 'Tea', 5, '9836 F35 69', 1900.00, 450, 1
    ),
    (
        33, 'Cerveza', 6, '3432 G67 21', 2100.00, 800, 1
    ),
    (
        34, 'Tequila', 6, '9529 E45 98', 65000.00, 764, 1
    ),
    (
        35, 'Ron', 6, '1947 R07 53', 55000.00, 240, 1
    ),
    (
        36, 'Aguardiente Antioqueño', 6, '3160 A54 94', 40000.00, 480, 1
    ),
    (
        37, 'Vino', 6, '7891 W46 95', 82000.00, 560, 1
    ),
    (
        38, 'Crema dental', 7, '6310 C99 73', 7500.00, 200, 1
    ),
    (
        39, 'Jabón de manos', 7, '9371 J14 75', 4900.00, 90, 1
    ),
    (
        40, 'Enjuague bucal', 7, '1942 T68 01', 12000.00, 105, 1
    ),
    (
        41, 'Shampoo', 7, '6789 W01 23', 9300.00, 200, 1
    ),
    (
        42, 'Desodorante', 7, '7333 S21 36', 6900.00, 85, 1
    ),
    (
        43, 'Arroz', 8, '4676 I83 00', 3500.00, 600, 1
    ),
    (
        44, 'Lentejas', 8, '7333 S21 36', 3000.00, 560, 1
    ),
    (
        45, 'Harina', 8, '7333 S21 36', 1800.00, 300, 1
    ),
    (
        46, 'Sal', 8, '7333 S21 36', 1400.00, 500, 1
    ),
    (
        47, 'Aceite', 8, '7333 S21 36', 6500.00, 135, 1
    ),
    (
        48, 'Cereal', 8, '4673 K53 98', 7000.00, 75, 1
    ),
    (
        49, 'Frijol', 8, '2745 F40 45', 8200.00, 270, 1
    ),
    (
        50, 'Café', 8, '6351 R33 92', 7200.00, 400, 1
    );

ALTER TABLE productos ENABLE KEYS;

SET SQL_MODE = IFNULL(@OLD_SQL_MODE, '');

SET
    FOREIGN_KEY_CHECKS = IF(
        @OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS
    );

SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT;
