/*
Navicat MySQL Data Transfer

Source Server         : XAMPP
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : bopos

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2023-04-13 14:01:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_facturacion
-- ----------------------------
DROP TABLE IF EXISTS `api_facturacion`;
CREATE TABLE `api_facturacion` (
  `usuario` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of api_facturacion
-- ----------------------------
INSERT INTO `api_facturacion` VALUES ('TWFyY29BZ3VpbGFy', 'aHNmYWN0dXJhY2lvbjIwMjMu', 'sandbox', '2023-03-08 11:06:20');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `img` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo1` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo2` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo3` text COLLATE utf8_spanish_ci NOT NULL,
  `estilo` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'sin-categoria', 'vistas/img/banner/default.jpg', '{\r\n	\"texto\": \"OFERTAS ESPECIALES\",\r\n	\"color\": \"#fff\"\r\n}', '{\r\n	\"texto\": \"50% off\",\r\n	\"color\": \"#fff\"\r\n}', '{\r\n	\"texto\": \"Termina el 31 de Octubre\",\r\n	\"color\": \"#fff\"\r\n}', 'textoDer', '2017-10-12 12:14:41');
INSERT INTO `banner` VALUES ('2', 'articulos-gratis', 'vistas/img/banner/ropa.jpg', '{\r\n	\"texto\": \"ARTÍCULOS GRATIS\",\r\n	\"color\": \"#fff\"\r\n}', '{\r\n\r\n	\"texto\": \"¡Entrega inmediata!\",\r\n\r\n	\"color\": \"#fff\"\r\n\r\n}', '{\r\n	\"texto\": \"Disfrútalo\",\r\n	\"color\": \"#fff\"\r\n}', 'textoIzq', '2017-10-12 12:05:43');
INSERT INTO `banner` VALUES ('3', 'desarrollo-web', 'vistas/img/banner/web.jpg', '{\r\n	\"texto\": \"OFERTAS ESPECIALES\",\r\n	\"color\": \"#fff\"\r\n}', '{\r\n\r\n	\"texto\": \"50% off\",\r\n\r\n	\"color\": \"#fff\"\r\n\r\n}', '{\r\n	\"texto\": \"Termina el 31 de Octubre\",\r\n	\"color\": \"#fff\"\r\n}', 'textoCentro', '2017-10-12 12:05:43');
INSERT INTO `banner` VALUES ('4', 'ropa-para-hombre', 'vistas/img/banner/ropaHombre.jpg', '{\r\n	\"texto\": \"OFERTAS ESPECIALES\",\r\n	\"color\": \"#fff\"\r\n}', '{\r\n\r\n	\"texto\": \"50% off\",\r\n\r\n	\"color\": \"#fff\"\r\n\r\n}', '{\r\n	\"texto\": \"Termina el 31 de Octubre\",\r\n	\"color\": \"#fff\"\r\n}', 'textoDer', '2017-10-12 12:06:15');

-- ----------------------------
-- Table structure for bodega
-- ----------------------------
DROP TABLE IF EXISTS `bodega`;
CREATE TABLE `bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` int(255) DEFAULT NULL,
  `cantidadLlegadas` int(11) DEFAULT NULL,
  `fecha_apertura` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tipo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of bodega
-- ----------------------------
INSERT INTO `bodega` VALUES ('1', '', '93', '10', '12', null, '1');

-- ----------------------------
-- Table structure for cabeceras
-- ----------------------------
DROP TABLE IF EXISTS `cabeceras`;
CREATE TABLE `cabeceras` (
  `id` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `palabrasClaves` text COLLATE utf8_spanish_ci NOT NULL,
  `portada` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of cabeceras
-- ----------------------------
INSERT INTO `cabeceras` VALUES ('1', 'inicio', 'Tienda Virtual', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusantium enim esse eos officiis sit officia', 'Lorem ipsum, dolor sit amet, consectetur, adipisicing, elit, Quisquam, accusantium, enim, esse', 'vistas/img/cabeceras/default.jpg', '2017-11-17 14:58:16');
INSERT INTO `cabeceras` VALUES ('2', 'desarrollo-web', 'Desarrollo Web', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusantium enim esse eos officiis sit officia', 'Lorem ipsum, dolor sit amet, consectetur, adipisicing, elit, Quisquam, accusantium, enim, esse', 'vistas/img/cabeceras/web.jpg', '2017-11-17 14:59:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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
INSERT INTO `cajas` VALUES ('8', '07022023', null, '2023-02-07 07:31:48', '1');

-- ----------------------------
-- Table structure for catalogocfdi
-- ----------------------------
DROP TABLE IF EXISTS `catalogocfdi`;
CREATE TABLE `catalogocfdi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usoCfdi` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of catalogocfdi
-- ----------------------------
INSERT INTO `catalogocfdi` VALUES ('1', 'G01', 'Adquisición de mercancías');
INSERT INTO `catalogocfdi` VALUES ('2', 'G02', 'Devoluciones, descuentos o bonificaciones');
INSERT INTO `catalogocfdi` VALUES ('3', 'G03', 'Gastos en general ');
INSERT INTO `catalogocfdi` VALUES ('4', 'I01', 'Construcciones ');
INSERT INTO `catalogocfdi` VALUES ('5', 'I02', 'Mobiliario y equipo de oficina por inversiones ');
INSERT INTO `catalogocfdi` VALUES ('6', 'I03', 'Equipo de transporte');
INSERT INTO `catalogocfdi` VALUES ('7', 'I04', 'Equipo de cómputo y accesorios');
INSERT INTO `catalogocfdi` VALUES ('8', 'I05', 'Dados, troqueles, moldes, matrices y herramental ');
INSERT INTO `catalogocfdi` VALUES ('9', 'I06', '	Comunicaciones telefónicas');
INSERT INTO `catalogocfdi` VALUES ('10', 'I07', 'Comunicaciones satelitales');
INSERT INTO `catalogocfdi` VALUES ('11', 'I08', 'Otra maquinaria y equipo');
INSERT INTO `catalogocfdi` VALUES ('12', 'D01', 'Honorarios médicos, dentales y gastos hospitalarios.');
INSERT INTO `catalogocfdi` VALUES ('13', 'D02', 'Gastos médicos por incapacidad o discapacidad ');
INSERT INTO `catalogocfdi` VALUES ('14', 'D03', 'Gastos funerales.');
INSERT INTO `catalogocfdi` VALUES ('15', 'D04', 'Donativos');
INSERT INTO `catalogocfdi` VALUES ('16', 'D05', 'Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación). ');
INSERT INTO `catalogocfdi` VALUES ('17', 'D06', 'Aportaciones voluntarias al SAR. ');
INSERT INTO `catalogocfdi` VALUES ('18', 'D07', 'Primas por seguros de gastos médicos. ');
INSERT INTO `catalogocfdi` VALUES ('19', 'D08', 'Gastos de transportación escolar obligatoria.');
INSERT INTO `catalogocfdi` VALUES ('20', 'D09', 'Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones. ');
INSERT INTO `catalogocfdi` VALUES ('21', 'D10', 'Pagos por servicios educativos (colegiaturas)');
INSERT INTO `catalogocfdi` VALUES ('22', 'CP01', 'Pagos');
INSERT INTO `catalogocfdi` VALUES ('23', 'CN01', 'Nómina');
INSERT INTO `catalogocfdi` VALUES ('24', 'S01', 'Sin Efectos Fiscales');

-- ----------------------------
-- Table structure for catalogoclavessat
-- ----------------------------
DROP TABLE IF EXISTS `catalogoclavessat`;
CREATE TABLE `catalogoclavessat` (
  `id_claves` int(5) NOT NULL AUTO_INCREMENT,
  `clave` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_claves`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of catalogoclavessat
-- ----------------------------
INSERT INTO `catalogoclavessat` VALUES ('1', 'H87', '2023-04-11 14:19:11');

-- ----------------------------
-- Table structure for catalogoestados
-- ----------------------------
DROP TABLE IF EXISTS `catalogoestados`;
CREATE TABLE `catalogoestados` (
  `id_estado` int(255) NOT NULL AUTO_INCREMENT,
  `id_entidadFederativa` int(255) DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_pais` int(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of catalogoestados
-- ----------------------------
INSERT INTO `catalogoestados` VALUES ('2', '1', 'AGUASCALIENTES', '89', null);
INSERT INTO `catalogoestados` VALUES ('3', '2', 'BAJA CALIFORNIA', '89', null);
INSERT INTO `catalogoestados` VALUES ('4', '3', 'BAJA CALIFORNIA SUR', '89', null);
INSERT INTO `catalogoestados` VALUES ('5', '4', 'CAMPECHE', '89', null);
INSERT INTO `catalogoestados` VALUES ('6', '5', 'COAHUILA DE ZARAGOZA', '89', null);
INSERT INTO `catalogoestados` VALUES ('7', '6', 'COLIMA', '89', null);
INSERT INTO `catalogoestados` VALUES ('8', '7', 'CHIAPAS', '89', null);
INSERT INTO `catalogoestados` VALUES ('9', '8', 'CHIHUAHUA', '89', null);
INSERT INTO `catalogoestados` VALUES ('10', '9', 'CIUDAD DE MEXICO', '89', null);
INSERT INTO `catalogoestados` VALUES ('11', '10', 'DURANGO', '89', null);
INSERT INTO `catalogoestados` VALUES ('12', '11', 'GUANAJUATO', '89', null);
INSERT INTO `catalogoestados` VALUES ('13', '12', 'GUERRERO', '89', null);
INSERT INTO `catalogoestados` VALUES ('14', '13', 'HIDALGO', '89', null);
INSERT INTO `catalogoestados` VALUES ('15', '14', 'JALISCO', '89', null);
INSERT INTO `catalogoestados` VALUES ('16', '15', 'ESTADO DE MEXICO', '89', null);
INSERT INTO `catalogoestados` VALUES ('17', '16', 'MICHOACAN DE OCAMPO', '89', null);
INSERT INTO `catalogoestados` VALUES ('18', '17', 'MORELOS', '89', null);
INSERT INTO `catalogoestados` VALUES ('19', '18', 'NAYARIT', '89', null);
INSERT INTO `catalogoestados` VALUES ('20', '19', 'NUEVO LEON', '89', null);
INSERT INTO `catalogoestados` VALUES ('21', '20', 'OAXACA', '89', null);
INSERT INTO `catalogoestados` VALUES ('22', '21', 'PUEBLA', '89', null);
INSERT INTO `catalogoestados` VALUES ('23', '22', 'QUERETARO DE ARTEAGA', '89', null);
INSERT INTO `catalogoestados` VALUES ('24', '23', 'QUINTANA ROO', '89', null);
INSERT INTO `catalogoestados` VALUES ('25', '24', 'SAN LUIS POTOSI', '89', null);
INSERT INTO `catalogoestados` VALUES ('26', '25', 'SINALOA', '89', null);
INSERT INTO `catalogoestados` VALUES ('27', '26', 'SONORA', '89', null);
INSERT INTO `catalogoestados` VALUES ('28', '27', 'TABASCO', '89', null);
INSERT INTO `catalogoestados` VALUES ('29', '28', 'TAMAULIPAS', '89', null);
INSERT INTO `catalogoestados` VALUES ('30', '29', 'TLAXCALA', '89', null);
INSERT INTO `catalogoestados` VALUES ('31', '30', 'VERACRUZ DE IGNACIO DE LA LLAVE', '89', null);
INSERT INTO `catalogoestados` VALUES ('32', '31', 'YUCATAN', '89', null);
INSERT INTO `catalogoestados` VALUES ('33', '32', 'ZACATECAS', '89', null);
INSERT INTO `catalogoestados` VALUES ('34', null, 'DISTRITO FEDERAL', '89', null);

-- ----------------------------
-- Table structure for catalogoregimen
-- ----------------------------
DROP TABLE IF EXISTS `catalogoregimen`;
CREATE TABLE `catalogoregimen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(255) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of catalogoregimen
-- ----------------------------
INSERT INTO `catalogoregimen` VALUES ('1', '605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios');
INSERT INTO `catalogoregimen` VALUES ('2', '606', 'Arrendamiento');
INSERT INTO `catalogoregimen` VALUES ('3', '608', 'Demás ingresos');
INSERT INTO `catalogoregimen` VALUES ('4', '610', 'Residentes en el Extranjero sin Establecimiento Pemanente en México');
INSERT INTO `catalogoregimen` VALUES ('5', '611', 'Ingresos por Dividendos (socios y accionistas)');
INSERT INTO `catalogoregimen` VALUES ('6', '612', 'Personas Físicas con Actividades Empresariales y Profesionales');
INSERT INTO `catalogoregimen` VALUES ('7', '614', 'Ingresos por intereses ');
INSERT INTO `catalogoregimen` VALUES ('8', '615', 'Régimen de los ingresos por obtención de premios');
INSERT INTO `catalogoregimen` VALUES ('9', '616', 'Sin obligaciones fiscales');
INSERT INTO `catalogoregimen` VALUES ('10', '621', 'Incorporación Fiscal');
INSERT INTO `catalogoregimen` VALUES ('11', '622', 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras');
INSERT INTO `catalogoregimen` VALUES ('12', '625', 'Régimen de las Actividades Empresariales con Ingresos a tráves de Plataformas Tecnologías ');
INSERT INTO `catalogoregimen` VALUES ('13', '626', 'Régimen Simplificado de Confianza');
INSERT INTO `catalogoregimen` VALUES ('14', '629', 'De los Regímenes Fiscales Preferentes y de las Empresas Multinacionales');
INSERT INTO `catalogoregimen` VALUES ('15', '639', 'Enajenación de acciones en bolsa de valores');

-- ----------------------------
-- Table structure for catalogounidaessat
-- ----------------------------
DROP TABLE IF EXISTS `catalogounidaessat`;
CREATE TABLE `catalogounidaessat` (
  `id_unidad` int(255) NOT NULL AUTO_INCREMENT,
  `unidad` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of catalogounidaessat
-- ----------------------------
INSERT INTO `catalogounidaessat` VALUES ('1', 'Pieza', '2023-04-11 14:18:58');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `precioOferta` float NOT NULL,
  `descuentoOferta` int(11) NOT NULL,
  `imgOferta` text COLLATE utf8_spanish_ci NOT NULL,
  `finOferta` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('7', 'Desktop', 'desktop', '1', '0', '0', '0', '', '0000-00-00 00:00:00', '2023-02-23 15:23:16');
INSERT INTO `categorias` VALUES ('8', 'Laptops', 'laptop', '1', '0', '0', '0', '', '0000-00-00 00:00:00', '2023-02-23 15:23:16');
INSERT INTO `categorias` VALUES ('9', 'All in One', 'all-in-one', '1', '0', '0', '0', '', '0000-00-00 00:00:00', '2023-02-23 15:23:16');
INSERT INTO `categorias` VALUES ('10', 'Accesorios', 'accesorios', '1', '1', '9.99', '0', 'vistas/img/ofertas/cursos.jpg', '2018-03-29 23:59:59', '2023-02-23 15:23:23');
INSERT INTO `categorias` VALUES ('11', 'Gaming', 'gaming', '1', '0', '0', '0', '', '0000-00-00 00:00:00', '2023-02-23 15:23:24');
INSERT INTO `categorias` VALUES ('12', 'Pantallas', '', '0', '0', '0', '0', '', '0000-00-00 00:00:00', '2023-04-12 11:42:16');

-- ----------------------------
-- Table structure for categoriaspos
-- ----------------------------
DROP TABLE IF EXISTS `categoriaspos`;
CREATE TABLE `categoriaspos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `ruta` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of categoriaspos
-- ----------------------------
INSERT INTO `categoriaspos` VALUES ('7', 'Desktop', 'computadoras', '2023-02-14 10:58:05');
INSERT INTO `categoriaspos` VALUES ('8', 'Laptops', 'computadoras', '2023-02-14 10:58:10');
INSERT INTO `categoriaspos` VALUES ('9', 'All in One', 'computadoras', '2023-02-14 10:58:10');
INSERT INTO `categoriaspos` VALUES ('10', 'Accesesorios', 'accesorios', '2023-02-14 10:58:22');
INSERT INTO `categoriaspos` VALUES ('11', 'Gabinetes', 'otros', '2023-02-14 10:58:26');
INSERT INTO `categoriaspos` VALUES ('12', 'Memorias', 'accesorios', '2023-02-14 10:58:30');
INSERT INTO `categoriaspos` VALUES ('13', 'Gaming', 'gaming', '2023-02-14 10:58:33');

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `frecuente` int(11) NOT NULL COMMENT '1 = Cliente frecuente 2 = No frecuente',
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('18', 'Sheldon', '3', 'ing.alfonso.marpez@gmail.com', '(477) 645-2888', '5', '2023-01-04 14:07:29', '2023-01-04 13:07:29');
INSERT INTO `clientes` VALUES ('19', 'Angel Romero', '1', 'angel@gmail.com', '(475) 222-2222', '7', '2022-11-10 11:11:03', '2022-11-10 10:11:03');
INSERT INTO `clientes` VALUES ('20', 'PAUL GARCIA', '2', 'PAUL@GMAIL.COM', '(477) 522-2222', '5', '2022-11-10 13:04:56', '2022-11-10 12:04:56');
INSERT INTO `clientes` VALUES ('21', 'Cliente Mostrador', '2', 'na@gmail.com', '(777) 777-7777', '8', '2022-11-10 11:10:38', '2022-11-10 10:10:39');
INSERT INTO `clientes` VALUES ('61', 'Miguel Mendoza Gaona', '1', 'ponchomarpez@gmail.com', '(111) 111-1111', '0', '0000-00-00 00:00:00', '2023-03-17 13:49:14');
INSERT INTO `clientes` VALUES ('62', 'MARCO ANTONIO AGUILAR OLMEDO', '1', 'facturacionhellssystems@gmail.com', '(477) 777-7777', '0', '0000-00-00 00:00:00', '2023-04-13 13:17:09');

-- ----------------------------
-- Table structure for cliente_infofac
-- ----------------------------
DROP TABLE IF EXISTS `cliente_infofac`;
CREATE TABLE `cliente_infofac` (
  `id_cliente` int(11) DEFAULT NULL,
  `Street` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ExteriorNumber` int(11) DEFAULT NULL,
  `InteriorNumber` int(11) DEFAULT NULL,
  `Neighborhood` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ZipCode` int(255) DEFAULT NULL,
  `Locality` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Municipality` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `StateF` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Country` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Rfc` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CfdiUse` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TaxZipCode` int(255) DEFAULT NULL,
  `FiscalRegime` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of cliente_infofac
-- ----------------------------
INSERT INTO `cliente_infofac` VALUES ('61', 'Eufrasia Pantoja ', '123', '0', 'León II', '37502', null, 'León', 'GUANAJUATO', 'MEXICO', 'MALA941104D14', 'G03', null, '626');
INSERT INTO `cliente_infofac` VALUES ('62', 'CLAVELES', '208', '0', 'JARDINES DE JEREZ 1A SECCION', '37530', null, 'LEON', 'GUANAJUATO', 'MEXICO', 'AUOM880720FSA', 'G03', null, '626');

-- ----------------------------
-- Table structure for comentarios
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `calificacion` float NOT NULL,
  `comentario` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of comentarios
-- ----------------------------
INSERT INTO `comentarios` VALUES ('1', '2', '500', '0', '', '2018-06-14 10:50:09');

-- ----------------------------
-- Table structure for comercio
-- ----------------------------
DROP TABLE IF EXISTS `comercio`;
CREATE TABLE `comercio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `impuesto` float NOT NULL,
  `envioNacional` float NOT NULL,
  `envioInternacional` float NOT NULL,
  `tasaMinimaNal` float NOT NULL,
  `tasaMinimaInt` float NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `modoPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `clienteIdPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `llaveSecretaPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `modoPayu` text COLLATE utf8_spanish_ci NOT NULL,
  `merchantIdPayu` int(11) NOT NULL,
  `accountIdPayu` int(11) NOT NULL,
  `apiKeyPayu` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of comercio
-- ----------------------------
INSERT INTO `comercio` VALUES ('1', '19', '1', '2', '10', '15', 'MX', 'sandbox', 'AecffvSZfOgj6g1MkrVmz12ACMES2-InggmWCpU5CblR-AT2BX_aogxjXKSIsxQEn9oy1qo9iHVaHUu9YjaNT3nYgqBLiqbmurxCFOSArxVZoAACwevlpHHZDix0_', 'EAx1SVMHGV6MJKwl-pnOSzaJASlAINZdYRdS--EDTNrHqJ9R3T1gdXXVPCy6UdsKWR7N6yPR8oN9wtrImfRegciHQ1oCyg1xQQWbbv8-qfAlY5FM4R3jQa', 'sandbox', '508029', '512321', '4Vj8eK4rloUd272L48hsrarnUA');

-- ----------------------------
-- Table structure for complemento_producto
-- ----------------------------
DROP TABLE IF EXISTS `complemento_producto`;
CREATE TABLE `complemento_producto` (
  `id_producto` int(5) DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ram` int(5) DEFAULT NULL,
  `dd` int(5) DEFAULT NULL,
  `procesador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tam_pantalla` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `graficos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ssd` int(5) DEFAULT NULL,
  `hhd` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of complemento_producto
-- ----------------------------
INSERT INTO `complemento_producto` VALUES ('8', 'LENOVO', '6', null, 'ICORE 5', '12.5', '3', '4', '5');
INSERT INTO `complemento_producto` VALUES ('9', 'HP', '6', null, 'ICORE 5', '12', '3', '4', '5');

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
INSERT INTO `componentes` VALUES ('1', '4', 'GB', null, 'RAM', '2022-04-21 11:39:17');
INSERT INTO `componentes` VALUES ('2', '4', 'GB', null, 'DD', '2022-04-21 11:39:19');
INSERT INTO `componentes` VALUES ('3', '4', 'GB', null, 'Graphics', '2022-04-21 11:39:20');
INSERT INTO `componentes` VALUES ('4', '128', 'GB', null, 'SSD', '2022-04-21 11:39:20');
INSERT INTO `componentes` VALUES ('5', '500', 'GB', null, 'HHD', '2022-04-21 11:39:21');
INSERT INTO `componentes` VALUES ('6', '8', 'GB', null, 'RAM', '2022-04-22 10:26:25');
INSERT INTO `componentes` VALUES ('7', '8', 'GB', null, 'DD', '2022-04-22 10:29:16');

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `envio` int(11) NOT NULL,
  `metodo` text COLLATE utf8_spanish_ci NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `detalle` text COLLATE utf8_spanish_ci,
  `pago` text COLLATE utf8_spanish_ci,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES ('12', '2', '496', '0', 'paypal', 'tutorialesatualcance-buyer@hotmail.com', '1 Main St, San Jose, CA, 95131', 'US', '0', '', '', '2017-11-02 14:46:59');
INSERT INTO `compras` VALUES ('13', '2', '464', '0', 'paypal', 'tutorialesatualcance-buyer@hotmail.com', '1 Main St, San Jose, CA, 95131', 'US', '0', '', '', '2017-11-02 14:47:00');
INSERT INTO `compras` VALUES ('14', '2', '497', '0', 'paypal', 'tutorialesatualcance-buyer@hotmail.com', '1 Main St, San Jose, CA, 95131', 'US', '0', '', '', '2017-11-02 15:34:05');
INSERT INTO `compras` VALUES ('15', '2', '500', '0', 'payu', 'correo@test.com', '', '', '0', '', '', '2017-11-03 13:33:54');
INSERT INTO `compras` VALUES ('16', '2', '184', '0', 'payu', 'correo@test.com', '', '', '0', '', '', '2017-11-03 13:33:54');
INSERT INTO `compras` VALUES ('17', '2', '499', '0', 'payu', 'ejemplo@test.com', '', '', '0', '', '', '2017-11-03 14:00:52');
INSERT INTO `compras` VALUES ('18', '2', '500', '0', 'paypal', 'tutorialesatualcance-buyer@hotmail.com', '1 Main St, San Jose, CA, 95131', 'US', '0', '', '', '2018-06-14 10:50:09');

-- ----------------------------
-- Table structure for comp_prod_factura
-- ----------------------------
DROP TABLE IF EXISTS `comp_prod_factura`;
CREATE TABLE `comp_prod_factura` (
  `IdentificationNumber` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Unit` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UnitCode` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Taxes` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ObjetoImp` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of comp_prod_factura
-- ----------------------------
INSERT INTO `comp_prod_factura` VALUES (null, null, null, null, null, null, null, null, '6');
INSERT INTO `comp_prod_factura` VALUES ('HUB1873S', 'HUB PARA ENTRADA DE USB 3.0', 'HUB', null, 'Pieza', 'H87', '8', null, '7');
INSERT INTO `comp_prod_factura` VALUES ('HP973781', 'COMPUTADORA ALL IN ONE HP MODELO 2022', 'HP', null, 'Pieza', 'H87', '.16', '01', '9');
INSERT INTO `comp_prod_factura` VALUES ('MSI294734', 'COMPUTADOR DE ESCRITORIO PARA GAMER', 'MSI', null, 'Pieza', 'H87', '.08', '01', '10');
INSERT INTO `comp_prod_factura` VALUES ('LOGTC186', 'TACLADO GENERICO EN ESPAÑOL PARA COMPUTADORA', 'TECLADO LOGITECH', null, 'Pieza', 'H87', '.16', '01', '11');
INSERT INTO `comp_prod_factura` VALUES ('AUD4231', 'ADIFONOS DE 1M ALAMABRICOS', 'AUDIFONOS', null, 'Pieza', 'H87', '.16', '01', '12');
INSERT INTO `comp_prod_factura` VALUES ('GAB486', 'GABINETE PARA MONTAR ', 'GABINETE', null, 'Pieza', 'H87', '.16', '01', '14');
INSERT INTO `comp_prod_factura` VALUES ('PAS53998', 'PASTA TERMICA PARA PROCESADOR', 'PASTA TERMICA', null, 'Pieza', 'H87', '.16', '01', '15');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of corte_caja
-- ----------------------------
INSERT INTO `corte_caja` VALUES ('7', '1500', '37410', '2022-07-04 09:54:46', '2022-07-05 08:38:29', '3', '7', '38910', '0', 'Alfonso Martinez Lopez', '3');
INSERT INTO `corte_caja` VALUES ('9', '150', '0', '2022-07-05 08:39:57', '2022-08-19 08:25:18', '0', '0', '150', '0', 'Alfonso Martinez Lopez', '4');
INSERT INTO `corte_caja` VALUES ('10', '1000', '11526', '2022-08-29 06:56:05', '2022-08-29 06:56:36', '1', '2', '12526', '0', 'Alfonso Martinez Lopez', '5');
INSERT INTO `corte_caja` VALUES ('11', '2000', '15437', '2022-11-09 05:31:01', '2022-11-10 06:52:10', '1', '6', '17437', '0', 'Alfonso Martinez Lopez', '6');
INSERT INTO `corte_caja` VALUES ('12', '1050.5', '588', '2022-11-10 07:01:29', '2022-11-10 07:05:20', '0', '1', '1638.5', '0', 'Alfonso Martinez Lopez', '7');
INSERT INTO `corte_caja` VALUES ('13', '0', null, '2023-02-07 07:33:29', null, '0', '0', null, '1', '', '8');

-- ----------------------------
-- Table structure for deseos
-- ----------------------------
DROP TABLE IF EXISTS `deseos`;
CREATE TABLE `deseos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of deseos
-- ----------------------------
INSERT INTO `deseos` VALUES ('1', '6', '3', '2022-11-22 11:58:32');
INSERT INTO `deseos` VALUES ('2', '6', '469', '2022-11-22 11:58:33');

-- ----------------------------
-- Table structure for historial_mov_bodega
-- ----------------------------
DROP TABLE IF EXISTS `historial_mov_bodega`;
CREATE TABLE `historial_mov_bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_bodega` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad` int(255) DEFAULT NULL,
  `cantidadLlegadas` int(255) DEFAULT NULL,
  `tipo_movimiento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_mov` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of historial_mov_bodega
-- ----------------------------
INSERT INTO `historial_mov_bodega` VALUES ('21', '10', '35', '35', '1', '2023-01-24 17:25:02', '60');
INSERT INTO `historial_mov_bodega` VALUES ('22', '10', '10', '0', '0', '2023-01-24 17:25:24', '60');
INSERT INTO `historial_mov_bodega` VALUES ('23', '10', '0', '10', '1', '2023-01-24 17:25:46', '60');
INSERT INTO `historial_mov_bodega` VALUES ('24', '1', '10', '12', '1', '2023-02-22 20:25:27', '60');

-- ----------------------------
-- Table structure for pedidospaqueteria
-- ----------------------------
DROP TABLE IF EXISTS `pedidospaqueteria`;
CREATE TABLE `pedidospaqueteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `nombreCompleto` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `calle` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idCiudad` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `idEstado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `telefono` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `entreCalles` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `referencias` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `fechaAlta` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `archivo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidospaqueteria
-- ----------------------------
INSERT INTO `pedidospaqueteria` VALUES ('3', null, 'Alfonso Mtz', 'Eufrasia', '37408', 'Leon II', 'Leon', 'Guanajuato', '4776477193', 'Mariano escobedo', 'Una casa 12', '3', '2023-02-07 10:22:33', null);
INSERT INTO `pedidospaqueteria` VALUES ('4', null, 'Paul ', 'Cima diamante', '37408', 'La cima', 'Leon', 'Guanajuato', '4776477193', 'asda', 'asdas11', '2', '2023-01-23 15:54:35', null);
INSERT INTO `pedidospaqueteria` VALUES ('6', null, 'MAXIMINO', 'una calle', '37490', 'una colonia', 'tamaulipas', 'Guanajuato', '688888888', 'unas calles', 'otras calles', '4', '2023-01-23 11:39:43', null);
INSERT INTO `pedidospaqueteria` VALUES ('10', null, 'Jose Eduardo Ambriz Hernandez', 'Damasco #1052', '37408', 'Cima Diamante', 'León', 'Guanajuato', '4775862182', 'adasda', 'asdasd', '1', '2023-01-23 11:39:49', null);
INSERT INTO `pedidospaqueteria` VALUES ('12', '7595123', 'JOEL MIJANGOS ZARATE', 'MANUEL PATRON  118', '37408', 'LEON II', 'León', 'Guanajuato', '123123', 'dasdasd', 'asdasda', '2', '2023-02-07 12:39:06', './uploads/InformeTrimestral oct-dec2022_Alfonso.docx');
INSERT INTO `pedidospaqueteria` VALUES ('18', '8529637411', 'Jose Eduardo Ambriz Hernandez', 'Damasco #1052', '37408', 'Cima Diamante', 'León', 'Guanajuato', '4775862182', 'ashdkaskj', 'ahdkjashkdj', null, null, 'firma2023.png');

-- ----------------------------
-- Table structure for pedido_paqueteria_hmov
-- ----------------------------
DROP TABLE IF EXISTS `pedido_paqueteria_hmov`;
CREATE TABLE `pedido_paqueteria_hmov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paqueteria` int(255) DEFAULT NULL,
  `fecha_mov` datetime DEFAULT NULL,
  `estatus` tinyint(255) DEFAULT NULL,
  `id_usuario` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of pedido_paqueteria_hmov
-- ----------------------------
INSERT INTO `pedido_paqueteria_hmov` VALUES ('7', '3', '2023-01-24 17:15:14', '1', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('8', '3', '2023-01-24 17:15:19', '2', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('9', '3', '2023-01-24 17:15:22', '3', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('10', '3', '2023-01-24 17:15:25', '4', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('11', '3', '2023-01-24 17:15:29', '5', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('12', '11', '2023-01-24 17:33:08', '1', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('13', '3', '2023-02-03 22:39:51', '2', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('14', '11', '2023-02-03 22:53:18', '1', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('15', '12', '2023-02-03 22:53:22', '2', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('16', '3', '2023-02-07 17:22:33', '3', 'admin');
INSERT INTO `pedido_paqueteria_hmov` VALUES ('17', '14', '2023-02-07 18:37:25', '5', 'admin');

-- ----------------------------
-- Table structure for plantilla
-- ----------------------------
DROP TABLE IF EXISTS `plantilla`;
CREATE TABLE `plantilla` (
  `id` int(11) NOT NULL,
  `barraSuperior` text COLLATE utf8_spanish_ci NOT NULL,
  `textoSuperior` text COLLATE utf8_spanish_ci NOT NULL,
  `colorFondo` text COLLATE utf8_spanish_ci NOT NULL,
  `colorTexto` text COLLATE utf8_spanish_ci NOT NULL,
  `logo` text COLLATE utf8_spanish_ci NOT NULL,
  `icono` text COLLATE utf8_spanish_ci NOT NULL,
  `redesSociales` text COLLATE utf8_spanish_ci NOT NULL,
  `apiFacebook` text COLLATE utf8_spanish_ci NOT NULL,
  `pixelFacebook` text COLLATE utf8_spanish_ci NOT NULL,
  `googleAnalytics` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of plantilla
-- ----------------------------
INSERT INTO `plantilla` VALUES ('1', '#e9171b', '#ffffff', '#ae0000', '#fdfdfd', 'vistas/img/plantilla/logo.png', 'vistas/img/plantilla/icono.png', '[{\"red\":\"fa-facebook\",\"estilo\":\"facebookBlanco\",\"url\":\"http://facebook.com/hs\",\"activo\":1},{\"red\":\"fa-youtube\",\"estilo\":\"youtubeBlanco\",\"url\":\"http://youtube.com/hs\",\"activo\":1},{\"red\":\"fa-twitter\",\"estilo\":\"twitterBlanco\",\"url\":\"http://twitter.com/hs\",\"activo\":1},{\"red\":\"fa-google-plus\",\"estilo\":\"google-plusBlanco\",\"url\":\"http://google.com/hs\",\"activo\":1},{\"red\":\"fa-instagram\",\"estilo\":\"instagramBlanco\",\"url\":\"http://instagram.com/hs\",\"activo\":1}]', '<script>   window.fbAsyncInit = function() {     FB.init({       appId      : \'131737410786111\',       cookie     : true,       xfbml      : true,       version    : \'v2.10\'     });            FB.AppEvents.logPageView();             };    (function(d, s, id){      var js, fjs = d.getElementsByTagName(s)[0];      if (d.getElementById(id)) {return;}      js = d.createElement(s); js.id = id;      js.src = \"https://connect.facebook.net/en_US/sdk.js\";      fjs.parentNode.insertBefore(js, fjs);    }(document, \'script\', \'facebook-jssdk\'));  </script>\r\n      		\r\n      		\r\n      		', '<!-- Facebook Pixel Code --> 	<script> 	  !function(f,b,e,v,n,t,s) 	  {if(f.fbq)return;n=f.fbq=function(){n.callMethod? 	  n.callMethod.apply(n,arguments):n.queue.push(arguments)}; 	  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\'; 	  n.queue=[];t=b.createElement(e);t.async=!0; 	  t.src=v;s=b.getElementsByTagName(e)[0]; 	  s.parentNode.insertBefore(t,s)}(window, document,\'script\', 	  \'https://connect.facebook.net/en_US/fbevents.js\'); 	  fbq(\'init\', \'131737410786111\'); 	  fbq(\'track\', \'PageView\'); 	</script> 	<noscript><img height=\"1\" width=\"1\" style=\"display:none\" 	  src=\"https://www.facebook.com/tr?id=149877372404434&ev=PageView&noscript=1\" 	/></noscript> <!-- End Facebook Pixel Code -->    \r\n  			    \r\n  			    \r\n  			', '<!-- Global site tag (gtag.js) - Google Analytics --> 	<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-999999-1\"></script> 	<script> 	  window.dataLayer = window.dataLayer || []; 	  function gtag(){dataLayer.push(arguments);} 	  gtag(\'js\', new Date());  	  gtag(\'config\', \'UA-9999999-1\'); 	</script>      \r\n            \r\n            \r\n            \r\n            \r\n  			      \r\n  			', '2023-02-16 10:48:52');

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
  `precio` float DEFAULT NULL,
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
  `vistas` int(11) DEFAULT NULL,
  `titulo` text COLLATE utf8_spanish_ci,
  `portada` text COLLATE utf8_spanish_ci,
  `nuevo` int(11) DEFAULT NULL,
  `tipo` text COLLATE utf8_spanish_ci,
  `ruta` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `oferta` int(11) DEFAULT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('89', '13', 'Logitech', 'Mouse G235', 'vistas/img/productos/default/anonymous.png', '4', null, '100', '140', '150', '120', 'DELL', '1', null, 'ICORE 5', '12', '3', '4', '5', null, null, null, null, null, null, null, '1', '2023-01-04 13:07:28');
INSERT INTO `productos` VALUES ('90', '7', '100', 'PRECISSION', 'vistas/img/productos/default/anonymous.png', '9', null, '3000', '4200', '4500', '4000', 'DELL', '1', null, 'ICORE 5', '12', '3', '4', '5', null, null, null, null, null, null, null, '1', '2023-01-04 13:07:28');
INSERT INTO `productos` VALUES ('91', '11', '2131', 'PRECISSION', 'vistas/img/productos/default/anonymous.png', '12', null, '222', '310.8', '222', '222', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '2023-01-11 10:38:05');
INSERT INTO `productos` VALUES ('92', '12', 'Logitech', 'PRECISSION', 'vistas/img/productos/default/anonymous.png', '12', null, '90', '126', '125', '120', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '2023-01-18 14:30:02');
INSERT INTO `productos` VALUES ('93', '13', 'LG', 'Mouse', 'vistas/img/productos/default/anonymous.png', '65', null, '300', '420', '435', '420', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '2023-01-24 10:25:24');

-- ----------------------------
-- Table structure for productosfacturas
-- ----------------------------
DROP TABLE IF EXISTS `productosfacturas`;
CREATE TABLE `productosfacturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_categoria` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` float(255,0) DEFAULT NULL,
  `precio_compra` float(255,0) DEFAULT NULL,
  `precio_venta` float(255,0) DEFAULT NULL,
  `precio_ml` float(255,0) DEFAULT NULL,
  `precio_cliente` float(255,0) DEFAULT NULL,
  `stock` int(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of productosfacturas
-- ----------------------------
INSERT INTO `productosfacturas` VALUES ('1', '47759', 'TV', 'Televisión de 43 pulgadas', '10', 'vistas/img/productos/default/anonymous.png', '0', '1000', '1250', '1300', '1100', null, '2023-04-11 11:28:59');
INSERT INTO `productosfacturas` VALUES ('4', '1-A1', 'USB', 'MEMORIA USB DE 32 GB COLOR AZUL METALICO MUY NICE ALV ', '10', 'vistas/img/productos/default/anonymous.png', null, '120', '135', '130', '125', null, null);
INSERT INTO `productosfacturas` VALUES ('5', 'PAN29180', 'PANTALLA SONY', 'PANTALLA OLED DE 50 PULGADAS MARCA SONY', '12', 'vistas/img/productos/default/anonymous.png', null, '20000', '26500', '26000', '25000', null, null);
INSERT INTO `productosfacturas` VALUES ('6', 'MOU1290', 'MOUSE ', 'MOUSE INALAMBRICO GAMING CON 400 DPI´S', '11', 'vistas/img/productos/default/anonymous.png', null, '500', '550', '525', '520', null, null);
INSERT INTO `productosfacturas` VALUES ('7', 'HUB1873S', 'HUB', 'HUB PARA ENTRADA DE USB 3.0', '10', 'vistas/img/productos/default/anonymous.png', null, '500', '515', '512', '510', null, null);
INSERT INTO `productosfacturas` VALUES ('8', 'LENAI8471', 'LENOVO AIR', 'COMPUTADORA PORTATIL MARCA LENOVO AIR MODELO 2021', '8', 'vistas/img/productos/default/anonymous.png', null, '5000', '5300', '5250', '5200', null, null);
INSERT INTO `productosfacturas` VALUES ('9', 'HP973781', 'HP', 'COMPUTADORA ALL IN ONE HP MODELO 2022', '9', 'vistas/img/productos/default/anonymous.png', null, '4500', '4800', '4700', '4600', null, null);
INSERT INTO `productosfacturas` VALUES ('10', 'MSI294734', 'MSI', 'COMPUTADOR DE ESCRITORIO PARA GAMER', '11', 'vistas/img/productos/default/anonymous.png', null, '5000', '5500', '5300', '5200', null, null);
INSERT INTO `productosfacturas` VALUES ('11', 'LOGTC186', 'TECLADO LOGITECH', 'TACLADO GENERICO EN ESPAÑOL PARA COMPUTADORA', '10', 'vistas/img/productos/default/anonymous.png', null, '450', '550', '520', '500', null, null);
INSERT INTO `productosfacturas` VALUES ('12', 'AUD4231', 'AUDIFONOS', 'ADIFONOS DE 1M ALAMABRICOS', '10', 'vistas/img/productos/default/anonymous.png', null, '120', '135', '130', '125', null, null);
INSERT INTO `productosfacturas` VALUES ('14', 'GAB486', 'GABINETE', 'GABINETE PARA MONTAR ', '10', 'vistas/img/productos/default/anonymous.png', null, '2500', '2800', '2700', '2600', null, null);
INSERT INTO `productosfacturas` VALUES ('15', 'PAS53998', 'PASTA TERMICA', 'PASTA TERMICA PARA PROCESADOR', '10', 'vistas/img/productos/default/anonymous.png', null, '90', '115', '112', '100', null, null);

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
  `cargador` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of servicios
-- ----------------------------
INSERT INTO `servicios` VALUES ('20', '10001', 'LORENA MARGARITA CHICO', '477000000', '60', 'LAPTOP', 'HP COMPAQ', 'AMD E240', '2', '250 HHD', '0', 'W7', '', 'SIN CONTRASEÑA', 'REVISAR MENSAJE DE VENTILADOR', 'SERVICIO DE PRUEBA SE BORRO EL FOLIO 2 \n\nSE REALIZO MANTENIMIENTO ', 'CON CARGADOR, DEJA MALETIN,\nCONTRASEÑA: scorpion\nTELEFONO: 4777975807', '', '350', '6', '2023-01-11', '2023-01-02', '10');
INSERT INTO `servicios` VALUES ('21', '10002', 'Prueba', 'xxx', '60', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', 'TEST', '', 'TEST', 'TEST', 'TEST', 'TEST', '', '0', '5', '2023-01-14', '2023-01-14', null);
INSERT INTO `servicios` VALUES ('22', '10003', 'Carolina Franco Duran', '4776481420', '61', 'LAPTOP', 'DELL', 'CORE I5', '12', '240 SSD', '', 'W10', '', 'SIN CONTRASEÑA', 'REVISAR CODIGO DE ERROR PANTALLA AZUL\nREVISAR BOTON DE ENCENDIDO\nSE LLEVA UN MOSE VORAGO', '', 'CON CARGADOR\n\nPAGO CON TARJETA ', '', '531.19', '6', '2023-01-07', '2023-01-04', null);
INSERT INTO `servicios` VALUES ('23', '10004', 'Serafin Garcia', '4772242339', '61', 'ALL IN ONE ', 'LENOVO', 'AMD A6', '4', '1 TB', '', 'W10', '', 'SIN CONTRASEÑA', 'SISTEMA LENTO\nFORMATEO SIN RESPALDO', '', 'CON CARGADOR DE CORRIENTE', '', '350', '6', '2023-01-07', '2023-01-05', null);
INSERT INTO `servicios` VALUES ('24', '10005', 'Oscar Villegas', '4776464680', '60', 'LAPTOP', 'LENOVO', 'AMD A8', '8', '1 TB', '', 'W 10', '', '845679123', 'MANTENIMIENTO INTERNO FISICO\r\nMANTENIMIENTO S.O CON RESPALDO\r\nDISCO SOLIDO SSD DE 480 GB\r\nCASE PARA DISCO EXTERNO', '', 'CON CARGADOR', '', '1890', '6', '2023-01-12', '2023-01-06', null);
INSERT INTO `servicios` VALUES ('25', '10006', 'MARCO REYES', '4778707951', '61', 'LAPTOP ', 'HP', 'CORE I5', '8', '240 GB ', '0', 'W10', '', 'SIN CONTRASEÑA', 'VENTANAS EMERGENTES', 'DESACTIVAR ALGUNAS PAGINAS QUE MANDAN LA PUBLICIDAD', 'CON CARGADOR', '', '150', '6', '2023-01-11', '2023-01-07', null);
INSERT INTO `servicios` VALUES ('26', '10007', 'Jose Luis Estrada Rico', '3312332906', '64', 'Laptop', 'Lenovo Thinkpad', 'Core i5', '16', '0', '240', 'W10', '', 'Marypily2121', 'Bisagra de pantalla Rota y tapa', 'Cotización de Bisagra y tapa superior del equipo', 'SIN CARGADOR, bisagra y tapa superior rota del equipo', '', '1700', '6', '2023-01-12', '2023-01-09', null);
INSERT INTO `servicios` VALUES ('27', '10008', 'Fernando Garcia', '4775075130', '60', 'ALL IN ONE', 'HP', 'AMD A8', '8', '1 TB', 'SIN DISCO', 'W10', 'Sí', 'SIN CONTRASEÑA', 'SE APAGA REPENTINAMENTE EN OCASIONES', 'REVISAR', 'CON CARGADOR HP GENERICO', '', '0', '6', '2023-01-10', '2023-01-10', null);
INSERT INTO `servicios` VALUES ('28', '10009', 'JAQUELINE GONZALEZ', '4773097660', '60', 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'SIN DATO', 'NO ENCIENDE\nBISAGRA DAÑADA', 'REVISION Y COTIZACION', 'SIN CARGADOR ', '', '0', '1', '2023-01-16', '2023-01-10', null);
INSERT INTO `servicios` VALUES ('29', '10010', 'Brayan Herrera', '4776324965', '61', 'LAPTOP', 'GOBIERNO', 'CORE I3', '8', '', '120', 'WINDOWS 10', '', 'SIN CONTRASEÑA', 'REVISAR VENTILADOR SUENA FUERTE, ', 'MANTENIMIENTO INTERNO', 'CON CARGADOR', '', '350', '6', '2023-01-18', '2023-01-11', null);
INSERT INTO `servicios` VALUES ('30', '10011', 'Liliana Romero', '4777069001', '60', 'LAPTOP', 'HP ', 'AMD E2', '4', '0', '32', 'WINDOWS 10', '', '1003', 'FORMATEO SIN RESPALDO', 'LIMPIEZA', 'CON CARGADOR\r\n\r\nYA SE ACABO EL DIA MARTES Y LE MARCAMOS Y NO NOS CONTESTA', '', '350', '3', '2023-01-16', '2023-01-13', null);
INSERT INTO `servicios` VALUES ('36', '10012', 'MARIA GISELA HERNANDEZ', '4771087570', '61', 'LAPTOP ELITEBOOK', 'HP', 'CORE I5', '4', '500', '', 'WINDOWS 10 ', '', 'alesighdzc2484', '- MANTENIMIENTO FISICO \r\n- CAMBIO DE DISCO SOLIDO 480 GB SSD\r\n- INSTALACION DE S.O CON RESPALDO\r\n', 'EN LA DESCRIPCIÓN LA SOLUCIÓN ', 'SIN CARGADOR', '', '1740', '6', '2023-01-17', '2023-01-14', null);
INSERT INTO `servicios` VALUES ('37', '10013', 'GABY MEDRANO', '4774494041', '60', 'LAPTOP', 'HP', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'yotequieromucho1', 'NO DA VIDEO', 'REVISIÓN', 'CON CARGADOR ', '', '0', '6', '2023-01-20', '2023-01-16', null);
INSERT INTO `servicios` VALUES ('38', '10014', 'JORGE ROMERO', '4791191961', '61', 'LAPTOP', 'HP', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'WINDOWS 7', '', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'ACTUALIZACIÓN DE SISTEMA OK', 'CON CARGADOR', '', '350', '6', '2023-01-24', '2023-01-19', null);
INSERT INTO `servicios` VALUES ('39', '10015', 'OLGA GUADIAN MARTINEZ', '4772385078', '60', 'LAPTOP', 'HP', 'CORE I5', '4', '160', '', 'WINDOWS 10', 'Sí', '1623', 'FORMATEO SIN RESPALDO REVISAR DISCO DURO TARDA EN ENTRAR AL SISTEMA DESDE UN PRINCIPIO', 'MANTENIMIENTO FISICO Y FORMATEO', 'CON CARGADOR', '', '700', '6', '2023-01-24', '2023-01-19', null);
INSERT INTO `servicios` VALUES ('40', '10016', 'KARLA MARIANA QUINTANA CARRERA', '4778601425', '64', 'LAPTOP', 'GTO', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'Sí', 'SIN CONTRASEÑA', 'NO PRENDE ', '1500 +299 DE REGULADOR ', 'LAPTOP + CARGADOR ', '', '1500', '6', '2023-01-30', '2023-01-19', null);
INSERT INTO `servicios` VALUES ('41', '10017', 'Maria de Fatima Gonzalez', '4777027288', '64', 'LAPTOP ', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'NO', 'NO PRENDE', '', 'DEJA LAPTOP CON CARGADOR SIN ENCENDER', '', '0', '1', '0000-00-00', '2023-01-21', null);
INSERT INTO `servicios` VALUES ('42', '10017', 'Maria de Fatima Gonzalez', '4777027288', '64', 'LAPTOP ', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'NO', 'NO PRENDE', '', 'DEJA LAPTOP CON CARGADOR SIN ENCENDER', '', '0', '1', '0000-00-00', '2023-01-21', null);
INSERT INTO `servicios` VALUES ('43', '10018', 'Daniel Sanchez', '4778273941', '61', 'CPU', 'DELL', 'CORE I5', '4', '', 'SIN INFORMACION', 'SIN INFORMACION', 'No', 'sin contraseña', 'CAMBIO DE DISCO SSD 480 + SISTEMA+MANTENIMIENTO INTERNO+ CAMBIO DE PROCESADOR.', 'SE AGREGO EL PROCESADOR TOTAL ANTERIOR DE $1,590 TOTAL CUANDO RECIBE EL EQUIPO DE $2,540 PESOS ', 'SIN CABLES ', '', '2540', '6', '2023-02-11', '2023-01-23', null);
INSERT INTO `servicios` VALUES ('45', '10019', 'Margarita Avenicio', '4778590851', '60', 'LAPTOP', 'TOSHIBA', 'CENTRINO', '3', 'SIN DISCO', '', 'SIN SISTEMA', 'No', 'SIN CONTRASEÑA', 'INSTALAR DISCO DURO Y S.O.\r\nREVISAR CUALQUIER OTRO DETALLE', '', 'SIN CARGADOR Y SIN DISCO\r\n', '', '0', '1', '2023-01-27', '2023-01-24', null);
INSERT INTO `servicios` VALUES ('46', '10020', 'Cristian Contreras', '4774663243', '60', 'ALL IN ONE', 'HP', 'AMD E-350', '4', '500', 'SIN DATOS', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA', 'REVISARLA A DETALLE\r\nSE APAGA TRABAJANDO CON EL TIEMPO', 'REVISION', 'CON CARGADOR', '', '100', '1', '2023-01-27', '2023-01-24', null);
INSERT INTO `servicios` VALUES ('47', '10021', 'Idalia Castro', '4776828090', '60', 'Laptop', 'HP', 'Intel pentium', 'sin dato', 'sin dato', 'no', 'w10', 'Sí', 'no ', 'equipo lento', '', 'Tarda mucho tiempo en prender', '', '0', '1', '0000-00-00', '2023-01-26', null);
INSERT INTO `servicios` VALUES ('48', '10022', 'ADRIAN CHICO MARMOLEJO', '4773031994', '60', 'LAPTOP', 'ACER', 'INTEL CORE I3', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'SIN DATOS', 'NO ENCIENDE', 'REVISAR', '', '', '0', '1', '2023-01-30', '2023-01-27', null);
INSERT INTO `servicios` VALUES ('49', '10023', 'PATRICIA GOMEZ GONZALEZ', '4774114631', '60', 'LAPTOP', 'ACER', 'PENTIUM', '4', '500', 'NO APLICA', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- MUY LENTA REINICIO DE S.O\r\n- REVISAR BISAGRA DAÑADA', 'FORMATEO SIN RESPALDO', 'CON BISAGRA DAÑADA \r\nLINEA EN PANTALLA\r\nTAPA ROTA', '', '350', '6', '2023-02-03', '2023-01-28', null);
INSERT INTO `servicios` VALUES ('50', '10024', 'GENERAL OPERADOR LOGISTICO', '4777507474', '60', 'ALL IN ONE ', 'HP', 'AMD A12', '12', '1 TB', '', 'WIN 10', 'Sí', 'GeneralF', 'SE APAGA EL EQUIPO', 'ACTUALIZACION DE SISTEMA Y BIOS ', 'ENTREGADO', '', '150', '6', '2023-02-07', '2023-01-30', null);
INSERT INTO `servicios` VALUES ('51', '10025', 'VALNTINA DUARTE', '4776491526', '60', 'LAPTOP', 'LANIX', 'PENTIUM', 'SIN DATOS', 'SIN DATOS ', 'SIN DATOS', 'SIN DATOS', 'Sí', 'NO RECUERDA', 'COTIZAR PANTALLA ESTRELLADA\r\nSE PRENDE PERO SE APAGA\r\n', 'CAMBIO DE PANTALLA', 'SE PRENDE PERO SE APAGA', '', '1500', '6', '2023-02-06', '2023-01-30', null);
INSERT INTO `servicios` VALUES ('52', '10026', 'CARLOS RAMOS', '4773160086', '60', 'CPU', 'LENOVO ', 'CORE I3', '4', '500', 'SIN INFORMACION', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'NO DETECTA EL PUERTO ETHERNET', 'actualización de driver', 'se actualizo driver y windows update', '', '200', '6', '2023-02-07', '2023-01-30', null);
INSERT INTO `servicios` VALUES ('53', '10027', 'SERGIO AGUILAR GUZMAN', '4777043753', '60', 'LAPTOP', 'GTO', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', 'EL EQUIPO PRENDE Y SE APAGA, REVISAR TECLADO', 'SOLO SE REVISO OCUPA CAMBIO DE TECLADO Y BOTON DE ENCENDIDO', 'FALTAN DOS TECLAS AL TECLADO\r\n', '', '100', '6', '2023-02-06', '2023-01-31', null);
INSERT INTO `servicios` VALUES ('54', '10028', 'BLANCA VAZQUEZ', '4776755287', '60', 'LAPTOP', 'TOSHIBA', 'CELERON', '4', '1 TB', 'SIN DATOS', 'WIN 10', 'Sí', '1234', 'INSTALAR ANTIVIRUS Y ACTUALIZAR OFFICE', 'ACTUALIZACION DE OFFICE Y ANTIVIRUS SE QUEDO EL MISMO ', 'SOLO ACTIVACION Y INSTALACION', '', '350', '6', '2023-01-31', '2023-01-31', null);
INSERT INTO `servicios` VALUES ('55', '10029', 'NOE VALTIERRA', '4772624031', '60', 'CPU', 'DELL', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'daliaya0106', 'FORMATEO sin respaldo y revisar sonido de ventilador', 'MANTENIMIENTO Y SISTEMA OPERATIVO', 'sin cables', '', '700', '6', '2023-02-08', '2023-02-01', null);
INSERT INTO `servicios` VALUES ('56', '10030', 'ABRAHAM CARRERA', '4771102469', '60', 'LAPTOP', 'LANIX', 'ATOM', '2', '235', 'SIN DATOS', 'WIN 10', 'Sí', 'CERRAJERIA16', 'INSTALACION DE PROGRAMA', 'activación programa', 'CON MOCHILA\r\nADAPTADOR DE MEMORIA\r\nPROGRAMAS', '', '150', '6', '2023-02-08', '2023-02-01', null);
INSERT INTO `servicios` VALUES ('57', '10031', 'RENATA GAONA ', '4776690819', '64', 'LAPTOP', 'LENOVO THINKPAD', 'CORE I5', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'mnbvcxz10', 'No inicia S.O, el equipo no dio imagen al momento de recibirlo ', 'cambio a ssd de 480 + sistema sin respaldo', 'El equipo no da imagen cuando ingresa, el usuario indica que tarda de 7 a 10 min. en prender.', '', '1293', '6', '2023-02-15', '2023-02-03', null);
INSERT INTO `servicios` VALUES ('58', '10032', 'Claudia Flores', '4772860571', '64', 'ALL IN ONE', 'HP', 'INTEL PENTIUM', 'SIN INFORMACION', '320', '', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'TODO OK ', 'EQUIPO ENTREGADO', '', '350', '6', '2023-02-10', '2023-02-03', null);
INSERT INTO `servicios` VALUES ('59', '10033', 'JONATHAN RAMOS', '4424719849', '60', 'LAPTOP', 'HP', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN CONTRASEÑA', 'REVISAR PANTALLA SE VA IMAGEN CUANDO SE ABRE', 'reconeción de flex de video. se probo display en otro equipo y no fallo asi mismo el flex no se logro identificar como tal la falla pero con las pruebas quedo funcionando correctamente.', 'se dieron 30 dias de garantia en el servicio se tomara a cuenta lo cobrado en dado caso de que vuelva a fallar. ', '', '200', '6', '2023-02-13', '2023-02-06', null);
INSERT INTO `servicios` VALUES ('60', '10034', 'LA BUSQUEDA II', '4777723354', '60', 'ALL IN ONE', 'SAMSUNG', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'Consejeria2021', 'No enciende\r\nDa pantalla azul', '', '', '', '0', '2', '2023-02-13', '2023-02-06', null);
INSERT INTO `servicios` VALUES ('61', '10035', 'MARIA MARTINA', '4774833001', '60', 'LAPTOP', 'DELL ', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', 'LIMPIEZA  POR DERRAME DE LIQUIDO\r\nREVISAR POR QUE SE APAGA CON EL USO\r\nREVISAR POR QUE DA PANTALLA AZUL', 'mantenimiento físico y actualizaciones de s.o', '', '', '450', '6', '2023-02-06', '2023-02-06', null);
INSERT INTO `servicios` VALUES ('62', '10036', 'PEDRO SERRATOS', '4773473131', '60', 'CPU', 'ARMADO', 'CORE I5', '32', '', '480', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'FORMATEO SIN RESPALDO ', 'SIN CABLE DE CORRIENTE', '', '350', '6', '2023-02-14', '2023-02-07', null);
INSERT INTO `servicios` VALUES ('63', '10037', 'PATRICIA GOMEZ GONZALEZ', '4774114631', '64', 'LAPTOP', 'GUANAJUATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'pendiente la mandara por whats', 'No prende el equipo. cliente comenta que al principio batallaban para que prendiera, movían el cargador de la parte conde se conecta a la laptop para que prendiera', 'revisar', '', '', '0', '1', '2023-02-07', '2023-02-07', null);
INSERT INTO `servicios` VALUES ('64', '10038', 'Jose Mauricio Perez', '4776863096', '64', 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'Fabiolamurillo', 'No prende equipo. si detecta el cargador cuando se conecta pero no prende', '', 'El cargador presenta desgaste estético cable jalado', '', '0', '1', '0000-00-00', '2023-02-07', null);
INSERT INTO `servicios` VALUES ('65', '10039', 'David alejandro hernandez', '4773854815', '64', 'laptop', 'hp', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'No', 'SIN DATO', 'NO PRENDE.', 'SE REVISO NADA MAS', 'se vendara cargador costo $490', '', '100', '6', '2023-02-23', '2023-02-11', null);
INSERT INTO `servicios` VALUES ('66', '10040', 'Ricardo Cardenas', '4776315181', '64', 'laptop', 'hp', 'core i7', '12', '250', '', 'w10', 'Sí', 'sin contraseña', 'actualización de programa y config. de teclado.', 'formateo y respaldo de inf.', '', '', '450', '6', '2023-02-08', '2023-02-13', null);
INSERT INTO `servicios` VALUES ('67', '10041', 'Beatriz Romero', '4775957851', '60', 'LAPTOP', 'HP', 'CELERON', '4', '500', 'sin dato', 'WIN 10', 'Sí', 'Montielromero', 'Equipo lento\r\nCambiar a Ssd de 480 gb \r\nwind 10 con respaldo de informacion', 'Cambio a ssd 480 gb, formateo y respaldo de info.', 'cargador parchado del cable ', '', '1390', '6', '2023-02-17', '2023-02-14', null);
INSERT INTO `servicios` VALUES ('68', '10042', 'Moises Hernandez', '4774333271', '64', 'laptop ', 'HYUNDAY ', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'Sí', 'SIN DATO', 'Formateo sin respaldo de información', 'formateo sin respaldo w10', '', '', '350', '6', '2023-02-17', '2023-02-15', null);
INSERT INTO `servicios` VALUES ('69', '10043', 'SU Wenci', '7721201878', '60', 'CPU', 'ACER', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN DATOS', 'NO ENCIENDE', 'REVISAR', 'SOLO CPU SIN CABLES NI NADA', '', '0', '1', '2023-02-24', '2023-02-17', null);
INSERT INTO `servicios` VALUES ('70', '10044', 'Ana Mariela Alba Barroso', '4771258719', '60', 'LAPTOP', 'ACER ', 'CORE I5', '4', '1 TB', 'SIN DATOS', 'WINDOWS 10', 'Sí', 'SIN DATOS', 'CAMBIO DE DISCO SSD A 480 + FORMATEO', '', 'EQUIPO LENTO', '', '0', '1', '2023-02-18', '2023-02-18', null);
INSERT INTO `servicios` VALUES ('71', '10045', 'CARLOS OLIVA HERNANDEZ', '4779164832', '60', 'LAPTOP', 'COMPAQ', 'CELREON', '4', 'SIN DATOS', 'SIN DATOS', 'WIN 7', 'Sí', 'SIN DATOS', 'FORMATEO CON RESPALDO', '', '', '', '500', '1', '2023-02-25', '2023-02-18', null);
INSERT INTO `servicios` VALUES ('72', '10046', 'BRAULIO SIERRA', '4772877645', '60', 'LAPTOP', 'DELL', 'CORE I5', '8', 'SIN DATOS', '240', 'WINDOWS 10', 'Sí', 'SIN DATOS', 'revisar bateria\r\nrevisar cargador\r\nrevisar jack de corriente', 'REVISAR', 'Linea en pantalla , quebrada en la tapa superior, jack de corriente dañado, no agarra touchpad', '', '0', '1', '2023-02-27', '2023-02-20', null);

-- ----------------------------
-- Table structure for slide
-- ----------------------------
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `imgFondo` text COLLATE utf8_spanish_ci NOT NULL,
  `tipoSlide` text COLLATE utf8_spanish_ci NOT NULL,
  `imgProducto` text COLLATE utf8_spanish_ci NOT NULL,
  `estiloImgProducto` text COLLATE utf8_spanish_ci NOT NULL,
  `estiloTextoSlide` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo1` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo2` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo3` text COLLATE utf8_spanish_ci NOT NULL,
  `boton` text COLLATE utf8_spanish_ci NOT NULL,
  `url` text COLLATE utf8_spanish_ci NOT NULL,
  `orden` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of slide
-- ----------------------------
INSERT INTO `slide` VALUES ('1', 'ZAPATOS AMARILLOS', 'vistas/img/slide/default/back_default.jpg', 'slideOpcion2', 'vistas/img/slide/slide1/calzado.png', '{\"top\":\"5\",\"right\":\"\",\"left\":\"4.99929735806633\",\"width\":\"50\"}', '{\"top\":\"20\",\"right\":\"9.999494097807757\",\"left\":\"\",\"width\":\"40\"}', '{\"texto\":\"Lorem Ipsum\",\"color\":\"#e6ca35\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#777\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#888\"}', 'VER PRODUCTO', '#', '1', '2023-02-23 14:17:43');
INSERT INTO `slide` VALUES ('2', 'CURSO', 'vistas/img/slide/default/back_default.jpg', 'slideOpcion2', 'vistas/img/slide/slide2/curso.png', '{\"top\":\"10\",\"right\":\"\",\"left\":\"15\",\"width\":\"30\"}', '{\"top\":\"15\",\"right\":\"15\",\"left\":\"\",\"width\":\"40\"}', '{\"texto\":\"Lorem Ipsum\",\"color\":\"#333\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#777\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#888\"}', 'VER PRODUCTO', '#', '3', '2023-02-17 10:19:21');
INSERT INTO `slide` VALUES ('3', 'MÓVIL', 'vistas/img/slide/slide3/fondo2.jpg', 'slideOpcion2', 'vistas/img/slide/slide3/iphone.png', '{\"top\":\"10\",\"right\":\"\",\"left\":\"10\",\"width\":\"35\"}', '{\"top\":\"15\",\"right\":\"15\",\"left\":\"\",\"width\":\"40\"}', '{\"texto\":\"Lorem Ipsum\",\"color\":\"#eee\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#ccc\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#aaa\"}', 'VER PRODUCTO', '#', '2', '2023-02-17 10:19:21');
INSERT INTO `slide` VALUES ('4', 'CHICA', 'vistas/img/slide/slide4/fondo3.jpg', 'slideOpcion1', '', '{\"top\":\"\",\"right\":\"\",\"left\":\"\",\"width\":\"\"}', '{\"top\":\"20\",\"right\":\"\",\"left\":\"10\",\"width\":\"40\"}', '{\"texto\":\"Lorem Ipsum\",\"color\":\"#333\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#777\"}', '{\"texto\":\"Lorem ipsum dolor sit\",\"color\":\"#888\"}', '', '', '4', '2018-01-31 16:46:04');
INSERT INTO `slide` VALUES ('7', 'Laptop', 'vistas/img/slide/slide7/fondo.jpg', 'slideOpcion1', 'vistas/img/slide/slide7/producto.png', '{\"top\":\"15\",\"right\":\"10\",\"left\":\"\",\"width\":\"25\"}', '{\"top\":\"20\",\"right\":\"\",\"left\":\"15\",\"width\":\"30\"}', '{\"texto\":\"Microsoft - Surface Laptop Go\",\"color\":\"#ff5722\"}', '{\"texto\":\"Pantalla táctil de 12.4\",\"color\":\"#777777\"}', '{\"texto\":\"color gris plata (Platinum)\",\"color\":\"#888888\"}', 'VER PRODUCTO', '#', '5', '2023-02-23 14:46:11');

-- ----------------------------
-- Table structure for subcategorias
-- ----------------------------
DROP TABLE IF EXISTS `subcategorias`;
CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategoria` text COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of subcategorias
-- ----------------------------
INSERT INTO `subcategorias` VALUES ('1', 'Ropa para dama', '1', 'ropa-para-dama', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('2', 'Ropa para hombre', '1', 'ropa-para-hombre', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('3', 'Ropa deportiva', '1', 'ropa-deportiva', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('4', 'Ropa infantil', '1', 'ropa-infantil', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('5', 'Calzado para dama', '2', 'calzado-para-dama', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('6', 'Calzado para hombre', '2', 'calzado-para-hombre', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('7', 'Calzado deportivo', '2', 'calzado-deportivo', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('8', 'Calzado infantil', '2', 'calzado-infantil', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('9', 'Bolsos', '3', 'bolsos', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('10', 'Relojes', '3', 'relojes', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('11', 'Pulseras', '3', 'pulseras', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('12', 'Collares', '3', 'collares', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('13', 'Gafas de sol', '3', 'gafas-de-sol', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('14', 'Teléfonos Móvil', '4', 'telefonos-movil', '2017-10-05 09:49:56');
INSERT INTO `subcategorias` VALUES ('15', 'Tabletas Electrónicas', '4', 'tabletas-electronicas', '2017-10-05 09:50:02');
INSERT INTO `subcategorias` VALUES ('16', 'Computadoras', '4', 'computadoras', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('17', 'Auriculares', '4', 'auriculares', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('18', 'Desarrollo Web', '5', 'desarrollo-web', '0000-00-00 00:00:00');
INSERT INTO `subcategorias` VALUES ('19', 'Aplicaciones Móviles', '5', 'aplicaciones-moviles', '2017-10-05 09:50:07');
INSERT INTO `subcategorias` VALUES ('20', 'Diseño Gráfico', '5', 'diseno-grafico', '2017-10-05 09:50:17');
INSERT INTO `subcategorias` VALUES ('21', 'Marketing Digital', '5', 'marketing-digital', '0000-00-00 00:00:00');

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
INSERT INTO `usuarios` VALUES ('60', 'Alfonso Martinez Lopez', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', '', '1', '2023-04-12 10:58:53', '2023-04-12 09:58:53');
INSERT INTO `usuarios` VALUES ('61', 'VendedorTest', 'vendedor', '$2a$07$asxx54ahjppf45sd87a5aumawKBqkKu/t5yVn5oVpbu8.I0unXqba', 'Vendedor', '', '1', '2022-04-27 10:56:19', '2022-04-27 09:56:19');

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
INSERT INTO `ventas` VALUES ('38', '10001', '18', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"22\",\"precio\":\"266\",\"total\":\"266\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"2660\",\"total\":\"2660\"}]', '0', '2926', '2926', 'Efectivo', '1', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('39', '10002', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"9\",\"precio\":\"100\",\"total\":\"200\"},{\"id\":\"78\",\"descripcion\":\"USB\",\"cantidad\":\"2\",\"stock\":\"8\",\"precio\":\"80\",\"total\":\"160\"}]', '43.2', '360', '403.2', 'TC-1212312312312', '1', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('40', '10003', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"7\",\"precio\":\"120\",\"total\":\"240\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"6720\",\"total\":\"6720\"}]', '69.6', '6960', '7029.6', 'Efectivo', '1', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('41', '10004', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"2\",\"stock\":\"5\",\"precio\":\"100\",\"total\":\"200\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"5200\",\"total\":\"5200\"}]', '0', '5400', '5400', 'Efectivo', '2', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('42', '10005', '18', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"21\",\"precio\":\"266\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"2660\",\"total\":\"2500\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"100\",\"total\":\"100\"}]', '0', '2805', '2805', 'Efectivo', '1', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('43', '10006', '18', '60', '[{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"3\",\"precio\":\"100\",\"total\":\"100\"}]', '0', '100', '100', 'Efectivo', '1', '2022-07-05 07:40:01', '2');
INSERT INTO `ventas` VALUES ('44', '10007', '18', '60', '[{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"2\",\"stock\":\"16\",\"precio\":\"2660\",\"total\":\"5320\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"6720\",\"total\":\"5200\"}]', '0', '10520', '10520', 'Efectivo', '1', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('45', '10008', '18', '60', '[{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"6720\",\"total\":\"6720\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"20\",\"precio\":\"266\",\"total\":\"266\"}]', '0', '6986', '6986', 'Efectivo', '2', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('46', '10009', '18', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"5600\",\"total\":\"5600\"},{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"11\",\"precio\":\"5740\",\"total\":\"5740\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"588\",\"total\":\"588\"},{\"id\":\"78\",\"descripcion\":\"USB\",\"cantidad\":\"1\",\"stock\":\"7\",\"precio\":\"75\",\"total\":\"75\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"266\",\"total\":\"266\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"2\",\"precio\":\"120\",\"total\":\"120\"}]', '0', '12389', '12389', 'Efectivo', '2', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('48', '10010', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"120\",\"total\":\"240\"}]', '0', '240', '240', 'TC-245235235234523', '3', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('49', '10011', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"588\",\"total\":\"588\"}]', '0', '714', '714', 'Efectivo', '2', '2022-07-05 12:04:28', '3');
INSERT INTO `ventas` VALUES ('50', '10012', '20', '60', '[{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"10\",\"precio\":\"5740\",\"total\":\"5740\"}]', '0', '5740', '5740', 'CH-4564464', '2', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('51', '10013', '18', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"121\",\"total\":\"121\"}]', '0', '121', '121', 'TD-123123', '3', '2022-07-05 09:24:34', '3');
INSERT INTO `ventas` VALUES ('52', '10014', '19', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"100\",\"total\":\"100\"},{\"id\":\"84\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"5000\",\"total\":\"5000\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"500\",\"total\":\"500\"}]', '0', '5600', '5600', 'Efectivo', '1', '2022-08-29 10:55:06', '5');
INSERT INTO `ventas` VALUES ('53', '10015', '21', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"5600\",\"total\":\"5600\"}]', '0', '5726', '5726', 'TC-213131321', '2', '2022-08-29 10:55:47', '5');
INSERT INTO `ventas` VALUES ('54', '10016', '20', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"13\",\"precio\":\"126\",\"total\":\"126\"},{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"588\",\"total\":\"588\"},{\"id\":\"79\",\"descripcion\":\"Auriculares\",\"cantidad\":\"1\",\"stock\":\"1\",\"precio\":\"120\",\"total\":\"120\"}]', '0', '834', '834', 'Efectivo', '2', '2022-11-10 10:09:03', '6');
INSERT INTO `ventas` VALUES ('55', '10017', '19', '60', '[{\"id\":\"85\",\"descripcion\":\"Cable RJ45 20 mts\",\"cantidad\":\"1\",\"stock\":\"12\",\"precio\":\"100\",\"total\":\"100\"},{\"id\":\"77\",\"descripcion\":\"HP\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"5200\",\"total\":\"5200\"}]', '0', '5300', '5300', 'TC-78979798', '1', '2022-11-10 10:09:33', '6');
INSERT INTO `ventas` VALUES ('56', '10018', '18', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"null\",\"total\":\"0\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"18\",\"precio\":\"null\",\"total\":\"null\"}]', '0', '0', '0', 'TD-131321231', '3', '2022-11-10 10:09:54', '6');
INSERT INTO `ventas` VALUES ('57', '10019', '21', '60', '[{\"id\":\"81\",\"descripcion\":\"Chida\",\"cantidad\":\"1\",\"stock\":\"16\",\"precio\":\"5600\",\"total\":\"5600\"},{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"17\",\"precio\":\"266\",\"total\":\"266\"}]', '0', '5866', '5866', 'TF-258963147', '2', '2022-11-10 10:10:15', '6');
INSERT INTO `ventas` VALUES ('58', '10020', '21', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"2\",\"stock\":\"15\",\"precio\":\"266\",\"total\":\"532\"}]', '0', '532', '532', 'TD-258963174', '2', '2022-11-10 10:10:39', '6');
INSERT INTO `ventas` VALUES ('59', '10021', '19', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"205\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"2500\",\"total\":\"2500\"}]', '0', '2705', '2705', 'Efectivo', '1', '2022-11-10 10:11:03', '6');
INSERT INTO `ventas` VALUES ('60', '10022', '20', '60', '[{\"id\":\"83\",\"descripcion\":\"Logitech\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"588\",\"total\":\"588\"}]', '0', '588', '588', 'TD-396741852', '2', '2022-11-10 12:04:56', '7');
INSERT INTO `ventas` VALUES ('61', '10023', '19', '60', '[{\"id\":\"76\",\"descripcion\":\"Logitech 205\",\"cantidad\":\"1\",\"stock\":\"14\",\"precio\":\"205\",\"total\":\"205\"},{\"id\":\"75\",\"descripcion\":\"Lenovo\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"2500\",\"total\":\"2500\"}]', '0', '2705', '2705', 'DOXXO', '1', '2022-11-14 10:13:42', '6');
INSERT INTO `ventas` VALUES ('62', '10024', '18', '60', '[{\"id\":\"90\",\"descripcion\":\"PRECISSION\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"4500\",\"total\":\"4500\"},{\"id\":\"89\",\"descripcion\":\"Mouse G235\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"150\",\"total\":\"150\"}]', '0', '4650', '4650', 'Efectivo', '3', '2023-01-04 13:07:29', null);

-- ----------------------------
-- Table structure for visitaspaises
-- ----------------------------
DROP TABLE IF EXISTS `visitaspaises`;
CREATE TABLE `visitaspaises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of visitaspaises
-- ----------------------------
INSERT INTO `visitaspaises` VALUES ('1', 'United States', 'US', '2', '2017-12-05 15:02:46');
INSERT INTO `visitaspaises` VALUES ('2', 'Japan', 'JP', '47', '2023-03-08 14:07:41');
INSERT INTO `visitaspaises` VALUES ('3', 'Spain', 'ES', '10', '2017-12-05 15:02:53');
INSERT INTO `visitaspaises` VALUES ('4', 'Colombia', 'CO', '5', '2017-12-05 15:02:55');
INSERT INTO `visitaspaises` VALUES ('5', 'China', 'CN', '3', '2017-12-05 15:04:32');
INSERT INTO `visitaspaises` VALUES ('6', 'Germany', 'DE', '34', '2017-12-05 15:04:39');
INSERT INTO `visitaspaises` VALUES ('7', 'Mexico', 'MX', '8', '2017-12-05 15:04:41');

-- ----------------------------
-- Table structure for visitaspersonas
-- ----------------------------
DROP TABLE IF EXISTS `visitaspersonas`;
CREATE TABLE `visitaspersonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` text COLLATE utf8_spanish_ci NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `visitas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of visitaspersonas
-- ----------------------------
INSERT INTO `visitaspersonas` VALUES ('1', '153.202.197.216', 'Japan', '1', '2017-11-08 12:37:07');
INSERT INTO `visitaspersonas` VALUES ('3', '249.170.168.184', 'Spain', '1', '2017-11-28 13:16:16');
INSERT INTO `visitaspersonas` VALUES ('5', '249.170.168.184', 'Spain', '1', '2017-11-28 13:16:19');
INSERT INTO `visitaspersonas` VALUES ('6', '234.13.198.119', 'Colombia', '1', '2017-11-28 13:16:03');
INSERT INTO `visitaspersonas` VALUES ('7', '141.46.61.241', 'Germany', '1', '2017-11-28 13:13:45');
INSERT INTO `visitaspersonas` VALUES ('8', '40.179.75.60', 'United States', '1', '2017-11-28 13:14:05');
INSERT INTO `visitaspersonas` VALUES ('9', '153.205.198.22', 'Japan', '1', '2017-11-01 13:14:18');
INSERT INTO `visitaspersonas` VALUES ('10', '148.21.177.158', 'United States', '1', '2017-10-28 13:14:34');
INSERT INTO `visitaspersonas` VALUES ('11', '40.224.125.226', 'United States', '1', '2017-11-28 13:14:56');
INSERT INTO `visitaspersonas` VALUES ('12', '10.98.135.68', 'China', '1', '2017-11-28 13:15:57');
INSERT INTO `visitaspersonas` VALUES ('13', '23.121.157.131', 'United States', '1', '2017-11-28 13:15:37');
INSERT INTO `visitaspersonas` VALUES ('17', '8.12.238.123', 'United States', '1', '2017-11-28 13:28:27');
INSERT INTO `visitaspersonas` VALUES ('18', '148.21.177.158', 'United States', '1', '2017-11-28 13:33:05');
INSERT INTO `visitaspersonas` VALUES ('19', '153.202.197.216', 'Japan', '1', '2017-11-28 13:33:50');
INSERT INTO `visitaspersonas` VALUES ('27', '153.205.198.22', 'Japan', '1', '2017-10-28 14:05:19');
INSERT INTO `visitaspersonas` VALUES ('31', '153.205.198.22', 'Japan', '1', '2017-11-28 14:09:49');
INSERT INTO `visitaspersonas` VALUES ('32', '153.205.198.22', 'Japan', '1', '2017-11-29 13:23:07');
INSERT INTO `visitaspersonas` VALUES ('33', '153.205.198.22', 'Japan', '1', '2017-11-30 17:01:27');
INSERT INTO `visitaspersonas` VALUES ('34', '153.205.198.22', 'Japan', '1', '2017-12-04 08:55:27');
INSERT INTO `visitaspersonas` VALUES ('35', '153.205.198.22', 'Japan', '1', '2017-12-05 14:58:04');
INSERT INTO `visitaspersonas` VALUES ('36', '153.205.198.22', 'Japan', '1', '2017-12-06 15:11:13');
INSERT INTO `visitaspersonas` VALUES ('37', '153.205.198.22', 'Japan', '1', '2017-12-07 16:32:13');
INSERT INTO `visitaspersonas` VALUES ('38', '153.205.198.22', 'Japan', '1', '2017-12-11 09:32:10');
INSERT INTO `visitaspersonas` VALUES ('39', '153.205.198.22', 'Japan', '1', '2017-12-13 09:45:58');
INSERT INTO `visitaspersonas` VALUES ('40', '153.205.198.22', 'Japan', '1', '2017-12-18 20:37:45');
INSERT INTO `visitaspersonas` VALUES ('41', '153.205.198.22', 'Japan', '1', '2017-12-19 06:54:21');
INSERT INTO `visitaspersonas` VALUES ('42', '153.205.198.22', 'Unknown', '1', '2017-12-30 09:41:47');
INSERT INTO `visitaspersonas` VALUES ('43', '153.205.198.22', 'Japan', '1', '2018-01-02 09:46:52');
INSERT INTO `visitaspersonas` VALUES ('44', '153.205.198.22', 'Japan', '1', '2018-01-03 07:54:29');
INSERT INTO `visitaspersonas` VALUES ('45', '153.205.198.22', 'Japan', '1', '2018-01-04 10:54:03');
INSERT INTO `visitaspersonas` VALUES ('46', '153.205.198.22', 'Japan', '1', '2018-01-05 11:17:05');
INSERT INTO `visitaspersonas` VALUES ('47', '153.205.198.22', 'Japan', '1', '2018-01-08 07:57:21');
INSERT INTO `visitaspersonas` VALUES ('48', '153.205.198.22', 'Japan', '1', '2018-01-09 09:46:40');
INSERT INTO `visitaspersonas` VALUES ('49', '153.205.198.22', 'Japan', '1', '2018-01-10 14:34:12');
INSERT INTO `visitaspersonas` VALUES ('50', '153.205.198.22', 'Japan', '1', '2018-01-11 08:08:56');
INSERT INTO `visitaspersonas` VALUES ('51', '153.205.198.22', 'Japan', '1', '2018-01-15 12:10:09');
INSERT INTO `visitaspersonas` VALUES ('52', '153.205.198.22', 'Japan', '1', '2018-01-16 10:15:33');
INSERT INTO `visitaspersonas` VALUES ('53', '153.205.198.22', 'Japan', '1', '2018-01-17 15:39:17');
INSERT INTO `visitaspersonas` VALUES ('54', '153.205.198.22', 'Japan', '1', '2018-01-18 14:16:09');
INSERT INTO `visitaspersonas` VALUES ('55', '153.205.198.22', 'Japan', '1', '2018-01-19 09:05:32');
INSERT INTO `visitaspersonas` VALUES ('56', '153.205.198.22', 'Japan', '1', '2018-01-22 08:38:48');
INSERT INTO `visitaspersonas` VALUES ('57', '153.205.198.22', 'Japan', '1', '2018-01-25 09:44:30');
INSERT INTO `visitaspersonas` VALUES ('58', '153.205.198.22', 'Japan', '1', '2018-01-26 15:24:38');
INSERT INTO `visitaspersonas` VALUES ('59', '153.205.198.22', 'Japan', '1', '2018-01-29 14:45:50');
INSERT INTO `visitaspersonas` VALUES ('60', '153.205.198.22', 'Japan', '1', '2018-01-30 16:32:35');
INSERT INTO `visitaspersonas` VALUES ('61', '153.205.198.22', 'Japan', '1', '2018-01-31 12:35:33');
INSERT INTO `visitaspersonas` VALUES ('62', '153.205.198.22', 'Japan', '1', '2023-02-14 11:15:24');
INSERT INTO `visitaspersonas` VALUES ('63', '153.205.198.22', 'Japan', '1', '2023-02-15 10:38:41');
INSERT INTO `visitaspersonas` VALUES ('64', '153.205.198.22', 'Japan', '1', '2023-02-16 10:12:23');
INSERT INTO `visitaspersonas` VALUES ('65', '153.205.198.22', 'Japan', '1', '2023-02-23 13:36:57');
INSERT INTO `visitaspersonas` VALUES ('66', '153.205.198.22', 'Japan', '1', '2023-03-08 14:07:41');
