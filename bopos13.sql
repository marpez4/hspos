/*
Navicat MySQL Data Transfer

Source Server         : XAMPP
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : bopos

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2023-01-13 15:38:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bodega
-- ----------------------------
DROP TABLE IF EXISTS `bodega`;
CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_apertura` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tipo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of bodega
-- ----------------------------
INSERT INTO `bodega` VALUES ('4', 'Primer entrada', '91', '20', '2023-01-13 13:55:25', '1');
INSERT INTO `bodega` VALUES ('5', 'Hola', '90', '14', '2023-01-13 15:23:23', '1');
INSERT INTO `bodega` VALUES ('7', 'qwerty', '89', '12', null, '1');

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `estatus` int(5) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES ('1', 'Test2', null, '2022-06-30 08:40:59', '0');
INSERT INTO `cajas` VALUES ('2', 'Paul ', null, '2022-07-04 08:05:26', '0');
INSERT INTO `cajas` VALUES ('3', 'Paul2', '2022-07-05', '2022-07-04 08:10:29', '0');
INSERT INTO `cajas` VALUES ('4', 'caja 23', '2022-08-19', '2022-07-05 08:39:25', '0');
INSERT INTO `cajas` VALUES ('5', '29082022', '2022-08-29', '2022-08-29 06:53:45', '0');
INSERT INTO `cajas` VALUES ('6', 'caja09112022', '2022-11-10', '2022-11-09 05:30:36', '0');
INSERT INTO `cajas` VALUES ('7', 'caja10112022', '2022-11-10', '2022-11-10 06:57:53', '0');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('7', 'Desktop', '2022-04-27 10:37:23');
INSERT INTO `categorias` VALUES ('8', 'Laptops', '2022-03-01 21:35:19');
INSERT INTO `categorias` VALUES ('9', 'All in One', '2022-03-01 21:35:28');
INSERT INTO `categorias` VALUES ('10', 'Accesesorios', '2022-04-19 10:31:24');
INSERT INTO `categorias` VALUES ('11', 'Gabinetes', '2022-04-27 10:39:57');
INSERT INTO `categorias` VALUES ('12', 'Memorias', '2022-04-27 10:40:17');
INSERT INTO `categorias` VALUES ('13', 'Gaming', '2022-04-27 10:40:38');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `frecuente` int(11) NOT NULL COMMENT '1 = Cliente frecuente 2 = No frecuente',
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('18', 'Sheldon', '3', '155644654', 'ing.alfonso.marpez@gmail.com', '(477) 645-2888', 'AMAZON', '0000-00-00', '5', '2023-01-04 14:07:29', '2023-01-04 13:07:29');
INSERT INTO `clientes` VALUES ('19', 'Angel Romero', '1', '2147483647', 'angel@gmail.com', '(475) 222-2222', 'sep', '0000-00-00', '7', '2022-11-10 11:11:03', '2022-11-10 10:11:03');
INSERT INTO `clientes` VALUES ('20', 'PAUL GARCIA', '2', '415466546', 'PAUL@GMAIL.COM', '(477) 522-2222', 'CATA', '0000-00-00', '5', '2022-11-10 13:04:56', '2022-11-10 12:04:56');
INSERT INTO `clientes` VALUES ('21', 'Cliente Mostrador', '2', '0', 'na@gmail.com', '(777) 777-7777', 'NA', '0000-00-00', '8', '2022-11-10 11:10:38', '2022-11-10 10:10:39');

-- ----------------------------
-- Table structure for componentes
-- ----------------------------
DROP TABLE IF EXISTS `componentes`;
CREATE TABLE `componentes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `capacidad` int(255) DEFAULT NULL,
  `acron` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of componentes
-- ----------------------------
INSERT INTO `componentes` VALUES ('1', '4', 'GB', null, 'RAM', '2022-04-21 12:39:17');
INSERT INTO `componentes` VALUES ('2', '4', 'GB', null, 'DD', '2022-04-21 12:39:19');
INSERT INTO `componentes` VALUES ('3', '4', 'GB', null, 'Graphics', '2022-04-21 12:39:20');
INSERT INTO `componentes` VALUES ('4', '128', 'GB', null, 'SSD', '2022-04-21 12:39:20');
INSERT INTO `componentes` VALUES ('5', '500', 'GB', null, 'HHD', '2022-04-21 12:39:21');
INSERT INTO `componentes` VALUES ('6', '8', 'GB', null, 'RAM', '2022-04-22 11:26:25');
INSERT INTO `componentes` VALUES ('7', '8', 'GB', null, 'DD', '2022-04-22 11:29:16');

-- ----------------------------
-- Table structure for corte_caja
-- ----------------------------
DROP TABLE IF EXISTS `corte_caja`;
CREATE TABLE `corte_caja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto_inicial` float DEFAULT NULL,
  `monto_final` float DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `total_servicios` int(11) DEFAULT '0',
  `total_ventas` int(11) DEFAULT '0',
  `monto_total` float DEFAULT NULL,
  `estatus` int(11) DEFAULT '1',
  `id_usuario` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `id_caja` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of corte_caja
-- ----------------------------
INSERT INTO `corte_caja` VALUES ('7', '1500', '37410', '2022-07-04 09:54:46', '2022-07-05 08:38:29', '3', '7', '38910', '0', 'Alfonso Martinez Lopez', '3');
INSERT INTO `corte_caja` VALUES ('9', '150', '0', '2022-07-05 08:39:57', '2022-08-19 08:25:18', '0', '0', '150', '0', 'Alfonso Martinez Lopez', '4');
INSERT INTO `corte_caja` VALUES ('10', '1000', '11526', '2022-08-29 06:56:05', '2022-08-29 06:56:36', '1', '2', '12526', '0', 'Alfonso Martinez Lopez', '5');
INSERT INTO `corte_caja` VALUES ('11', '2000', '15437', '2022-11-09 05:31:01', '2022-11-10 06:52:10', '1', '6', '17437', '0', 'Alfonso Martinez Lopez', '6');
INSERT INTO `corte_caja` VALUES ('12', '1050.5', '588', '2022-11-10 07:01:29', '2022-11-10 07:05:20', '0', '1', '1638.5', '0', 'Alfonso Martinez Lopez', '7');

-- ----------------------------
-- Table structure for historial_mov_bodega
-- ----------------------------
DROP TABLE IF EXISTS `historial_mov_bodega`;
CREATE TABLE `historial_mov_bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bodega` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_movimiento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_mov` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of historial_mov_bodega
-- ----------------------------
INSERT INTO `historial_mov_bodega` VALUES ('1', '5', '2', '1', null, '60');
INSERT INTO `historial_mov_bodega` VALUES ('2', 'Array', '12', '1', null, '60');
INSERT INTO `historial_mov_bodega` VALUES ('3', '7', '12', '1', null, '60');

-- ----------------------------
-- Table structure for pedidospaqueteria
-- ----------------------------
DROP TABLE IF EXISTS `pedidospaqueteria`;
CREATE TABLE `pedidospaqueteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idCiudad` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `idEstado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `telefono` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `entreCalles` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `referencias` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fechaAlta` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidospaqueteria
-- ----------------------------
INSERT INTO `pedidospaqueteria` VALUES ('3', 'Alfonso Mtz', 'Eufrasia', '37408', 'Leon II', 'Leon', 'Guanajuato', '4776477193', 'Mariano escobedo', 'Una casa ', '2022-06-24 14:42:14');
INSERT INTO `pedidospaqueteria` VALUES ('4', 'Paul ', 'Cima diamante', '37408', 'La cima', 'Leon', 'Guanajuato', '4776477193', 'asda', 'asdas', null);
INSERT INTO `pedidospaqueteria` VALUES ('5', 'Paul Mendoza ', 'Damasco 1052, dasdas', '37502', 'Cima Diamante', 'Leon', 'Guanajuato', '4775862182', 'Blvd Juan Alonso de Torres y Ebro', 'Casa de dos pisos con porton color cafe y blanco ', '2023-01-10 09:44:05');
INSERT INTO `pedidospaqueteria` VALUES ('6', 'MAXIMINO', 'una calle', '37490', 'una colonia', 'tamaulipas', 'Guanajuato', '688888888', 'unas calles', 'otras calles', null);
INSERT INTO `pedidospaqueteria` VALUES ('7', 'Niño', 'Marínez', '378899', 'López', 'León', 'Guanájuato', '1231231231', 'Obég', 'Kílo', null);
INSERT INTO `pedidospaqueteria` VALUES ('9', 'JOEL MIJANGOS ZARATE', 'MANUEL PATRON #118', '95980', 'BARRIO NUEVO', 'CHINAMECA', 'VERACURZ', '9222563550', 'ENTRE CONSTITUCION Y 5 DE MAYO', 'SIN DATOS', '2023-01-09 09:39:08');
INSERT INTO `pedidospaqueteria` VALUES ('10', 'Jose Eduardo Ambriz Hernandez', 'Damasco #1052', '37408', 'Cima Diamante', 'León', 'Guanajuato', '4775862182', 'adasda', 'asdasd', '2023-01-10 09:39:44');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `precio_ml` float DEFAULT NULL,
  `precio_cliente` float DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `dd` int(11) DEFAULT NULL,
  `procesador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tam_pantalla` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `graficos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ssd` int(11) DEFAULT NULL,
  `hhd` int(11) DEFAULT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('89', '13', 'Logitech', 'Mouse G235', 'vistas/img/productos/default/anonymous.png', '4', '100', '140', '150', '120', 'DELL', '1', null, 'ICORE 5', '12', '3', '4', '5', '1', '2023-01-04 13:07:28');
INSERT INTO `productos` VALUES ('90', '7', '100', 'PRECISSION', 'vistas/img/productos/default/anonymous.png', '9', '3000', '4200', '4500', '4000', 'DELL', '1', null, 'ICORE 5', '12', '3', '4', '5', '1', '2023-01-04 13:07:28');
INSERT INTO `productos` VALUES ('91', '11', '2131', 'PRECISSION', 'vistas/img/productos/default/anonymous.png', '12', '222', '310.8', '222', '222', null, null, null, null, null, null, null, null, '0', '2023-01-11 10:38:05');

-- ----------------------------
-- Table structure for servicios
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` int(11) DEFAULT NULL,
  `cliente` varchar(255) COLLATE utf8_spanish_ci DEFAULT '',
  `telefono` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `equipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `procesador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dd` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ssd` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `so` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `falla` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `solucion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `obs` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_servicio` char(255) COLLATE utf8_spanish_ci DEFAULT '',
  `total` float DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES ('15', '10001', 'Angel Romero', null, '60', 'Laptop', 'HP', 'I Core 5', '4 gb', '120 gb', null, 'W10', null, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio, voluptas', null, '', '', '200', '6', '2022-11-17', '2022-11-10', '6');
INSERT INTO `servicios` VALUES ('16', '10002', 'Paul Mendoza', '47785293341', '60', 'Laptop', 'DELL', 'I Core 5', '4 gb', '120 gb', null, 'W10', 'scoop2', 'Cargador ', null, 'hola', '', '450', '6', '2023-01-04', '2023-01-04', null);
INSERT INTO `servicios` VALUES ('17', '10003', 'Miguel Mendoza Gaona', '4773172475', '60', 'Laptop', 'DELL', 'I Core 5', '4 gb', '120 gb', '250', 'W10', 'scoop', 'Virus troyano', '', '', '', '0', '1', '0000-00-00', '2023-01-09', null);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('60', 'Alfonso Martinez Lopez', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', '', '1', '2023-01-09 11:08:00', '2023-01-09 10:08:00');
INSERT INTO `usuarios` VALUES ('61', 'VendedorTest', 'vendedor', '$2a$07$asxx54ahjppf45sd87a5aumawKBqkKu/t5yVn5oVpbu8.I0unXqba', 'Vendedor', '', '1', '2022-04-27 10:56:19', '2022-04-27 10:56:19');

-- ----------------------------
-- Table structure for ventas
-- ----------------------------
DROP TABLE IF EXISTS `ventas`;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `esClienteF` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of ventas
-- ----------------------------
INSERT INTO `ventas` VALUES ('38', '10001', '18', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"22\",\"precio\":\"266\",\"total\":\"266\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"2660\",\"total\":\"2660\"}]', '0', '2926', '2926', 'Efectivo', '1', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('39', '10002', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"9\",\"precio\":\"100\",\"total\":\"200\"},{\"id\":\"78\",\"descripcion\":\"USB\",\"cantidad\":\"2\",\"stock\":\"8\",\"precio\":\"80\",\"total\":\"160\"}]', '43.2', '360', '403.2', 'TC-1212312312312', '1', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('40', '10003', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"7\",\"precio\":\"120\",\"total\":\"240\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"6720\",\"total\":\"6720\"}]', '69.6', '6960', '7029.6', 'Efectivo', '1', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('41', '10004', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"5\",\"precio\":\"100\",\"total\":\"200\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"5200\",\"total\":\"5200\"}]', '0', '5400', '5400', 'Efectivo', '2', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('42', '10005', '18', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"21\",\"precio\":\"266\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"2660\",\"total\":\"2500\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"100\",\"total\":\"100\"}]', '0', '2805', '2805', 'Efectivo', '1', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('43', '10006', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"3\",\"precio\":\"100\",\"total\":\"100\"}]', '0', '100', '100', 'Efectivo', '1', '2022-07-05 08:40:01', '2');
INSERT INTO `ventas` VALUES ('44', '10007', '18', '60', '[{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"2\",\"stock\":\"16\",\"precio\":\"2660\",\"total\":\"5320\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"6720\",\"total\":\"5200\"}]', '0', '10520', '10520', 'Efectivo', '1', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('45', '10008', '18', '60', '[{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"6720\",\"total\":\"6720\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"20\",\"precio\":\"266\",\"total\":\"266\"}]', '0', '6986', '6986', 'Efectivo', '2', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('46', '10009', '18', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"5600\",\"total\":\"5600\"},{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"11\",\"precio\":\"5740\",\"total\":\"5740\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"588\",\"total\":\"588\"},{\"id\":\"78\",\"descripcion\":\"USB\",\"cantidad\":\"1\",\"stock\":\"7\",\"precio\":\"75\",\"total\":\"75\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"266\",\"total\":\"266\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"2\",\"precio\":\"120\",\"total\":\"120\"}]', '0', '12389', '12389', 'Efectivo', '2', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('48', '10010', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"120\",\"total\":\"240\"}]', '0', '240', '240', 'TC-245235235234523', '3', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('49', '10011', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"588\",\"total\":\"588\"}]', '0', '714', '714', 'Efectivo', '2', '2022-07-05 13:04:28', '3');
INSERT INTO `ventas` VALUES ('50', '10012', '20', '60', '[{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"10\",\"precio\":\"5740\",\"total\":\"5740\"}]', '0', '5740', '5740', 'CH-4564464', '2', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('51', '10013', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"121\",\"total\":\"121\"}]', '0', '121', '121', 'TD-123123', '3', '2022-07-05 10:24:34', '3');
INSERT INTO `ventas` VALUES ('52', '10014', '19', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"100\",\"total\":\"100\"},{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"5000\",\"total\":\"5000\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"500\",\"total\":\"500\"}]', '0', '5600', '5600', 'Efectivo', '1', '2022-08-29 11:55:06', '5');
INSERT INTO `ventas` VALUES ('53', '10015', '21', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"5600\",\"total\":\"5600\"}]', '0', '5726', '5726', 'TC-213131321', '2', '2022-08-29 11:55:47', '5');
INSERT INTO `ventas` VALUES ('54', '10016', '20', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"13\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"588\",\"total\":\"588\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"1\",\"precio\":\"120\",\"total\":\"120\"}]', '0', '834', '834', 'Efectivo', '2', '2022-11-10 10:09:03', '6');
INSERT INTO `ventas` VALUES ('55', '10017', '19', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"100\",\"total\":\"100\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"5200\",\"total\":\"5200\"}]', '0', '5300', '5300', 'TC-78979798', '1', '2022-11-10 10:09:33', '6');
INSERT INTO `ventas` VALUES ('56', '10018', '18', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"null\",\"total\":\"0\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"null\",\"total\":\"null\"}]', '0', '0', '0', 'TD-131321231', '3', '2022-11-10 10:09:54', '6');
INSERT INTO `ventas` VALUES ('57', '10019', '21', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"5600\",\"total\":\"5600\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"266\",\"total\":\"266\"}]', '0', '5866', '5866', 'TF-258963147', '2', '2022-11-10 10:10:15', '6');
INSERT INTO `ventas` VALUES ('58', '10020', '21', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"2\",\"stock\":\"15\",\"precio\":\"266\",\"total\":\"532\"}]', '0', '532', '532', 'TD-258963174', '2', '2022-11-10 10:10:39', '6');
INSERT INTO `ventas` VALUES ('59', '10021', '19', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"205\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"2500\",\"total\":\"2500\"}]', '0', '2705', '2705', 'Efectivo', '1', '2022-11-10 10:11:03', '6');
INSERT INTO `ventas` VALUES ('60', '10022', '20', '60', '[{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"588\",\"total\":\"588\"}]', '0', '588', '588', 'TD-396741852', '2', '2022-11-10 12:04:56', '7');
INSERT INTO `ventas` VALUES ('61', '10023', '19', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"205\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"2500\",\"total\":\"2500\"}]', '0', '2705', '2705', 'DOXXO', '1', '2022-11-14 10:13:42', '6');
INSERT INTO `ventas` VALUES ('62', '10024', '18', '60', '[{\"id\":\"90\",\"descripcion\":\"PRECISSION\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"4500\",\"total\":\"4500\"},{\"id\":\"89\",\"descripcion\":\"Mouse G235\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"150\",\"total\":\"150\"}]', '0', '4650', '4650', 'Efectivo', '3', '2023-01-04 13:07:29', null);
