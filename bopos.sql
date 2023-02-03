/*
Navicat MySQL Data Transfer

Source Server         : XAMPP
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bopos

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-08-19 13:27:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cajas
-- ----------------------------
DROP TABLE IF EXISTS `cajas`;
CREATE TABLE `cajas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `estatus` int(5) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cajas
-- ----------------------------
INSERT INTO `cajas` VALUES ('1', 'Test2', null, '2022-06-30 08:40:59', '0');
INSERT INTO `cajas` VALUES ('2', 'Paul ', null, '2022-07-04 08:05:26', '0');
INSERT INTO `cajas` VALUES ('3', 'Paul2', '2022-07-05', '2022-07-04 08:10:29', '0');
INSERT INTO `cajas` VALUES ('4', 'caja 23', '2022-08-19', '2022-07-05 08:39:25', '0');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('18', 'Sheldon', '3', '155644654', 'ing.alfonso.marpez@gmail.com', '(477) 645-2888', 'AMAZON', '0000-00-00', '1', '2022-07-04 11:01:18', '2022-07-04 11:01:18');
INSERT INTO `clientes` VALUES ('19', 'Angel Romero', '1', '2147483647', 'angel@gmail.com', '(475) 222-2222', 'sep', '0000-00-00', '0', '0000-00-00 00:00:00', '2022-05-16 22:00:39');
INSERT INTO `clientes` VALUES ('20', 'PAUL GARCIA', '2', '415466546', 'PAUL@GMAIL.COM', '(477) 522-2222', 'CATA', '0000-00-00', '1', '2022-06-27 09:27:12', '2022-06-27 09:27:12');
INSERT INTO `clientes` VALUES ('21', 'Cliente Mostrador', '2', '0', 'na@gmail.com', '(777) 777-7777', 'NA', '0000-00-00', '2', '2022-05-17 22:29:19', '2022-05-17 22:29:19');

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
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
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
  `total_servicios` int(11) DEFAULT 0,
  `total_ventas` int(11) DEFAULT 0,
  `monto_total` float DEFAULT NULL,
  `estatus` int(11) DEFAULT 1,
  `id_usuario` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `id_caja` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of corte_caja
-- ----------------------------
INSERT INTO `corte_caja` VALUES ('7', '1500', '37410', '2022-07-04 09:54:46', '2022-07-05 08:38:29', '3', '7', '38910', '0', 'Alfonso Martinez Lopez', '3');
INSERT INTO `corte_caja` VALUES ('9', '150', '0', '2022-07-05 08:39:57', '2022-08-19 08:25:18', '0', '0', '150', '0', 'Alfonso Martinez Lopez', '4');

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
  `fechaAlta` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidospaqueteria
-- ----------------------------
INSERT INTO `pedidospaqueteria` VALUES ('3', 'Alfonso Mtz', 'Eufrasia', '37408', 'Leon II', 'Leon', 'Guanajuato', '4776477193', 'Mariano escobedo', 'Una casa ', '2022-06-24 14:42:14');
INSERT INTO `pedidospaqueteria` VALUES ('4', 'Paul ', 'Cima diamante', '37408', 'La cima', 'Leon', 'Guanajuato', '4776477193', 'asda', 'asdas', null);

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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('75', '7', '502', 'Lenovo', 'vistas/img/productos/502/789.jpg', '16', '1900', '2660', null, '2500', 'Lenovo 205', '1', '2', 'Core i7', '17', '3', '4', '5', '4', '2022-04-27 10:44:15');
INSERT INTO `productos` VALUES ('76', '10', '104', 'Logitech 205', 'vistas/img/productos/104/901.jpg', '19', '190', '266', null, '205', null, null, null, null, null, null, null, null, '4', '2022-04-29 21:12:25');
INSERT INTO `productos` VALUES ('77', '8', '200', 'HP', 'vistas/img/productos/default/anonymous.png', '16', '4800', '6720', null, '5200', 'HP', '6', '7', 'Core i7', '17', '3', '4', '5', '4', '2022-04-29 20:57:26');
INSERT INTO `productos` VALUES ('78', '10', '22', 'USB', 'vistas/img/productos/default/anonymous.png', '7', '50', '75', null, '80', null, null, null, null, null, null, null, null, '3', '2022-04-29 21:12:25');
INSERT INTO `productos` VALUES ('79', '10', '21', 'Auriculares', 'vistas/img/productos/default/anonymous.png', '2', '90', '120', null, '100', null, null, null, null, null, null, null, null, '9', '2022-04-29 21:12:25');
INSERT INTO `productos` VALUES ('80', '9', '500', 'HP', 'vistas/img/productos/default/anonymous.png', '12', '5200', '7280', null, '6000', 'HP', '6', '2', 'Core i7', '17', '3', '4', '5', '0', '2022-04-27 10:52:08');
INSERT INTO `productos` VALUES ('81', '11', '502', 'Chida', 'vistas/img/productos/default/anonymous.png', '19', '4000', '5600', null, '5000', null, null, null, null, null, null, null, null, '1', '2022-04-29 21:12:25');
INSERT INTO `productos` VALUES ('82', '13', '1000', 'Mouse Logitech', 'vistas/img/productos/default/anonymous.png', '10', '212', '296.8', null, '280', null, null, null, null, null, null, null, null, '0', '2022-04-27 10:53:21');
INSERT INTO `productos` VALUES ('83', '13', 'Teclado', 'Logitech', 'vistas/img/productos/default/anonymous.png', '18', '420', '588', null, '500', null, null, null, null, null, null, null, null, '2', '2022-05-17 22:29:19');
INSERT INTO `productos` VALUES ('84', '9', '2300', 'Lenovo', 'vistas/img/productos/default/anonymous.png', '10', '4100', '5740', null, '5000', 'Lenovo', '1', '2', 'Core i7', '17', '3', '4', '5', '2', '2022-06-27 09:27:12');
INSERT INTO `productos` VALUES ('85', '10', '1234', 'Cable RJ45 20 mts', 'vistas/img/productos/default/anonymous.png', '16', '90', '126', '121', '100', null, null, null, null, null, null, null, null, '4', '2022-07-04 11:01:18');

-- ----------------------------
-- Table structure for servicios
-- ----------------------------
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(255) COLLATE utf8_spanish_ci DEFAULT '',
  `id_empleado` int(11) DEFAULT NULL,
  `equipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `procesador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ram` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dd` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `so` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `falla` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `solucion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `obs` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_servicio` char(255) COLLATE utf8_spanish_ci DEFAULT '',
  `total` float DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `fecha_entrega` timestamp NULL DEFAULT NULL,
  `fecha_llegada` timestamp NULL DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES ('1', 'Angel Romero', '60', 'DELL', 'Lenovo', 'I7', '4', '500', 'W10', 'No enciende', 'Aun sin solucion', 'Llego bien', '3', '300', '2', '2022-06-23 00:00:00', '2022-06-23 00:00:00', '2');
INSERT INTO `servicios` VALUES ('2', 'Diana Gonzalez', '60', 'DELL', 'Lenovo', 'I7', '4', '500', 'W10', 'Falla de tipo 2', '', '', '2', '200', '1', '2022-06-23 00:00:00', '2022-06-16 00:00:00', '2');
INSERT INTO `servicios` VALUES ('3', 'Cliente venta mostrador', '61', 'DELL', 'Lenovo', 'I7', '8', '500', 'W10', 'No enciende', null, '', '3', '300', '4', '2022-06-22 00:00:00', '2022-04-01 00:00:00', '2');
INSERT INTO `servicios` VALUES ('4', 'Angel Romero', '60', 'DELL', 'HP', 'I7', '4', '500', 'W10', 'xeqwe', 'qweqw', 'das', '2', '200', '6', '2022-07-04 00:00:00', '2022-07-04 00:00:00', '3');
INSERT INTO `servicios` VALUES ('7', 'Cliente venta mostrador', '61', 'DELL', 'Lenovo', 'I7', '4', '500', 'W10', 'v', 'v', 'v', '2', '200', '1', '2022-07-05 00:00:00', '2022-07-04 00:00:00', '3');
INSERT INTO `servicios` VALUES ('8', 'Diana Gonzalez', '60', 'DELL', 'Lenovo', 'I7', '4', '500', 'W10', 'asd', 'asd', 'asd', '3', '300', '1', '2022-07-04 00:00:00', '2022-07-31 00:00:00', '3');

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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('60', 'Alfonso Martinez Lopez', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', '', '1', '2022-07-06 11:44:58', '2022-07-06 11:44:58');
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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
