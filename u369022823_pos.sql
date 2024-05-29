-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-05-2024 a las 18:09:09
-- Versión del servidor: 10.11.7-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u369022823_pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_facturacion`
--

CREATE TABLE `api_facturacion` (
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `modo` varchar(255) DEFAULT NULL,
  `fecha_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `api_facturacion`
--

INSERT INTO `api_facturacion` (`usuario`, `contrasena`, `modo`, `fecha_update`) VALUES
('TWFyY29BZ3VpbGFy', 'aHNmYWN0dXJhY2lvbjIwMjMu', 'sandbox', '2023-03-08 11:06:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodega`
--

CREATE TABLE `bodega` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_producto` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `cantidadLlegadas` int(11) NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `tipo` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `bodega`
--

INSERT INTO `bodega` (`id`, `descripcion`, `id_producto`, `cantidad`, `cantidadLlegadas`, `fecha_apertura`, `tipo`) VALUES
(8, '10', '87', '24', 0, '2023-01-14 20:18:59', 1),
(9, '', '0', '5', 0, NULL, 0),
(10, '', '0', '5', 0, NULL, 0),
(11, '', '0', '5', 0, NULL, 1),
(12, '14012023', '0', '10', 0, NULL, 1),
(13, 'acasx', '91', '15', 0, '2023-01-14 20:23:07', 1),
(15, '', '92', '12', 12, NULL, 1),
(16, 'TEst', '35', '0', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_cierre` date DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `estatus` int(5) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `nombre`, `fecha_cierre`, `fecha_apertura`, `estatus`) VALUES
(10, '02012023', '2023-01-03', '2023-01-02 09:35:38', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogocfdi`
--

CREATE TABLE `catalogocfdi` (
  `id` int(11) NOT NULL,
  `usoCfdi` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `catalogocfdi`
--

INSERT INTO `catalogocfdi` (`id`, `usoCfdi`, `descripcion`) VALUES
(1, 'G01', 'Adquisición de mercancías'),
(2, 'G02', 'Devoluciones, descuentos o bonificaciones'),
(3, 'G03', 'Gastos en general '),
(4, 'I01', 'Construcciones '),
(5, 'I02', 'Mobiliario y equipo de oficina por inversiones '),
(6, 'I03', 'Equipo de transporte'),
(7, 'I04', 'Equipo de cómputo y accesorios'),
(8, 'I05', 'Dados, troqueles, moldes, matrices y herramental '),
(9, 'I06', '	Comunicaciones telefónicas'),
(10, 'I07', 'Comunicaciones satelitales'),
(11, 'I08', 'Otra maquinaria y equipo'),
(12, 'D01', 'Honorarios médicos, dentales y gastos hospitalarios.'),
(13, 'D02', 'Gastos médicos por incapacidad o discapacidad '),
(14, 'D03', 'Gastos funerales.'),
(15, 'D04', 'Donativos'),
(16, 'D05', 'Intereses reales efectivamente pagados por créditos hipotecarios (casa habitación). '),
(17, 'D06', 'Aportaciones voluntarias al SAR. '),
(18, 'D07', 'Primas por seguros de gastos médicos. '),
(19, 'D08', 'Gastos de transportación escolar obligatoria.'),
(20, 'D09', 'Depósitos en cuentas para el ahorro, primas que tengan como base planes de pensiones. '),
(21, 'D10', 'Pagos por servicios educativos (colegiaturas)'),
(22, 'CP01', 'Pagos'),
(23, 'CN01', 'Nómina'),
(24, 'S01', 'Sin Efectos Fiscales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoclavessat`
--

CREATE TABLE `catalogoclavessat` (
  `id_claves` int(5) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `catalogoclavessat`
--

INSERT INTO `catalogoclavessat` (`id_claves`, `descripcion`, `clave`, `fecha`) VALUES
(1, 'Pieza', 'H87', '2023-05-08 11:59:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoestados`
--

CREATE TABLE `catalogoestados` (
  `id_estado` int(255) NOT NULL,
  `id_entidadFederativa` int(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `id_pais` int(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `catalogoestados`
--

INSERT INTO `catalogoestados` (`id_estado`, `id_entidadFederativa`, `estado`, `id_pais`, `fecha`) VALUES
(2, 1, 'AGUASCALIENTES', 89, NULL),
(3, 2, 'BAJA CALIFORNIA', 89, NULL),
(4, 3, 'BAJA CALIFORNIA SUR', 89, NULL),
(5, 4, 'CAMPECHE', 89, NULL),
(6, 5, 'COAHUILA DE ZARAGOZA', 89, NULL),
(7, 6, 'COLIMA', 89, NULL),
(8, 7, 'CHIAPAS', 89, NULL),
(9, 8, 'CHIHUAHUA', 89, NULL),
(10, 9, 'CIUDAD DE MEXICO', 89, NULL),
(11, 10, 'DURANGO', 89, NULL),
(12, 11, 'GUANAJUATO', 89, NULL),
(13, 12, 'GUERRERO', 89, NULL),
(14, 13, 'HIDALGO', 89, NULL),
(15, 14, 'JALISCO', 89, NULL),
(16, 15, 'ESTADO DE MEXICO', 89, NULL),
(17, 16, 'MICHOACAN DE OCAMPO', 89, NULL),
(18, 17, 'MORELOS', 89, NULL),
(19, 18, 'NAYARIT', 89, NULL),
(20, 19, 'NUEVO LEON', 89, NULL),
(21, 20, 'OAXACA', 89, NULL),
(22, 21, 'PUEBLA', 89, NULL),
(23, 22, 'QUERETARO DE ARTEAGA', 89, NULL),
(24, 23, 'QUINTANA ROO', 89, NULL),
(25, 24, 'SAN LUIS POTOSI', 89, NULL),
(26, 25, 'SINALOA', 89, NULL),
(27, 26, 'SONORA', 89, NULL),
(28, 27, 'TABASCO', 89, NULL),
(29, 28, 'TAMAULIPAS', 89, NULL),
(30, 29, 'TLAXCALA', 89, NULL),
(31, 30, 'VERACRUZ DE IGNACIO DE LA LLAVE', 89, NULL),
(32, 31, 'YUCATAN', 89, NULL),
(33, 32, 'ZACATECAS', 89, NULL),
(34, NULL, 'DISTRITO FEDERAL', 89, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogoregimen`
--

CREATE TABLE `catalogoregimen` (
  `id` int(11) NOT NULL,
  `codigo` int(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `catalogoregimen`
--

INSERT INTO `catalogoregimen` (`id`, `codigo`, `descripcion`) VALUES
(1, 605, 'Sueldos y Salarios e Ingresos Asimilados a Salarios'),
(2, 606, 'Arrendamiento'),
(3, 608, 'Demás ingresos'),
(4, 610, 'Residentes en el Extranjero sin Establecimiento Pemanente en México'),
(5, 611, 'Ingresos por Dividendos (socios y accionistas)'),
(6, 612, 'Personas Físicas con Actividades Empresariales y Profesionales'),
(7, 614, 'Ingresos por intereses '),
(8, 615, 'Régimen de los ingresos por obtención de premios'),
(9, 616, 'Sin obligaciones fiscales'),
(10, 621, 'Incorporación Fiscal'),
(11, 622, 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras'),
(12, 625, 'Régimen de las Actividades Empresariales con Ingresos a tráves de Plataformas Tecnologías '),
(13, 626, 'Régimen Simplificado de Confianza'),
(14, 629, 'De los Regímenes Fiscales Preferentes y de las Empresas Multinacionales'),
(15, 639, 'Enajenación de acciones en bolsa de valores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogounidaessat`
--

CREATE TABLE `catalogounidaessat` (
  `id_unidad` int(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `catalogounidaessat`
--

INSERT INTO `catalogounidaessat` (`id_unidad`, `nombre`, `unidad`, `fecha`) VALUES
(1, 'Dispositivo de almacenamiento de disco duro portátil', '43211805', '2023-04-14 11:24:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(7, 'Computadora', '2023-01-02 21:30:23'),
(8, 'Laptops', '2022-03-01 21:35:19'),
(9, 'All in One', '2022-03-01 21:35:28'),
(10, 'Accesesorios', '2022-04-19 10:31:24'),
(11, 'Gabinetes', '2022-04-27 10:39:57'),
(12, 'Memorias', '2022-04-27 10:40:17'),
(13, 'Gaming', '2022-04-27 10:40:38'),
(14, 'New', '2023-01-02 19:28:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `frecuente` int(11) NOT NULL COMMENT '1 = Cliente frecuente 2 = No frecuente',
  `documento` int(11) NOT NULL,
  `email` text NOT NULL,
  `telefono` text NOT NULL,
  `direccion` text NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `frecuente`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(21, 'Cliente Mostrador', 2, 0, 'na@gmail.com', '(777) 777-7777', 'NA', '0000-00-00', 13, '2024-04-20 15:49:26', '2024-04-20 20:49:26'),
(22, 'Refugio Lozano', 1, 0, 'refugiolozano@hotmail.com', '(477) 115-4980', 'Puntos de Venta', '0000-00-00', 2, '2024-04-20 15:45:51', '2024-04-20 20:45:51'),
(23, 'ALFONSO MARTINEZ LOPEZ', 1, 0, 'ponchomarpez@gmail.com', '(477) 647-7193', '', '0000-00-00', 10, '2023-11-10 00:04:09', '2023-11-10 05:04:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_mostrador`
--

CREATE TABLE `clientes_mostrador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `codigo_venta` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `clientes_mostrador`
--

INSERT INTO `clientes_mostrador` (`id`, `nombre`, `codigo_venta`) VALUES
(11, 'PAUL GARCIA', '10011'),
(12, 'Juan Ramírez', '10014');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_infofac`
--

CREATE TABLE `cliente_infofac` (
  `id_cliente` int(11) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `ExteriorNumber` int(11) DEFAULT NULL,
  `InteriorNumber` int(11) DEFAULT NULL,
  `Neighborhood` varchar(255) DEFAULT NULL,
  `ZipCode` int(255) DEFAULT NULL,
  `Locality` varchar(255) DEFAULT NULL,
  `Municipality` varchar(255) DEFAULT NULL,
  `StateF` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Rfc` varchar(255) DEFAULT NULL,
  `CfdiUse` varchar(255) DEFAULT NULL,
  `TaxZipCode` int(255) DEFAULT NULL,
  `FiscalRegime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `cliente_infofac`
--

INSERT INTO `cliente_infofac` (`id_cliente`, `Street`, `ExteriorNumber`, `InteriorNumber`, `Neighborhood`, `ZipCode`, `Locality`, `Municipality`, `StateF`, `Country`, `Rfc`, `CfdiUse`, `TaxZipCode`, `FiscalRegime`) VALUES
(23, 'Eufrasia Pantoja ', 214, 0, 'León II', 37408, NULL, 'León', 'GUANAJUATO', 'MEXICO', 'MALA941104D14', 'G03', NULL, '626');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos_productos`
--

CREATE TABLE `codigos_productos` (
  `id` int(11) NOT NULL,
  `codigo` char(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_producto` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `codigos_productos`
--

INSERT INTO `codigos_productos` (`id`, `codigo`, `cantidad`, `descripcion`, `id_producto`, `fecha`) VALUES
(2, '9757929671', NULL, 'ASD', NULL, '2023-10-12 20:56:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `complemento_producto`
--

CREATE TABLE `complemento_producto` (
  `id_producto` int(5) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `ram` int(5) DEFAULT NULL,
  `dd` int(5) DEFAULT NULL,
  `procesador` varchar(255) DEFAULT NULL,
  `tam_pantalla` varchar(255) DEFAULT NULL,
  `graficos` varchar(255) DEFAULT NULL,
  `ssd` int(5) DEFAULT NULL,
  `hhd` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `complemento_producto`
--

INSERT INTO `complemento_producto` (`id_producto`, `marca`, `ram`, `dd`, `procesador`, `tam_pantalla`, `graficos`, `ssd`, `hhd`) VALUES
(35, 'HP', 6, NULL, 'I7', '17', '26', 36, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

CREATE TABLE `componentes` (
  `id` int(255) NOT NULL,
  `capacidad` varchar(255) DEFAULT NULL,
  `acron` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id`, `capacidad`, `acron`, `descripcion`, `tipo`, `fecha`) VALUES
(1, '4', 'GB', NULL, 'RAM', '2022-04-21 12:39:17'),
(4, '128', 'GB', NULL, 'SSD', '2022-04-21 12:39:20'),
(6, '8', 'GB', NULL, 'RAM', '2022-04-22 11:26:25'),
(8, '16', 'GB', NULL, 'RAM', '2023-01-02 22:05:39'),
(9, '32', 'GB', NULL, 'RAM', '2023-01-02 22:05:45'),
(10, '64', 'GB', NULL, 'RAM', '2023-01-02 22:05:45'),
(11, '128', 'GB', NULL, 'RAM', '2023-01-02 22:05:46'),
(12, '80', 'GB', NULL, 'HHD', '2023-01-04 19:14:58'),
(13, '160', 'GB', NULL, 'HHD', '2023-01-04 19:15:02'),
(14, '250', 'GB', NULL, 'HHD', '2023-01-04 19:15:05'),
(15, '320', 'GB', NULL, 'HHD', '2023-01-04 19:15:09'),
(16, '500', 'GB', NULL, 'HHD', '2023-01-04 19:15:12'),
(17, '750', 'GB', NULL, 'HHD', '2023-01-04 19:15:15'),
(18, '1', 'TB', NULL, 'HHD', '2023-01-04 19:15:17'),
(19, '2', 'TB', NULL, 'HHD', '2023-01-04 19:15:19'),
(20, '128', 'MB', NULL, 'Graphics', '2023-01-02 22:08:24'),
(21, '256', 'MB', NULL, 'Graphics', '2023-01-02 22:08:25'),
(22, '512', 'MB', NULL, 'Graphics', '2023-01-02 22:08:25'),
(23, '750', 'MB', NULL, 'Graphics', '2023-01-02 22:08:25'),
(24, '1', 'GB', NULL, 'Graphics', '2023-01-04 19:23:03'),
(25, '1.5', 'GB', NULL, 'Graphics', '2023-01-04 19:23:09'),
(26, '2', 'GB', NULL, 'Graphics', '2023-01-02 22:08:25'),
(27, '4', 'GB', NULL, 'Graphics', '2023-01-02 22:08:26'),
(28, '6', 'GB', NULL, 'Graphics', '2023-01-02 22:08:26'),
(29, '8', 'GB', NULL, 'Graphics', '2023-01-02 22:08:26'),
(30, '12', 'GB', NULL, 'Graphics', '2023-01-02 22:08:26'),
(31, '16', 'GB', NULL, 'Graphics', '2023-01-02 22:08:26'),
(32, '64', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(33, '120', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(34, '128', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(35, '240', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(36, '256', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(37, '480', 'GB', NULL, 'SSD', '2023-01-02 22:11:02'),
(38, '500', 'GB', NULL, 'SSD', '2023-01-02 22:11:03'),
(39, '512', 'GB', NULL, 'SSD', '2023-01-02 22:11:03'),
(40, '960', 'GB', NULL, 'SSD', '2023-01-02 22:11:03'),
(41, '1', 'TB', NULL, 'SSD', '2023-01-02 22:11:03'),
(42, '2', 'TB', NULL, 'SSD', '2023-01-02 22:11:03'),
(43, 'Sin HHD', NULL, NULL, 'HHD', '2023-01-04 13:24:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_prod_factura`
--

CREATE TABLE `comp_prod_factura` (
  `IdentificationNumber` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `UnitCode` varchar(255) DEFAULT NULL,
  `Taxes` varchar(255) DEFAULT NULL,
  `ObjetoImp` varchar(255) DEFAULT NULL,
  `id_producto` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `comp_prod_factura`
--

INSERT INTO `comp_prod_factura` (`IdentificationNumber`, `Descripcion`, `Nombre`, `Price`, `Unit`, `UnitCode`, `Taxes`, `ObjetoImp`, `id_producto`) VALUES
('12345678', 'PANTALLA OLED DE 55 PULGADAS CON ANDROID IOS', 'PANTALLA SONY', NULL, 'H87', '43211805', '.08', '02', 23),
('87654321', 'MOUSE INALAMBRICO DE 500000 DPIS', 'MOUSE ', NULL, 'H87', '43211805', '.08', '02', 24),
('85213647', 'AUDIFONOS MARCA SONY INALAMBRICOS CON 6 HORAS DE REPRODUCCIÓN', 'AUDIFONOS', NULL, 'H87', '43211805', '0', '01', 25),
('74185263', 'HUB DE USB MARCA MOCH CON 6 ENTRADAS ', 'HUB', NULL, 'H87', '43211805', '.08', '02', 26),
('36258741', 'USB DE 250 GB MARCA KINGSTON', 'USB', NULL, 'H87', '43211805', '0', '01', 27),
('12345676', 'CABLDE RED COLO ROJO DE 10 MTS.', 'CABLE RJ45', NULL, 'H87', '43211805', '.08', '02', 28),
('74563218', 'LIMPIADOR DE PANTALLAS MARCA PATO', 'LIMPIADOR DE PANTALLAS', NULL, 'H87', '43211805', '0', '01', 29),
('21365476', 'PASTA TERMICA PARA PROCESADOR', 'PASTA TERMICA', NULL, 'H87', '43211805', '.08', '02', 30),
('96321548', 'CABLE USB DE 2 MTS. COLOR NEGRO', 'CABLE USB', NULL, 'H87', '43211805', '0', '02', 31),
('85213647', 'CAMARA FOTOGROFICA PROFESIONAL', 'CAMARA', NULL, 'H87', '43211805', '.08', '02', 32),
('753159', 'TELÉFONO INHALAMBRICO CON 30 MTS DE ALCANCE ', 'TELÉFONO ', NULL, 'H87', '43211805', '.08', '02', 33),
('9757929671', 'COLOR: BLANCO\r\nCAPACIDAD: 1TB', 'USB', NULL, 'H87', '43211805', '.08', '02', 34),
('a6662342101', 'Kit de limpieza de pantallas de LCD', 'Kit Limpieza', NULL, 'H87', '43211805', '.16', '01', 34),
('KJSKJ389213', 'COMPUTADORA DE ESCRITORIO CON TECLADO Y RATON INCLUIDO', 'HP', NULL, 'H87', '43211805', '.16', '01', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_caja`
--

CREATE TABLE `corte_caja` (
  `id` int(11) NOT NULL,
  `monto_inicial` float DEFAULT NULL,
  `monto_final` float DEFAULT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `total_servicios` int(11) DEFAULT 0,
  `total_ventas` int(11) DEFAULT 0,
  `monto_total` float DEFAULT NULL,
  `estatus` int(11) DEFAULT 1,
  `id_usuario` varchar(255) DEFAULT '',
  `id_caja` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `corte_caja`
--

INSERT INTO `corte_caja` (`id`, `monto_inicial`, `monto_final`, `fecha_apertura`, `fecha_cierre`, `total_servicios`, `total_ventas`, `monto_total`, `estatus`, `id_usuario`, `id_caja`) VALUES
(15, 1500, 29, '2023-01-02 09:36:47', '2023-01-03 01:44:33', 0, 1, 1529, 0, 'Marco Aguilar Olmedo', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emisorfacturacion`
--

CREATE TABLE `emisorfacturacion` (
  `tipoPersona` varchar(255) DEFAULT NULL,
  `giro` varchar(255) DEFAULT NULL,
  `nombreFiscal` varchar(255) DEFAULT NULL,
  `nombreComercial` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` int(12) DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `regimenFiscal` varchar(255) DEFAULT NULL,
  `codigoPostal` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `numeroExt` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `emisorfacturacion`
--

INSERT INTO `emisorfacturacion` (`tipoPersona`, `giro`, `nombreFiscal`, `nombreComercial`, `email`, `telefono`, `tamaño`, `regimenFiscal`, `codigoPostal`, `calle`, `numeroExt`, `colonia`, `localidad`, `municipio`, `estado`, `pais`) VALUES
('0(moral)', '21 (Informática/Telecomunicaciones)', 'ESCUELA KEMPER URGATE', 'ESCUELA KEMPER URGATE', 'facturacionhellssystems@gmail.com', 477647719, 'micro', '601', '26015', 'CLAVELES', '208', 'Jardines de Jerez II', NULL, 'León', 'Guanajuato', 'MEXICO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_mov_bodega`
--

CREATE TABLE `historial_mov_bodega` (
  `id` int(11) NOT NULL,
  `id_bodega` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `cantidadLlegadas` int(11) NOT NULL,
  `tipo_movimiento` varchar(255) DEFAULT NULL,
  `fecha_mov` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `id_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `historial_mov_bodega`
--

INSERT INTO `historial_mov_bodega` (`id`, `id_bodega`, `cantidad`, `cantidadLlegadas`, `tipo_movimiento`, `fecha_mov`, `id_usuario`) VALUES
(4, '8', '10', 0, '1', NULL, '60'),
(5, '8', '12', 0, '1', NULL, '60'),
(6, '9', '5', 0, '0', NULL, '62'),
(7, '10', '5', 0, '0', NULL, '62'),
(8, '11', '5', 0, '1', NULL, '62'),
(9, '8', '12', 0, '1', NULL, '60'),
(10, '8', '10', 0, '0', NULL, '60'),
(11, '12', '10', 0, '1', NULL, '62'),
(12, '13', '10', 0, '1', NULL, '60'),
(13, '13', '10', 0, '1', NULL, '62'),
(14, '13', '5', 0, '0', NULL, '62'),
(15, '14', '18', 0, '1', NULL, '62'),
(17, '15', '12', 12, '1', '2023-01-24 17:24:26', '60');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `codigo_venta` varchar(255) DEFAULT NULL,
  `total` float(255,0) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `abono` float DEFAULT NULL,
  `abonado` float(255,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `codigo_venta`, `total`, `fecha`, `abono`, `abonado`) VALUES
(44, '10001', 454, '2023-10-13 14:30:42', 200, NULL),
(45, '10001', 454, '2023-10-13 15:00:06', 250, NULL),
(46, '10008', 11016, '2023-10-16 10:46:12', 200, NULL),
(47, '10010', 437, '2023-11-10 00:04:09', 100, NULL),
(48, '10010', 437, '2023-11-10 05:05:34', 200, 300),
(49, '10010', 437, '2023-11-10 05:08:18', 137, 437);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidospaqueteria`
--

CREATE TABLE `pedidospaqueteria` (
  `id` int(11) NOT NULL,
  `folio` varchar(250) NOT NULL,
  `nombreCompleto` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `idCiudad` varchar(255) DEFAULT '',
  `idEstado` varchar(255) DEFAULT '',
  `telefono` varchar(10) DEFAULT '',
  `entreCalles` varchar(255) DEFAULT NULL,
  `referencias` varchar(255) DEFAULT NULL,
  `estatus` tinyint(4) NOT NULL,
  `fechaAlta` varchar(0) DEFAULT '',
  `archivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedidospaqueteria`
--

INSERT INTO `pedidospaqueteria` (`id`, `folio`, `nombreCompleto`, `calle`, `cp`, `colonia`, `idCiudad`, `idEstado`, `telefono`, `entreCalles`, `referencias`, `estatus`, `fechaAlta`, `archivo`) VALUES
(8, '', 'Angelica Rodríguez Delgado ', 'Cantador 83 ', 36580, 'Guanajuato ', 'Irapuato ', 'Guanajuato ', '4622557606', 'Avenida Guanajuato y cubilete', 'Es un local con cortina color rosa ', 4, '', ''),
(12, '', 'Luis saul vazquez gutierrez', 'Av Adolfo López mateos #37 ', 90460, 'Centro', 'Xaloztoc ', 'Tlaxcala ', '2411453023', 'Esquina carretera México veracruz ', 'Deposito casa Vázquez pintado de color rojo Coca cola ', 4, '', ''),
(13, '', 'Alam Hernández Bautista ', 'Violeta #302', 89358, 'Luis Donaldo Colosio ', 'Tampico ', 'Tamaulipas ', '8331270679', 'Calle ganadera y calle Vicente Guerrero ', 'Entre una estética color verde y parada de los micros aviación América ', 4, '', ''),
(14, '', 'Jesús Manuel Naranjo González ', 'Santos degollado oriente 138', 61508, 'Héroes ferrocarrileros ', 'Zitácuaro ', 'Michoacán ', '7151275106', 'Mora del cañonazo y general pueblita ', 'Paletería paricutin fachada amarillo y azul ', 4, '', ''),
(15, '', 'Rodolfo Arzate Ortega', 'Cda. Benito Juárez  Lt. 7,  Mz. 1 ', 14427, 'San Juan Tepeximilpa', 'Ciudad de México', 'Ciudad de México', '5528225393', 'Pirindos y calle Benito Juárez', 'Zaguán café, facha verde agua, casa de dos pisos.', 4, '', ''),
(16, '', 'Federico Núñez Gutiérrez ', 'Héroes de Chapultepec #1604 Nte.', 89060, 'Tamaulipas ', 'Tampico ', 'Tamaulipas ', '8333534215', 'Matamoros y Xicoténcatl ', 'Casi enfrente de Depósito los Gordos.', 4, '', ''),
(19, '', 'Daniel Jesús Chanes Tovar ', 'Constitución 38', 55880, 'San Bartolo Acolman ', 'Acolman ', 'Edo. De México ', '5541392196', 'Benito Juárez y privada de Constitución ', 'Taller mecanico ', 4, '', 'uploads/inbound976231405256079210.jpg'),
(21, '555855555', 'Alma deli rincón arguello', 'C.porfirio díaz s/n ', 94210, 'Santa rosa 1 ', 'Boca del monte.comapa', 'Veracruz', '2731183457', 'Porfirio díaz y carretera a pochote nuevo', 'Rumbo a pochote nuevo primer entrada a la derecha casa azul de dos pizos, llegando al centro de boca del monte a la derecha en la parroquia primer entrada a la derecha ..casa azul dos pisos..', 4, '', 'uploads/IMG_20230213_104055.jpg'),
(22, '', 'Federico Núñez Gutiérrez ', 'Héroes de Chapultepec # 1604 Nte.', 89060, 'Tamaulipas ', 'Tampico ', 'Tamaulipas ', '8333534215', 'Matamoros y Xicoténcatl ', '1/2 del Colegio Alfonso de Ligorio rumbo al Sur', 4, '', 'uploads/inbound1113841874582375778.pdf'),
(23, '0695432339', 'Laura Gabriela Olivares Hernández', 'Laberintos # 172', 91790, 'Fracc. Laguna Real', 'Veracruz', 'Veracruz', '2292009816', 'los halcones y las golondrinas ', 'SGI SERVICIOS Y GESTION INDUSTRIAL ', 4, '', 'uploads/PAGO COMPUTADORA HP (1).pdf'),
(24, '', 'EMMANUEL DE JESÚS', 'Avenida Principal SN', 50754, 'SAN CRISTOBAL DE LOS BAÑOS', 'Estado de México ', 'Estado de México ', '7491090684', 'Avenida principal ', '200 metros después de la escuela primaria. Dr Sergio valdes arias, es una barda de piedra ', 0, '', 'uploads/20230321_115154.jpg'),
(25, '', 'EDUARDO ANTONIO ENRIQUEZ ÁLVAREZ  JEFE DE COMPRAS', 'ACCESO B NO 108', 76127, 'PARQUE INDUSTRIAL JURICA', 'QUERÉTARO', 'QUERÉTARO', '4426225157', 'ENTRE AVENIDA 5 DE FEBRERO Y ENTRECALLE 1', 'SIN DATOS', 4, '', 'uploads/PAGO HELLS SYSTEMS $6,934.48 (1).pdf'),
(26, '', 'Sandra Salceda Martínez ', 'Francisco de Urdiñola  625 local 2', 25000, 'Zona centro', 'Saltillo', 'Coahuila', '8442978750', 'Melchor Muzquiz y Jacobo M. Aguirre', 'Plaza Bonita', 0, '', 'uploads/IMG-20230411-WA0006.jpg'),
(27, '', 'Francisco Ignacio Zenteno Gómez', 'Av. Insurgentes Sur 1763 6° Piso Alvaro Obregon', 1020, 'Guadalupe Inn', 'Ciudad de México', 'Ciudad de México', '5514668130', 'Juan Pablo II y Ernesto Elorduy', 'La torre está entre un estacionamiento y un Oxxo', 4, '', 'uploads/Pago Laptop Lenovo.pdf'),
(28, '', 'Roberto Cornejo García ', 'Paseo No. 73', 46200, 'Centro ', 'Colotlán ', 'Jalisco ', '3334052624', 'Josefa Ortiz y 5 de Mayo', 'A 10 m de la Calle Josefa Ortiz ', 2, '', 'uploads/inbound1229263833440497151.jpg'),
(30, '', 'Jose moises estrada luna ', 'Paseo cabo de oro # 39, Interior-18 Manzana 39 Lote 18', 23473, 'Los cangrejos ', 'Cabo san lucas ', 'Baja California sur ', '6241164938', 'Puerto escondido y loreto ', 'Enfrente de una tortilleria que se llama arroyo,  es una casa de dos pisos pero el segundo piso no está terminado ', 3, '', 'uploads/Screenshot_20230518_111610.jpg'),
(31, '', 'Josue Jeziel Lopez Lorca', 'Av.Puerta de Piedra No.603', 86287, 'R/A Lazaro Cardenas 1era Secc', 'Villahermosa', 'Tabasco', '9934265093', 'Av. Bicentenario, a la entrada de Valle del Jaguar', 'Edificio color Blanco, Residencial Abrika, frente a Puerta Azul, a la entrada de Valle del Jaguar', 4, '', 'uploads/8bee2313-af7e-4c3e-98e8-efc7676e1c85.jpeg'),
(32, '', 'Bernardo Lauro Hernández Hernández ', 'Sur 161# 2206', 8000, 'Ramos millan ', 'Alcaldía Iztacalco, Cdmx', 'Cdmx', '5515885687', 'Oriente 106 y avenida recreo\r\n', 'A 4 calles de la delegación iztacalco\r\n', 3, '', 'uploads/inbound8235021753185325118.jpg'),
(33, '', 'JESÚS DOMÍNGUEZ CRUZ', 'BLVD. CENTRO SUR #89', 76090, 'FRACCIONAMIENTO COLINAS DEL CIMATARIO', 'QUERÉTARO', 'QUERÉTARO', '4412650819', 'AV. COLINAS DEL CIMATARIO Y CERRO DE ACULTZINGO', 'A 50 METROS DE TELEVISA QUERETARO', 3, '', 'uploads/WhatsApp Image 2023-06-03 at 11.03.36.jpeg'),
(34, '', 'Jose cuauhtemoc martinez mendez', 'Morelos sur 1063-A', 58020, 'Ventura puente', 'Morelia', 'Michoacan', '4434101216', 'Entre lago de patzuaro y lago de cuitzeo', 'Frente auditorio municipal ', 3, '', 'uploads/Screenshot_20230606-122156_WhatsApp.jpg'),
(35, '', 'Jorge Armando De Leon Morales', 'Blvd. Fundadores #4055-L-10', 25010, 'Vista Hermosa ', 'Saltillo ', 'Coahuila', '8441981774', 'Avenida Central y Avenida Oriente', 'se va a recoger el paquete en la paqueteria Estafeta en plaza comercial Fundadores', 3, '', 'uploads/Comprobante de Pago.png'),
(36, '', 'Mauricio Penagos Malda', 'blvd. Dr Belisario Dominguez 4120 ', 29020, 'Col. Jardines de Tuxrla', 'Tuxtla Gutierrez', 'Chiapas', '9616170000', 'Frente a la UNACH', 'Zona Hotelera ', 3, '', 'uploads/photo_2023-06-08_05-27-09.jpg'),
(38, '', 'Silvio Retana Diego', 'Alamos #42, Olinala, C. P. 39074 Chilpancingo de los Bravo, Gro.', 39074, 'Alamos', 'Chilpancingo de los Bravos', 'GUERRERO', '7475173287', 'Cedro y olinala', 'Sucursal estafeta chilpancingo de los bravos estado de Guerrero ', 3, '', 'uploads/pago de pc.pdf'),
(39, '', 'Rebeca Sarahy Sánchez García ', 'Miranda 403 ', 25107, 'Asturias ', 'Saltillo ', 'Coahuila ', '8443923335', 'Belmonte y Gijon ', 'Casa de 2 pisos color blanca árbol con flores rosas ', 2, '', 'uploads/8064FF39-67A0-445E-8B92-567E66F89EA9.jpeg'),
(40, '', 'Rebeca Sarahy Sánchez García ', 'Miranda 403 ', 25107, 'Asturias ', 'Saltillo ', 'Coahuila ', '8443923335', 'Belmonte y Gijon ', 'Casa de 2 pisos color blanca árbol con flores rosas ', 3, '', 'uploads/8064FF39-67A0-445E-8B92-567E66F89EA9.jpeg'),
(41, '1877443481', 'Diana Carolina Kruse Madrid', 'Leona Vicario 1048', 52154, 'Real de arcos', 'Metepec', 'México', '7228210660', 'Estefanías y Paseo del Calvario', 'Es una plaza comercial \"Plaza Leona\", la entrega se realiza en caseta de vigilancia que está enseguida de laboratorio Olarte y Akle. La plaza está en esquina de Leona Vicario y Estefanías. En la plaza están visibles el bar panic botanic y el laboratorio O', 4, '', 'uploads/Screenshot_2023-06-24-11-32-44-580.jpg'),
(42, '2711852303', 'Sheila Yolanda Méndez Vázquez ', 'Progreso interior SN de abajo de la iglesia', 93000, 'Centro', 'Zozocolco de hidalgo ', 'Veracruz ', '7841045956', 'Miguel Negrete, Barrio norte ', 'Junto a la funeraria palomino, abajo de la iglesia de zozocolco ', 4, '', 'uploads/IMG-20230626-WA0004.jpg'),
(43, '4101340204', 'Juan Angel Jr Candelaria Aguilar ', 'Carretera federal iguala a cocula ', 40100, 'Metlapa', 'Iguala', 'Guerrero', '7331999579', 'A un lado de la primer miscelánea frente a la primer entrada', 'A bordo de carretera ', 4, '', 'uploads/20230628_102907.jpg'),
(44, '2904720698', 'Fernando González Cortés ', 'Cuarta Cerrada de Pedro Nolasco Mz. 2 Lote 2', 7100, 'Cuautepec Barrio Alto', 'Ciudad de México ', 'Alcaldía Gustavo A. Madero', '5518403750', 'Av. Miguel Lerdo de Tejada y Tercera Cerrada de Pedro Nolasco', 'A unas cuadras de la primaria Juventino Rosas', 3, '', 'uploads/Pago Fernando González Cortés.png'),
(45, '0529364758', 'Gustavo Saldaña Negrete', 'Salinas de Gortari #12', 36974, 'Francisco I.Madero', 'Abasolo ', 'Guanajuato ', '4622207410', 'Duraznos y solidaridad ', 'Detrás de la tortillería ', 3, '', 'uploads/IMG-20230702-WA0001.jpg'),
(46, '0913394823', 'Juan Enrique Romero Vázquez', 'Avenida 15', 94680, 'Lázaro Cárdenas', 'Córdoba', 'Veracruz', '2712597414', 'calles 51 y 53', 'Casa de tres pisos, color naranja, con un árbol afuera en un redondel rojo, está a media cuadra la casa.', 0, '', 'uploads/WhatsApp Image 2023-06-30 at 10.46.39 PM.jpeg'),
(47, '', 'JUAN PABLO RIVAS CERVANTES', 'HIDALGO 220', 36588, 'BARRIO DE SANTIAGUITO', 'IRAPUATO', 'GUANAJUATO', '4631938637', 'GALEANA Y AMADO NERVO', 'CASI FRENTE A PREPARATORIA CEIR', 0, '', 'uploads/WhatsApp Image 2023-07-06 at 2.47.54 PM.jpeg'),
(48, '3548062772', 'Jose Luis Mendez Guerra', 'Carrera torres 1509 ote', 87000, 'Zona centro', 'Cd. Victoria ', 'Tamaulipas', '8342660980', 'Entre calle 2 y 3', 'Negocio de muebles de oficina', 0, '', 'uploads/WhatsApp Image 2023-07-10 at 13.53.18.jpeg'),
(49, '3599584802', 'Alan Martinez ', 'Privada Segunda Privada  111', 68130, 'Candiani', 'Oaxaca de Juarez ', 'OAXACA', '9512281091', 'La luz ', 'Color amarrillo con portones cafe (obed)', 0, '', 'uploads/IMG-20230719-WA0034.jpg'),
(50, '1641338392', 'Gonzalo de Jesus Ruiz Ibañez ', 'Bulevard Lazaro Cardenas 744 Norte', 59013, 'San Isidro', 'Sahuayo', 'Michoacan ', '3531239106', 'Entre calle camelinas y Bulevard lazaro cardenas \r\n1641338392, 2945499278', 'Frente a la abarrotera La nueva merced, es un negocio donde se comercializan teja, canteras piedras etc. Se puede recibir en horario de oficina de 9 a.m  a 2 p.m  y de 4 p.m a 6 p.m.', 0, '', 'uploads/Ubicacion.JPG'),
(51, '', 'Gamaliel Hernandez Salvador', 'Yahual Manzana 15 Lote 16 SN', 86017, 'Indeco', 'villahermosa', 'tabasco', '9931528955', 'Av. martirez de rio blanco y  la Batea\r\n', 'Casa color Rosa Mexicano con Herreria negra, frente a poste de Energia Electrica ', 4, '', 'uploads/Comprobante pago PC Gamaliel Hernandez Salvador.jpg'),
(52, '', 'Sergio Gutiérrez Flores ', 'Hungaros 6 ', 1130, 'El paraiso', 'Cemx', 'Cdmx', '5549360570', 'Av paraiso. Y av pólvora ', 'Casa gris. Puertas verdes ', 0, '', 'uploads/0ccae171-e242-46ca-91df-6acc2aeb3d34.jpeg'),
(53, '', 'Jeffrey Tashman', 'Callejón de Cerbatana 40-24', 36000, 'Centro', 'Guanajuato', 'Guanajuato', '4737325558', 'Callejones', 'Reja blanca no cerrada con llave al lado derecho de la primaria en Plaza Mexiamora', 0, '', 'uploads/9.png'),
(54, '', 'GAMALIEL HERNANDEZ SALVADOR ', 'Yahual Manzana 15 Lote 16', 86017, 'Indeco Unidad', 'Villahermosa ', 'Tabasco', '9931528955', 'calle Martires de Rio Blanco y calle La Batea', 'a 100 metros de Deposito de Cerveza FAYO', 0, '', 'uploads/Comprobante pago Tablet Gamaliel Hernandez Salvador.jpg'),
(56, '', 'Ricardo Pimentel ', 'Caoba 130', 54715, 'Exhacienda San Miguel ', 'Cuautitlan Izcalli ', 'México ', '5576467256', 'Paseo exhacienda San Miguel y Av. Huehuetoca ', 'Frente a Plaza San Miguel ', 0, '', 'uploads/Screenshot_2023-08-14-12-14-38-778_org.microemu.android.model.common.VTUserApplicationBNRTMB.jpg'),
(57, '', 'Miguel Angel Gutierrez Muñoz', 'Cond Cima int 13', 54944, 'La loma', 'Mexico', 'Estado de Mexico', '5538759456', 'Hermenegildo Galeana ', 'A un lado del deportivo Buenavista. ', 4, '', 'uploads/comprobante_transferencia_18-Sep-2023_16_27_12 h.pdf'),
(58, '', 'Adilene Jiménez Camas ', '34 B Poniente # 3125-201', 72070, 'Valle Dorado ', 'Puebla ', 'Puebla', '2216488777', '33 Norte y Blvd Norte ', 'Edificio color blanco rejas cuadradas ', 4, '', 'uploads/inbound5811498964503831478.jpg'),
(59, '', 'Francisco Javier Rodea Cedillo', 'Norte 73 No. 292', 2530, 'Jardín Azpeitia ', 'Ciudad de México ', 'Azcapotzalco ', '5536601778', 'Salonica y Aquiles Elorduy', 'A dos cuadras glorieta de camarones ', 4, '', 'uploads/ce71d3b8-5c42-454e-83e4-d5049a4d3d48.jpeg'),
(60, '', 'CRISTINA GAMBOA MORALES', 'GALLARETAS 5', 96538, 'SANTA ISABEL 3', 'COATZACOALCOS', 'VERACRUZ', '9211501442', 'CANARIOS Y TORDOS', 'ANDADOR, PORTÓN BLANCO, FRENTE A IGLESIA AMARILLA DE 2 PISOS', 4, '', 'uploads/TRANSF_HELLSYSTEMS051023R.pdf'),
(61, '', 'Teofilo Méndez Gordillo ', 'Avenida central num 17', 29930, 'Centro', 'Yajalon', 'Chiapas ', '9613698157', 'Yajalón centro ', 'Dejar en MULTIENVIOS SJT, FRENTE A TORRE LLAVEN ', 4, '', 'uploads/inbound7210109914816507946.jpg'),
(64, '', 'Francisco Javier Rodea Cedillo', 'Norte 73 No. 292', 2530, 'Jardín Azpeitia ', 'Ciudad de México ', 'Azcapotzalco ', '5536601778', 'Salonica y Aquiles Elorduy', 'A dos cuadras glorieta de camarones ', 4, '', 'uploads/ce71d3b8-5c42-454e-83e4-d5049a4d3d48.jpeg'),
(65, '', 'Josue Jeziel Lopez Lorca', 'Av. Puerta de Piedra No.603', 86287, 'R/A Lazaro Cardenas 1A', 'Villahermosa ', 'TABASCO', '9934265093', 'Residencial Abrika', 'Edificio Color Blanco, frente a la Privada Puerta Azul, justo a la entrada de Valle de Jaguar', 4, '', 'uploads/IMG_6471.png'),
(66, '', 'Josue Jeziel Lopez Lorca', 'Av. Puerta de Piedra No.603', 86287, 'R/A Lazaro Cardenas 1A', 'Villahermosa', 'TABASCO', '9934265093', 'Residencial Abrila', 'Edificio Color Blanco, frente a la Privada Puerta Azul, justo a la entrada de Valle de Jaguar', 4, '', 'uploads/IMG_6471.png'),
(67, '', 'CRISTINA GAMBOA MORALES', 'GALLARETAS 5', 96538, 'SANTA ISABEL 3', 'COATZACOALCOS', 'VERACRUZ', '9211501442', 'CANARIOS Y TORDOS', 'ANDADOR, PORTÓN BLANCO, FRENTE A INGLESIA AMARILLA', 2, '', 'uploads/TRANSF_HELLSSYSTEMS031123R.pdf'),
(68, '', 'Luis Carrillo ', 'Hacienda Vegil 410', 76180, 'Jardines de la hacienda ', 'Querétaro ', 'Querétaro ', '4424001266', 'Prolongación Zaragoza y hacienda escolásticas', 'Casa blanca, puerta metálica grande color café ', 4, '', 'uploads/inbound8470165435197597355.pdf'),
(70, '', 'Rafael Pantoja Domínguez ', 'Lago #452', 78438, 'Quintas de la hacienda II ', 'Soledad de Graciano Sánchez ', 'San Luis Potosí ', '4444517288', 'Avenida cactus y avenida cordillera oriental ', 'Cerca hay una escuela, es la única casa de color verde con árbol en el jardín ', 4, '', 'uploads/mercadopago_comprobante_66891001309.pdf'),
(71, '1836271624', 'Cristian Fransisco Morales López ', 'Callé central norte sn número ', 29950, 'Barrio linda vista ', 'OCOSINGO', 'CHIAPAS', '9191125799', 'Entre la séptima y octava \r\n', 'Una calle antes del bulevar por la procuraduría agraria o el salón castillo mágico\r\n', 3, '', 'uploads/Recibo_Mon Nov 20 16_35_33 CST 2023.jpg'),
(72, '1331931061', 'Victor Manuel Mendez Orozco', 'Del Sabino #221', 38600, 'Centro', 'Acambaro', 'Guanajuato', '4171134500', 'Calle Morelos y Av. Primero de Mayo', 'Casa color blanco, 2pisos, hay jardin afuera, y un local de telcel en la misma casa.', 3, '', 'uploads/Imagen de WhatsApp 2023-11-21 a las 19.31.59_bbf22d26.jpg'),
(73, '4164566927', 'Jose Francisco Medina Suriano ', 'Calle azucenas 118', 29040, 'Fraccionamiento Buenaventura', 'Tuxtla Gutierrez', 'Chiapas', '9611662078', 'Carlos Maciel y tulipanes ', 'Entre fraccionamiento San Roque y brasilito ', 3, '', 'uploads/SCB20231122_124819979000.jpg'),
(74, '0914237721', 'Alan Mier Socorro', 'Gaviotas 11 int b301', 7460, 'Granjas Modernas', 'GUSTAVO A. MADERO', 'CIUDAD DE MEXICO (CMX)', '5530187488', 'Entre pelícano y faisan', 'Edificio color beige de 5 pisos, y tiene el número 11 en la entrada principal', 3, '', 'uploads/Screenshot_20231122-144445.png'),
(75, '3814957769', 'Luis Roberto llaven castellano', 'Avenida sunyaxchen M 22 lote 38 ', 77509, 'Super manzana 24', 'Cancun', 'Quintana roo', '9982603276', 'Domicilio conocido ', 'Entrega ocurre, Enfrente del mercado 23, Sucursal de Estafeta', 4, '', 'uploads/Screenshot_20231123-183848.jpg'),
(76, '', 'ANTONIO DIAZ SERAFICO', 'RETORNO 7 NO. 2915', 94640, 'HUILANGO', 'CORDOBA', 'VERACRUZ', '2711137656', 'ENTRE CALLES 29 Y 31', 'CASA AMARILLA CON CAFE ABAJO - PLANTAS AFUERA', 4, '', 'uploads/HELLS SYSTEMS 301123 HPWM4.pdf'),
(77, '', 'Gustavo Venegas', 'MZ12 Lote 125 Andador Kaan ', 77760, 'Aldea Zama', 'Tulúm', 'Qroo.', '4151003354', 'Entre Andador Kambul y Calle Itzamná', 'Es un hotel, se llama \"loba\" ', 1, '', 'uploads/6dcad159-33d3-4959-acfd-427fb13724c2.jpeg'),
(78, '', 'Luis Enrique Jiménez Grassi', 'Heroico Colegio Militar 305-B', 93400, 'Centro. Barrio del Naranjo', 'Papantla de Olarte', 'Veracruz', '7822616891', 'Venustiano Carranza Y Juan Leal', 'Al lado del Bar \"Estadio\" puerta blanca fachada verde. Tocar timbre', 3, '', 'uploads/Screenshot_20231220_165948_albo.jpg'),
(79, '', 'Jesus Fernando Moreno Romero ', 'Capoc #103', 38016, 'Geovillas los sauces ', 'Celaya', 'Guanajuato ', '4611795277', 'Corozo y Av. El sauz', 'Casa con portón de reja blanco al lado de una barbería.', 3, '', 'uploads/inbound7667612646800776522.pdf'),
(80, 'garantia', 'Erick Daniel López Ríos ', 'Calle séptima  #2231', 26016, 'Ampliación Doña irma', 'Piedras Negras', 'Coahuila', '8781345839', 'Sexta y quinta', 'A 3 cuadrad de escuela CECATI', 1, '', 'uploads/1-54f64a3af1.jpg'),
(82, '', 'ROMARIO DE DIOS SOLACHE FLORES', 'ALAMOS 42', 39074, 'OLINALA', 'CHILPANCINGO DE LOS BRAVOS', 'GUERRERO', '8003782338', ' CALLE CEDRO Y CALLE NOGAL', 'SALON FIESTAS PEPE\'S Y SALON CIELITO LINDO', 4, '', 'uploads/IMG-20231221-WA0007.jpg'),
(83, '', 'JAVIER HERNANDEZ ORTIZ', 'COMETA 105', 42803, 'EL CIELITO', 'TULA DE ALLENDE', 'HIDALGO', '5521840492', 'NEBULOSA Y ESTRELLA POLAR', 'DETRÁS DE LA ESCUELA PRIMARIA Y KINDER DE LA COLONIA EL CIELITO, PORTÓN DE COLOR NEGRO, CASA DE UNA SOLA PLANTA.', 4, '', 'uploads/JHODELL.jpeg'),
(84, '', 'JESUS MELENDEZ RUBIO', 'Circuito Trinidad Moreno No. 82', 42302, 'San Antonio ', 'Ixmiquilpan ', 'Hidalgo ', '7445067706', 'Trinidad Moreno y cuarta cerrada de Trinidad Moreno ', 'Entrada al Circuito Trinidad Moreno por Hotel Cipreses ', 3, '', 'uploads/IMG-20231229-WA0024.jpg'),
(85, '', 'Adriana Ortiz Afentakis', 'Veraca 16', 91850, 'Reserva 1 Tarimoya', 'Veracruz ', 'Veracruz ', '2291192800', 'Paerma Real y Ave Lira ', 'Casa verde con fachada de piedra,es la cuarta casa contando desde la esquina,cerca está una secundaria #6', 3, '', 'uploads/inbound1734372849674339748.pdf'),
(86, '', 'Alejandro Hernández Martínez', 'Villa dorada #186', 36587, 'Villa real', 'Irapuato', 'Guanajuato', '4624825288', 'Villa Plateada y Villa de Guadalupe', 'Casa verde portón oscuro, frente a casa amarilla', 4, '', 'uploads/Screenshot_20240103-123917.png'),
(87, '', 'Jessica Coimbra Rojas Maldonado', 'Carretera Tenancingo-Zumpahuacan Kilometro 1', 52403, 'Los shiperes ', 'Tenancingo de Degollado', 'Estado de México', '4771354354', 'Sobre la carretera pasando un crucero', 'Frente a la empresa Probiomed, pasando una maderería y antes de llegar al Hotel Nipaqui. Casa color guinda con portón café oscuro. Favor de marcarme ya que es una vecindad y no hay timbre.', 3, '', 'uploads/IMG-20240105-WA0006.jpg'),
(88, '', 'Roberto Arturo Carrera Perez', 'Santa Isabel 1637', 75758, 'San Rafael', 'Tehuacan', 'Puebla', '7224996883', 'Santa Isabel esquina con Ramón Caballero', 'Frente Esquina Pizzería Chester, Casa de un solo piso de color Terracota color Rojo quemado', 1, '', 'uploads/IMG_20240105_170439.jpg'),
(89, '', 'Josue Jeziel Lopez Lorca', 'Av. Puerta de Piedra No.603', 86287, 'R/A Lazaro Cardenas 1era Secc', 'Villahermosa ', 'Tabasco', '9934265093', 'Residencial Abrika', 'Justo antes de entrar a Valle del\r\nJaguar, edificio color blanco, frente a puerta azul.', 4, '', 'uploads/df1856a7-81e3-4781-b0bf-1967ac730b6c.jpeg'),
(90, '', 'CARLOS ESTALA', 'AV. CRISTOBAL COLON 505 B', 64570, 'TREVIÑO', 'MONTERREY', 'NUEVO LEON', '8115555126', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER EL PAQUETE)', 2, '', 'uploads/WhatsApp Image 2024-01-09 at 12.31.52 PM.jpeg'),
(91, '', 'NETZAHUALCOYOTL ULISES LOPEZ CASTRO', 'LICENCIADO BENITO JUAREZ  #252', 81200, 'CENTRO', 'LOS MOCHIS ', 'SINALOA', '6681360601', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER EL PAQUETE)', 2, '', 'uploads/WhatsApp Image 2024-01-09 at 12.31.52 PM.jpeg'),
(92, '', 'VIRIDIANA  MENDOZA IBARRA', 'AV VERACRUZ 270', 83190, 'SAN BENITO', 'HERMOSILLO ', 'SONORA', '6621729286', 'PLAZA MONTEVERDE- PISO G (OCURRE)', 'LLEGA A OFICINA DE ESTAFETA OCURRE (PASAN POR EL PAQUETE)', 2, '', 'uploads/WhatsApp Image 2024-01-09 at 12.31.52 PM.jpeg'),
(93, '', 'LOURDES LETICIA REYES MANRIQUEZ', 'AV TEGNOLOGICO 1360', 32500, 'FUENTES DEL VALLE ', 'JUAREZ', 'CHIHUAHUA', '6622905754', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER EL PAQUETE)', 2, '', 'uploads/WhatsApp Image 2024-01-09 at 12.31.52 PM.jpeg'),
(94, '', 'BRENDA CASTILLO ARGUELLO', 'AV GRAL LAURO VILLAR #KILOMETRO 2', 87420, 'LAS PALMAS ', 'MATAMOROS ', 'TAMAULIPAS', '8688945916', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER EL EQUIPO)', 2, '', 'uploads/WhatsApp Image 2024-01-09 at 12.31.52 PM.jpeg'),
(95, '0237026120', 'Gustavo Venegas', 'Andador Kaan MZ12, Lote 125,', 77760, 'Aldea Zama', 'Tulum', 'Quintana Roo', '4151003354', 'Andado kaanmbul. e Itzamna ', 'Hotel Loba Tulum', 3, '', 'uploads/WhatsApp Image 2024-01-11 at 11.09.03.jpeg'),
(96, '', 'DEJANIRA MAKOSLA RAMIREZ RIVERO', 'AVENIDA BENITO JUAREZ  672', 77250, 'Juan Bautista vega', 'FELIPE CARRILLO', 'Quintana Roo', '9831718134', 'Calle 55 y calle 57', 'Casa con rampa para auto y portón negro a dos casas del asadero de pollo ', 2, '', 'uploads/IMG_20240118_192509132.jpg'),
(97, '', 'María de los angeles Ruiz Briones', 'Química 116', 64102, 'Barrio de la Industria ', 'Monterrey', 'Nuevo leon', '8111175291', 'Canal de Aztlan y ave de la industria', 'Casa color verde portón color negro', 3, '', 'uploads/Transferencia - 25-ene.-24 - 14.48.40.png.jpg'),
(98, '', 'Carlos serafin Carbajal Torres', 'Cuahutemoc 125', 56624, 'San Juan tezompa ', 'Chalco', 'Mexico', '5539359577', 'Reforma  y del valle', 'Atrás de la delegación del pueblo  entregar en la tienda hermanos carbajal (tienda de lolita)', 3, '', 'uploads/Transferencia - 25-ene-24 - 16.31.06.png.jpg'),
(100, '', 'ALBERTO RODRIGUEZ AREVALO', 'CUARTA 4012', 31050, 'SANTA ROSA', 'CHIHUAHUA', 'CHIHUAHUA', '6141416396', 'SAMANIEGO Y J.J. CALVO', 'ESTAMOS A UNA CUADRA DE LA PARROQUIA DE LA SOLEDAD, DE UNA ESCUELA Y DE  UN PARQUE', 3, '', 'uploads/TRANSFERENCIA.pdf'),
(101, '', 'ANGELA GONZALEZ OCAÑA', 'POCHUTLA 406', 68023, '7 REGIONES ', 'OAXACA DE JUÁREZ ', 'OAXACA ', '9511454484', 'IXTLÁN Y PUERTO ESCONDIDO ', '4 CASAS AL NORTE DE LA CAPILLA DE LA COL. 7 REGIONES \r\nESCUELA PRIMARIA GUELAGUETZA 20DPR3438N', 3, '', 'uploads/IMG_20240131_072351506.jpg'),
(102, '', 'Ezequiel lopez silva', 'Carretera vihermosa ala isla km 13.5', 86280, 'Buenavista 1 seccion', 'Villahermosa tabasco', 'Tab.', '5638408857', 'Sobre la principal', 'Entrada la pera a 150 metros frente al taller dianye', 3, '', 'uploads/Screenshot_20240131_183542_WhatsApp.jpg'),
(103, '', 'SILVIA AIDE CORRAL LOPEZ', 'NICOLÁS BRAVO # 1', 81400, 'CENTRO', 'GUAMUCHIL, SALVADOR ALVARADO', 'SINALOA', '6681250727', 'ENTRE CALLE FERROCARRIL Y LA VIA DEL TREN', 'NEGOCIO DE LONAS, TIPO BODEGA, PORTÓN AZUL Y PAREDES PINTADAS\r\nNARANJA', 3, '', 'uploads/IMG-20240131-WA0014.jpg'),
(104, '', 'Edem flores huicochea', 'Calle laurel 25', 39713, 'Real hacienda', 'Acapulco', 'Guerrrero', '7442953548', 'Calle Santa ana y calle rosario', 'Entrando por el oxxo real hacienda a mano derecha ', 3, '', 'uploads/IMG-20240201-WA0007.jpg'),
(105, '', 'Merly rubi Sánchez Zavala', '173 #300', 97290, 'Nueva San José Tecoh', 'Merida', 'Yucatán ', '9991720600', '60 y 64 \r\n\r\n\r\n', 'PASANDO PERIFERICO ES UNA TLAPALERIA UNÍ-KAREN PINTADA DE AZUL LAVICOLOR', 3, '', 'uploads/IMG_6376.png'),
(106, '', 'Josue Jeziel Lopez Lorca', 'Av. Puerta de Piedra No.603', 86287, 'R/A Lazaro Cardenas 1era Secc', 'Villahermosa', 'Tabasco', '9934265093', 'Residencial Abrika', ' Justo antes de entrar a Valle del Jaguar, edificio color blanco,\r\nfrente a puerta azul.', 4, '', 'uploads/WhatsApp Image 2024-02-08 at 6.18.54 PM.jpeg'),
(108, '', 'Thelma Ruth Gonzalez Marquez', 'Quintin Arauz No.990', 86761, 'Villa Vicente Guerrero', 'Centla', 'Tabasco', '9933637836', 'Benito Juarez y Pino Suarez', 'A lado de la farmacia Union arriba de Centro de terapias Alternativas Corazones Unidos. ', 4, '', 'uploads/IMG-20240214-WA0029.jpg'),
(109, '4127079757', 'Geovanny Gonzalez De Paz', 'Nicolas Bravo. No. 13', 51400, 'Centro', 'Tejupilco de Hidalgo', 'Mexico ', '7226644123', 'Entre Sebastian Lerdo de Tejada y Narcizo Mendoza ', 'Atrás de la Iglesia, donde esta funeraria, en la primer calle hacia abajo hay una subida, afuera hay una piedra grande y luego está una casa color azul con rosa, ese es mi hogar.', 4, '', 'uploads/IMG_5016.jpeg'),
(110, '1259465052', 'Benjamin Ayala Rodriguez', 'Rio Yaqui No. 14', 59330, 'San Rafael', 'La Piedad', 'Michoacan', '3521060648', 'Prolongacion Enrrique Ramirez y Juan Pablo Il', 'Aun costado de Salon Eleganza, atrás de Restaurant El Arriero', 4, '', 'uploads/20240219_150558.jpg'),
(111, '1323795274', 'jorge andrade ruvalcaba', 'Tlacotal # 500', 34160, 'col azcapotzalco', 'durango', 'durango', '6181450292', 'mitla esquina con tlacotal', 'es un negocio que dice Dahua en la pura esquina y aun lado esta una casa verd de altos con barandal en la entrada', 4, '', 'uploads/WhatsApp Image 2024-02-22 at 9.46.51 AM.jpeg'),
(112, '0815311969', 'Ruben Omar Perez Millot', 'Alfonso Valencia Rios 121', 93606, 'Francisco Zarco', 'Martinez de la Torre', 'Veracruz', '2321454070', 'Jose Pagues Llergos y Floilan Flores Cancela', 'Casa color blanco porton rojo', 4, '', 'uploads/comprobante.jpeg'),
(113, '1048711771', 'Victor Mendez Orozco', 'Del Sabino #221', 38600, 'Centro', 'Acambaro', 'Gto.', '4171134500', 'Morelos y Av. Primero de mayo', 'Casa blanca, 2 pisos, jardín afuera y hay un local de telcel en la misma casa', 3, '', 'uploads/IMG-20240227-WA0036.jpg'),
(114, '2351816823', 'María de Jesús Casillas ', 'Fermín Ortega #79', 58337, 'Ario 1815', 'Morelia ', 'Michoacán ', '4431445564', 'Mariano Salomo y José Dolores Mendez ', 'Es la única calle que tiene reja', 4, '', 'uploads/IMG-20240228-WA0080.jpg'),
(116, '2394312312', 'Sergio Granados Serrano ', 'Queretaro 185 interior 23', 6700, 'Roma norte ', 'Ciudad de México ', 'Alcaldía Cuauhtemoc', '5548988183', 'Monterrey y Yucatan', 'El edificio está en frente de una tienda de pinturas Comex', 3, '', 'uploads/17095730784918197783499820784859.jpg'),
(117, '1089624302', 'Jorge Luis mellado meza', '18 de abril #133', 82038, 'Obrera', 'Mazatlan', 'Sinaloa', '6692254924', '16 de abril y general pesqueira', 'Por un costado de la escuela nautica', 3, '', 'uploads/IMG-20240305-WA0007.jpg'),
(118, '', 'ERICK MORENO', 'AVENIDA HIDALGO 619', 85000, 'CENTRO', 'CIUDAD OBREGON', 'SONORA', '6442862307', 'CHIHUAHUA Y SONORA', 'EDIFICIO DE OFICINAS BLANCO, PLANTA BAJA', 2, '', 'uploads/BER150929DI5-AQPAY002024030512273161090754.pdf'),
(119, '', 'CARLOS ESTALA', 'CARLOS SALAZAR OTE 2334 Planta alta', 64010, 'OBRERA', 'MONTERREY', 'NUEVO LEON', '8115555126', 'FERNANDO MONTES DE OCA Y JUAN DE LA BARRERA', 'FACHADA COLOR CAFE', 2, '', 'uploads/BER150929DI5-AQPAY002024030512273161090754.pdf'),
(120, '', 'BRENDA CASTILLO ARGUELLO', 'AV GRAL LAURO VILLAR #KILOMETRO 2', 87420, 'LAS PALMAS', 'MATAMOROS', 'TAMAULIPAS', '8688945916', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER\r\nEL EQUIPO)', 2, '', 'uploads/BER150929DI5-AQPAY002024030512273161090754.pdf'),
(121, '', 'NETZAHUALCOYOTL ULISES LOPEZ CASTRO', 'LICENCIADO BENITO JUAREZ #252', 81200, 'CENTRO', 'LOS MOCHIS', 'SINALOA', '6681360601', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER\r\nEL PAQUETE)', 2, '', 'uploads/BER150929DI5-AQPAY002024030512273161090754.pdf'),
(122, '', 'GUSTAVO RUBIO HERNANDEZ', 'CALLE 31 #1410', 31350, 'OBRERA', 'CHIHUAHUA', 'CHIHUAHUA', '6141987847', 'OCURRE', 'ENSEGUIDA DE TALLER MECANICO', 2, '', 'uploads/BER150929DI5-AQPAY002024030512273161090754.pdf'),
(123, '2183050742', 'Jesus Armando Dávila Vargas ', '2da cerrada de palmera del desierto #11', 10600, 'El rosal', 'La Magdalena Contreras ', 'Ciudad de México ', '5532873498', 'Tulipán y Av San Jerónimo ', 'Primer portón azul dentro de la cerrada ', 4, '', 'uploads/17101044812025751257798325646650.jpg'),
(124, '0893857228', 'VICTOR MANUEL GONZALEZ SANTIAGO', 'CALLE: PERU #125', 86090, 'COL. GAVIOTAS SUR', 'VILLAHERMOSA', 'TABASCO', '9935612116', 'CALLE VULCANOLOS Y CALLE AFRICA', 'FRENTE A UN TEMPLO PRESBITERIANO', 4, '', 'uploads/WhatsApp Image 2024-03-12 at 2.00.47 PM (1).jpeg'),
(125, '0477765717', 'Oscar romero jaime', 'Victoria 501 sur altos', 34000, 'Zona centro', 'Durango', 'Durango', '6188406752', 'Pino Suárez y baca ortiz', 'Planta alta edificio blanco', 3, '', 'uploads/inbound96640093196890910.jpg'),
(126, '1321274735', 'Domingo González', 'Carretera  a Chiconcuac s/n', 56030, 'San Sebastian', 'Chiautla', 'Estado de Mexico', '5951067118', 'Prolongación Hidalgo y Tenahuache', 'Enfrente de primaria SORJI, en la mueblería, saguan verde', 3, '', 'uploads/1710532205701..jpg'),
(128, '1160632643', 'Juan Carlos rojas Castañon ', 'Mz 3 lt 1 casa 20 ', 55767, 'Paseos del bosque 2', 'Mexico', 'Estado de México ', '5541867541', 'Sobre boulevard valle san Pedro', 'Muy cerca de walmart Ojo de Agua y entrada de plumas frente a un Oxxo', 3, '', 'uploads/2e914e91-bf59-4159-8ff5-56e63a88b4dc.jpeg'),
(129, '2808323666 4264847172', 'MAURICIO PENAGOS MALDA', 'BLVD BELISARIO DOMINGUEZ NO EXT 4120 NO INT 3 KM 1082 ', 29020, 'JARDINES DE TUXTLA ', 'TUXTLA GUTIERREZ ', 'CHIAPAS', '9616170000', 'PRIMAVERA Y VILLA DEL RIO', 'HOTEL PALMARECA FRENTE A LA BIBLIOTECA DE LA UNACH, JUNTO AL NUEVO STARBUCKS DEL BLVD.', 3, '', 'uploads/02.- MARCO ANTONIO AGUILAR OLMEDO.pdf'),
(130, '0476182878', 'Ricardo Galindo garrido', 'Álvaro Obregón # 8', 41800, 'Centro', 'Florencio Villarreal ', 'Guerrero', '7471621686', 'Carretera nacional y Hermenegildo galeana', 'Entregar en farmacia Guadalupana', 0, '', 'uploads/IMG_5651.png'),
(131, '0895284423', 'JUAN CARLOS  HERNÁNDEZ CRUZ', '21 DE MARZO S/N INT 4 A', 52433, 'EMILIANO ZAPATA ', 'TENANCINGO ', 'MEXICO', '7228032014', '16 DE SEPTIEMBRE & PLAN DE AYALA. ', 'EDIFICIO COLOR ROSA, REJA COLOR AMARILLA.  (SE ENTREGA EN LA TIENDA DE ABARROTES) ', 3, '', 'uploads/Screenshot_20240407_093523.jpg'),
(132, '2932738930', 'BRENDA CASTILLO ARGUELLO', 'AV GRAL LAURO VILLAR #KILOMETRO 2', 87420, 'LAS PALMAS', 'MATAMOROS', 'TAMAULIPAS', '8688945916', 'OCURRE', 'OFICINA DE ESTAFETA A OCURRE (PASAN A RECOGER\r\nEL EQUIPO)', 3, '', 'uploads/1-19.pdf'),
(133, '1812663761', 'Edgar Antonio Torres Gutierrez', 'Av. Residencial del Parque 1040 Interior 53', 76246, 'Residencial del Parque', 'El Marques', 'Queretaro', '4424451362', 'Av. El Mirador', 'Por el Centro Expositor y Fracc. el Mirador', 3, '', 'uploads/Pago Thinkpad E550.jpg'),
(134, '', 'JUANA MANDUJANO FLORES', 'MORALITOS #21', 38090, 'RANCHO SECO ', 'CELAYA', 'GUANAJUATO ', '4611427687', 'NIÑOS HÉROES Y EL RIO LAJA ', 'CASA NARANJA DE 2 PISOS, POR LA CARRETERA 2 DE ABRIL, ANTES DE LLEGAR A LA EMPRESA AVON.', 4, '', 'uploads/1-19.pdf'),
(135, '3735355389', 'Fernando perez zapotitla ', 'Carr. Adolfo lopez mateos sur No. 21', 72227, 'La resurrección ', 'Puebla ', 'Puebla ', '2222009006', 'Nicolas bravo sur   y \r\n20 de noviembre sur ', 'Casa de 2 pisos color azul cielo con 2 arbolitos, o enfrente de antojitos mica ', 4, '', 'uploads/inbound6218543254696728137.jpg'),
(136, '4149789804', 'Benigno Samuel Ortiz Zetina ', 'Nicolas de Regules #23', 61682, 'Los Once pueblos', 'Puruarán ', 'Michoacán ', '4591201244', 'Entre Benito Juárez y Nicolás de Regules', 'Una calle que baja al rio', 4, '', 'uploads/IMG-20240415-WA0016.jpg'),
(138, '1273858170', 'José Moisés Villanueva Quintero ', '2da cerrada de bosques de Veracruz mza 99 lote 79 casa 4', 55764, 'los héroes Tecamac II ', 'Tecamac ', 'Estado México ', '5615241109', 'Av. Ozumbilla y Bosques de México ', 'La entrega es adentro de la privada hay una tienda ahí se entrega enfrente hay un mecado', 4, '', 'uploads/IMG-20240502-WA0006.jpg'),
(139, '0307408095', 'Alejandro Hidalgo Romero', 'Quintana Roo #9', 42700, 'Los Tigres ', 'Mixquiahuala de Juarez', 'Hidalgo ', '7721442437', 'Av. Niños Héroes y Mariano Matamoros ', 'Locales azules', 3, '', 'uploads/IMG_4710.png'),
(140, '0396674761', 'Alan Jesús Azotea García', 'Revolución 806 ', 51355, 'San Luis Mextepec, Zinacantepec ', 'Toluca ', 'México ', '7221161326', 'Artículo 127 y Primero De Mayo', 'A un costado de la tienda Domínguez ', 3, '', 'uploads/Screenshot_2024-05-21-13-57-22-591_com.mercadopago.wallet.jpg'),
(141, '1857636453', 'Sobec Guerra Sánchez ', 'Callejón Simona Robles sin numero', 70020, 'Séptima sección ', 'Juchitán de Zaragoza ', 'Oaxaca', '9541344037', 'Entre callejón del encanto y calle Francisco I Madero ', 'Pasando como a tres casa de la purificadora peniel en el callejón del encanto', 2, '', 'uploads/Screenshot_20240523-130104.jpg'),
(142, '2700959475', 'JAIRO JUAREZ JIMENEZ', 'AV. DE LA CONVENCION DE 1914 NTE #1204', 20020, 'CIRCUNVALACION NTE.', 'AGUASCALIENTES', 'AGUASCALIENTES', '4951064621', 'SIN REFERENCIA', 'ES UNA SUCURSAL DE ESTAFETA', 2, '', 'uploads/comprobante_transferencia_22-May-2024_19_38_26 h.pdf'),
(143, '0997171526', 'Oscar Daniel Cruz Ramos', 'Emiliano zapata 236', 36554, 'Nueva reforma agraria ', 'Irapuato', 'Guanajuato', '4622852893', 'Santa Mónica y av. Independencia ', 'Tienda de abarrotes y maceteros', 2, '', 'uploads/IMG-20240524-WA0001.jpg'),
(144, '', 'ANA ISABEL HERNANDEZ BUCIO ', 'Central 13', 61062, 'San Juan Tlalpujahuilla ', 'Tlalpujahua ', 'Michoacán', '7861139353', 'Principal panteon', 'Es en el taller de pepe Bucio, detrás de la iglesia, casa de 3 pisos con techo de lámina ', 0, '', 'uploads/IMG-20240527-WA0001.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_paqueteria_hmov`
--

CREATE TABLE `pedido_paqueteria_hmov` (
  `id` int(11) NOT NULL,
  `id_paqueteria` int(255) DEFAULT NULL,
  `fecha_mov` datetime DEFAULT NULL,
  `estatus` tinyint(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pedido_paqueteria_hmov`
--

INSERT INTO `pedido_paqueteria_hmov` (`id`, `id_paqueteria`, `fecha_mov`, `estatus`, `id_usuario`) VALUES
(13, 16, '2023-01-24 17:22:50', 5, 'admin'),
(14, 16, '2023-01-24 17:23:01', 1, 'admin'),
(15, 15, '2023-01-28 21:40:45', 3, 'admonOlmedo'),
(16, 15, '2023-01-28 21:40:57', 4, 'admonOlmedo'),
(17, 14, '2023-01-28 21:41:39', 3, 'admonOlmedo'),
(18, 18, '2023-02-07 18:55:54', 1, 'admin'),
(19, 18, '2023-02-07 18:55:58', 2, 'admin'),
(20, 21, '2023-02-18 19:19:34', 3, 'admonOlmedo'),
(21, 19, '2023-02-23 22:24:02', 2, 'admonOlmedo'),
(22, 19, '2023-02-23 22:26:01', 3, 'admonOlmedo'),
(23, 23, '2023-03-17 19:57:46', 2, 'admonOlmedo'),
(24, 21, '2023-03-17 19:58:56', 4, 'admonOlmedo'),
(25, 22, '2023-03-17 19:59:03', 4, 'admonOlmedo'),
(26, 19, '2023-03-17 19:59:10', 4, 'admonOlmedo'),
(27, 19, '2023-03-17 19:59:25', 1, 'admonOlmedo'),
(28, 16, '2023-03-17 19:59:32', 4, 'admonOlmedo'),
(29, 19, '2023-03-17 19:59:36', 4, 'admonOlmedo'),
(30, 14, '2023-03-17 19:59:42', 4, 'admonOlmedo'),
(31, 13, '2023-03-17 19:59:48', 4, 'admonOlmedo'),
(32, 12, '2023-03-17 19:59:52', 4, 'admonOlmedo'),
(33, 8, '2023-03-17 19:59:57', 4, 'admonOlmedo'),
(34, 23, '2023-03-18 01:51:45', 3, 'admonOlmedo'),
(35, 23, '2023-03-22 00:23:05', 4, 'admonOlmedo'),
(36, 25, '2023-04-11 21:35:02', 4, 'admonOlmedo'),
(37, 28, '2023-05-03 20:12:16', 2, 'admonOlmedo'),
(38, 30, '2023-05-19 01:29:25', 3, 'admonOlmedo'),
(39, 31, '2023-05-31 17:46:27', 4, 'admonOlmedo'),
(40, 32, '2023-06-02 16:40:44', 3, 'admonOlmedo'),
(41, 33, '2023-06-06 19:42:43', 3, 'admonOlmedo'),
(42, 35, '2023-06-06 19:43:12', 2, 'admonOlmedo'),
(43, 34, '2023-06-08 19:45:38', 3, 'admonOlmedo'),
(44, 35, '2023-06-08 19:45:42', 3, 'admonOlmedo'),
(45, 36, '2023-06-08 19:46:08', 1, 'admonOlmedo'),
(46, 36, '2023-06-09 17:43:37', 2, 'admonOlmedo'),
(47, 27, '2023-06-09 17:43:55', 4, 'admonOlmedo'),
(48, 38, '2023-06-22 23:43:19', 3, 'admonOlmedo'),
(49, 36, '2023-06-22 23:43:25', 3, 'admonOlmedo'),
(50, 40, '2023-06-22 23:43:31', 2, 'admonOlmedo'),
(51, 39, '2023-06-22 23:43:35', 2, 'admonOlmedo'),
(52, 40, '2023-06-22 23:43:39', 3, 'admonOlmedo'),
(53, 41, '2023-06-26 23:52:03', 4, 'admonOlmedo'),
(54, 41, '2023-06-26 23:52:28', 2, 'admonOlmedo'),
(55, 41, '2023-06-27 00:24:58', 3, 'admonOlmedo'),
(56, 42, '2023-06-27 00:44:18', 1, 'admonOlmedo'),
(57, 43, '2023-07-03 22:12:25', 4, 'admonOlmedo'),
(58, 42, '2023-07-03 22:12:32', 4, 'admonOlmedo'),
(59, 41, '2023-07-03 22:13:04', 4, 'admonOlmedo'),
(60, 44, '2023-07-03 22:13:37', 3, 'admonOlmedo'),
(61, 45, '2023-07-07 20:53:47', 3, 'admonOlmedo'),
(62, 51, '2023-08-09 21:38:37', 4, 'admonOlmedo'),
(63, 58, '2023-10-03 18:14:18', 3, 'admonOlmedo'),
(64, 57, '2023-10-03 18:14:31', 3, 'admonOlmedo'),
(65, 58, '2023-10-03 18:14:47', 4, 'admonOlmedo'),
(66, 67, '2023-11-06 21:24:36', 2, 'admonOlmedo'),
(67, 66, '2023-11-06 21:24:44', 4, 'admonOlmedo'),
(68, 65, '2023-11-06 21:24:50', 4, 'admonOlmedo'),
(69, 64, '2023-11-06 21:24:54', 4, 'admonOlmedo'),
(70, 61, '2023-11-06 21:24:58', 4, 'admonOlmedo'),
(71, 60, '2023-11-06 21:25:04', 4, 'admonOlmedo'),
(72, 59, '2023-11-06 21:25:09', 4, 'admonOlmedo'),
(73, 57, '2023-11-06 21:25:18', 4, 'admonOlmedo'),
(74, 68, '2023-11-21 21:44:48', 3, 'admonOlmedo'),
(75, 70, '2023-11-21 21:44:53', 4, 'admonOlmedo'),
(76, 71, '2023-11-22 22:04:08', 1, 'admonOlmedo'),
(77, 72, '2023-11-22 22:12:39', 2, 'admonOlmedo'),
(78, 73, '2023-11-22 22:26:06', 2, 'admonOlmedo'),
(79, 74, '2023-11-22 22:43:47', 2, 'admonOlmedo'),
(80, 72, '2023-11-22 23:50:59', 5, 'admonOlmedo'),
(81, 74, '2023-11-22 23:51:08', 5, 'admonOlmedo'),
(82, 74, '2023-11-24 00:15:55', 3, 'admonOlmedo'),
(83, 73, '2023-11-24 22:51:54', 3, 'admonOlmedo'),
(84, 72, '2023-11-24 22:51:58', 3, 'admonOlmedo'),
(85, 71, '2023-11-24 22:52:04', 3, 'admonOlmedo'),
(86, 68, '2023-11-24 22:52:12', 4, 'admonOlmedo'),
(87, 77, '2023-12-16 22:27:14', 1, 'admonOlmedo'),
(88, 76, '2023-12-21 23:08:09', 4, 'admonOlmedo'),
(89, 75, '2023-12-21 23:08:15', 4, 'admonOlmedo'),
(90, 78, '2023-12-21 23:20:54', 2, 'admonOlmedo'),
(91, 80, '2023-12-22 00:22:00', 2, 'admonOlmedo'),
(92, 79, '2023-12-22 01:04:55', 1, 'admonOlmedo'),
(93, 80, '2023-12-22 01:05:03', 1, 'admonOlmedo'),
(94, 79, '2023-12-22 01:05:08', 2, 'admonOlmedo'),
(95, 78, '2023-12-22 19:49:26', 3, 'admonOlmedo'),
(96, 79, '2023-12-22 19:49:33', 3, 'admonOlmedo'),
(97, 85, '2024-01-03 18:26:17', 1, 'admonOlmedo'),
(98, 84, '2024-01-03 18:26:25', 1, 'admonOlmedo'),
(99, 83, '2024-01-03 18:26:59', 4, 'admonOlmedo'),
(100, 83, '2024-01-03 18:27:09', 4, 'admonOlmedo'),
(101, 82, '2024-01-03 18:27:30', 4, 'admonOlmedo'),
(102, 86, '2024-01-04 01:03:11', 1, 'admonOlmedo'),
(103, 86, '2024-01-05 23:42:17', 3, 'admonOlmedo'),
(104, 85, '2024-01-05 23:42:22', 3, 'admonOlmedo'),
(105, 84, '2024-01-05 23:42:25', 3, 'admonOlmedo'),
(106, 88, '2024-01-06 00:01:51', 1, 'admonOlmedo'),
(107, 87, '2024-01-06 00:01:55', 1, 'admonOlmedo'),
(108, 89, '2024-01-09 00:22:37', 1, 'admonOlmedo'),
(109, 92, '2024-01-12 20:53:49', 1, 'admonOlmedo'),
(110, 89, '2024-01-12 20:53:55', 3, 'admonOlmedo'),
(111, 88, '2024-01-12 20:54:00', 3, 'admonOlmedo'),
(112, 90, '2024-01-12 20:54:05', 3, 'admonOlmedo'),
(113, 90, '2024-01-12 20:54:20', 1, 'admonOlmedo'),
(114, 87, '2024-01-12 20:54:28', 3, 'admonOlmedo'),
(115, 86, '2024-01-12 20:54:35', 4, 'admonOlmedo'),
(116, 91, '2024-01-12 20:55:55', 1, 'admonOlmedo'),
(117, 93, '2024-01-12 20:56:56', 1, 'admonOlmedo'),
(118, 94, '2024-01-12 20:57:36', 1, 'admonOlmedo'),
(119, 90, '2024-01-12 22:42:56', 2, 'admonOlmedo'),
(120, 91, '2024-01-12 22:52:18', 2, 'admonOlmedo'),
(121, 92, '2024-01-12 22:59:30', 2, 'admonOlmedo'),
(122, 93, '2024-01-12 23:05:30', 2, 'admonOlmedo'),
(123, 94, '2024-01-12 23:21:57', 2, 'admonOlmedo'),
(124, 88, '2024-01-16 20:07:23', 1, 'admonOlmedo'),
(125, 95, '2024-01-18 19:58:00', 2, 'admonOlmedo'),
(126, 95, '2024-01-18 23:13:00', 3, 'admonOlmedo'),
(127, 96, '2024-01-19 21:50:56', 2, 'admonOlmedo'),
(128, 97, '2024-01-25 22:36:41', 1, 'admonOlmedo'),
(129, 98, '2024-01-26 17:38:24', 1, 'admonOlmedo'),
(130, 97, '2024-01-31 01:52:14', 3, 'admonOlmedo'),
(131, 98, '2024-01-31 01:52:19', 3, 'admonOlmedo'),
(132, 100, '2024-02-01 01:04:40', 2, 'admonOlmedo'),
(133, 102, '2024-02-02 18:16:49', 1, 'admonOlmedo'),
(134, 103, '2024-02-02 20:34:24', 1, 'admonOlmedo'),
(135, 105, '2024-02-08 00:51:52', 1, 'admonOlmedo'),
(136, 101, '2024-02-08 00:53:14', 1, 'admonOlmedo'),
(137, 105, '2024-02-09 20:20:26', 3, 'admonOlmedo'),
(138, 103, '2024-02-09 20:20:32', 3, 'admonOlmedo'),
(139, 102, '2024-02-09 20:20:37', 3, 'admonOlmedo'),
(140, 101, '2024-02-09 20:20:46', 3, 'admonOlmedo'),
(141, 100, '2024-02-09 20:20:58', 3, 'admonOlmedo'),
(142, 89, '2024-02-09 20:21:24', 4, 'admonOlmedo'),
(143, 106, '2024-02-13 21:19:13', 3, 'admonOlmedo'),
(144, 108, '2024-02-16 20:10:00', 1, 'admonOlmedo'),
(145, 109, '2024-02-19 22:17:36', 3, 'admonOlmedo'),
(146, 108, '2024-02-19 22:17:45', 3, 'admonOlmedo'),
(147, 104, '2024-02-19 22:17:54', 3, 'admonOlmedo'),
(148, 110, '2024-02-23 17:25:29', 3, 'admonOlmedo'),
(149, 112, '2024-02-23 19:21:07', 1, 'admonOlmedo'),
(150, 112, '2024-02-28 01:04:27', 3, 'admonOlmedo'),
(151, 111, '2024-02-28 01:04:32', 3, 'admonOlmedo'),
(152, 114, '2024-02-29 00:58:05', 1, 'admonOlmedo'),
(153, 116, '2024-03-05 23:40:51', 1, 'admonOlmedo'),
(154, 113, '2024-03-05 23:40:59', 3, 'admonOlmedo'),
(155, 114, '2024-03-05 23:41:05', 3, 'admonOlmedo'),
(156, 116, '2024-03-08 22:05:33', 3, 'admonOlmedo'),
(157, 117, '2024-03-08 22:06:10', 3, 'admonOlmedo'),
(158, 114, '2024-03-08 22:06:43', 4, 'admonOlmedo'),
(159, 112, '2024-03-08 22:08:22', 4, 'admonOlmedo'),
(160, 111, '2024-03-08 22:09:39', 4, 'admonOlmedo'),
(161, 110, '2024-03-08 22:10:18', 4, 'admonOlmedo'),
(162, 109, '2024-03-08 22:10:59', 4, 'admonOlmedo'),
(163, 108, '2024-03-08 22:11:27', 4, 'admonOlmedo'),
(164, 106, '2024-03-08 22:11:32', 4, 'admonOlmedo'),
(165, 122, '2024-03-11 17:45:57', 3, 'admonOlmedo'),
(166, 122, '2024-03-11 17:46:45', 2, 'admonOlmedo'),
(167, 121, '2024-03-11 17:46:49', 2, 'admonOlmedo'),
(168, 120, '2024-03-11 17:46:53', 2, 'admonOlmedo'),
(169, 119, '2024-03-11 17:46:58', 2, 'admonOlmedo'),
(170, 118, '2024-03-11 17:47:02', 2, 'admonOlmedo'),
(171, 123, '2024-03-12 01:38:40', 1, 'admonOlmedo'),
(172, 126, '2024-03-16 20:51:49', 1, 'admonOlmedo'),
(173, 125, '2024-03-16 20:51:54', 1, 'admonOlmedo'),
(174, 128, '2024-03-20 19:05:30', 1, 'admonOlmedo'),
(175, 126, '2024-03-20 19:05:36', 2, 'admonOlmedo'),
(176, 125, '2024-03-20 19:05:40', 2, 'admonOlmedo'),
(177, 128, '2024-03-20 23:05:55', 2, 'admonOlmedo'),
(178, 129, '2024-03-20 23:06:02', 1, 'admonOlmedo'),
(179, 125, '2024-03-21 01:51:31', 3, 'admonOlmedo'),
(180, 124, '2024-03-21 01:52:07', 4, 'admonOlmedo'),
(181, 126, '2024-03-21 01:52:24', 3, 'admonOlmedo'),
(182, 128, '2024-03-21 01:52:28', 3, 'admonOlmedo'),
(183, 129, '2024-03-21 01:52:32', 3, 'admonOlmedo'),
(184, 123, '2024-03-21 01:53:08', 4, 'admonOlmedo'),
(185, 126, '2024-03-21 01:56:19', 2, 'admonOlmedo'),
(186, 125, '2024-03-21 01:56:23', 2, 'admonOlmedo'),
(187, 125, '2024-03-21 18:56:49', 3, 'admonOlmedo'),
(188, 126, '2024-03-21 18:57:08', 3, 'admonOlmedo'),
(189, 131, '2024-04-08 23:16:51', 1, 'admonOlmedo'),
(190, 132, '2024-04-08 23:20:05', 1, 'admonOlmedo'),
(191, 134, '2024-04-09 00:04:00', 3, 'admonOlmedo'),
(192, 134, '2024-04-09 00:53:50', 4, 'admonOlmedo'),
(193, 133, '2024-04-09 01:58:30', 1, 'admonOlmedo'),
(194, 131, '2024-04-12 22:31:52', 3, 'admonOlmedo'),
(195, 132, '2024-04-12 22:33:23', 3, 'admonOlmedo'),
(196, 133, '2024-04-12 22:33:52', 3, 'admonOlmedo'),
(197, 138, '2024-05-15 18:51:20', 4, 'admonOlmedo'),
(198, 136, '2024-05-15 18:51:26', 4, 'admonOlmedo'),
(199, 135, '2024-05-15 18:51:32', 4, 'admonOlmedo'),
(200, 139, '2024-05-15 18:51:35', 3, 'admonOlmedo'),
(201, 140, '2024-05-24 22:29:49', 3, 'admonOlmedo'),
(202, 141, '2024-05-24 22:29:56', 2, 'admonOlmedo'),
(203, 142, '2024-05-24 22:30:01', 2, 'admonOlmedo'),
(204, 143, '2024-05-24 22:30:06', 2, 'admonOlmedo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` text NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `precio_ml` float DEFAULT NULL,
  `precio_cliente` float DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `dd` int(11) DEFAULT NULL,
  `procesador` varchar(255) DEFAULT NULL,
  `tam_pantalla` varchar(255) DEFAULT NULL,
  `graficos` varchar(255) DEFAULT NULL,
  `ssd` int(11) DEFAULT NULL,
  `hhd` int(11) DEFAULT NULL,
  `vistas` int(11) DEFAULT NULL,
  `titulo` text DEFAULT NULL,
  `portada` text DEFAULT NULL,
  `nuevo` int(11) DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL,
  `oferta` int(11) DEFAULT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productosfacturas`
--

CREATE TABLE `productosfacturas` (
  `id` int(11) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_categoria` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` float(255,0) DEFAULT NULL,
  `precio_compra` float(255,0) DEFAULT NULL,
  `precio_venta` float(255,0) DEFAULT NULL,
  `precio_ml` float(255,0) DEFAULT NULL,
  `precio_cliente` float(255,0) DEFAULT NULL,
  `stock` int(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `productosfacturas`
--

INSERT INTO `productosfacturas` (`id`, `codigo`, `nombre`, `descripcion`, `id_categoria`, `imagen`, `precio`, `precio_compra`, `precio_venta`, `precio_ml`, `precio_cliente`, `stock`, `fecha`) VALUES
(23, 'PSO451', 'PANTALLA SONY', 'PANTALLA OLED DE 55 PULGADAS CON ANDROID IOS', '12', 'vistas/img/productos/default/anonymous.png', NULL, 10000, 12000, 11100, 11000, 47, '2023-05-31 11:39:23'),
(24, 'MOU1290', 'MOUSE ', 'MOUSE INALAMBRICO DE 500000 DPIS', '11', 'vistas/img/productos/default/anonymous.png', NULL, 400, 160, 450, 410, 48, '2023-10-13 14:04:02'),
(25, 'AUD4231', 'AUDIFONOS', 'AUDIFONOS MARCA SONY INALAMBRICOS CON 6 HORAS DE REPRODUCCIÓN', '10', 'vistas/img/productos/default/anonymous.png', NULL, 400, 500, 480, 450, 45, '2023-10-13 14:04:02'),
(26, 'HUB1873S', 'HUB', 'HUB DE USB MARCA MOCH CON 6 ENTRADAS ', '10', 'vistas/img/productos/default/anonymous.png', NULL, 300, 410, 325, 320, 42, '2023-11-10 05:04:09'),
(27, 'USB8213', 'USB', 'USB DE 250 GB MARCA KINGSTON', '10', 'vistas/img/productos/default/anonymous.png', NULL, 180, 210, 200, 190, 46, '2023-10-13 14:08:55'),
(28, 'RJ45CL', 'CABLE RJ45', 'CABLDE RED COLO ROJO DE 10 MTS.', '10', 'vistas/img/productos/default/anonymous.png', NULL, 80, 100, 90, 85, 45, '2023-11-10 05:04:09'),
(29, 'LIM8192', 'LIMPIADOR DE PANTALLAS', 'LIMPIADOR DE PANTALLAS MARCA PATO', '12', 'vistas/img/productos/default/anonymous.png', NULL, 100, 130, 120, 110, 47, '2023-10-13 14:09:26'),
(30, 'PAS53998', 'PASTA TERMICA', 'PASTA TERMICA PARA PROCESADOR', '10', 'vistas/img/productos/default/anonymous.png', NULL, 200, 250, 220, 210, 42, '2023-10-16 15:46:47'),
(31, 'USBAD8271', 'CABLE USB', 'CABLE USB DE 2 MTS. COLOR NEGRO', '10', 'vistas/img/productos/default/anonymous.png', NULL, 100, 160, 152, 120, 39, '2023-11-10 05:11:34'),
(32, '7985122', 'CAMARA', 'CAMARA FOTOGROFICA PROFESIONAL', '10', 'vistas/img/productos/default/anonymous.png', NULL, 10000, 12000, 11000, 10200, 19, '2023-10-16 15:46:12'),
(33, '753159', 'TELÉFONO ', 'TELÉFONO INHALAMBRICO CON 30 MTS DE ALCANCE ', '10', 'vistas/img/productos/default/anonymous.png', NULL, 200, 250, 220, 210, 6, '2024-04-20 20:41:03'),
(34, 'a6662342101', 'Kit Limpieza', 'Kit de limpieza de pantallas de LCD', '10', 'vistas/img/productos/default/anonymous.png', NULL, 59, 99, 0, 99, 4, '2024-04-20 20:45:51'),
(35, 'KJSKJ389213', 'HP', 'COMPUTADORA DE ESCRITORIO CON TECLADO Y RATON INCLUIDO', '7', 'vistas/img/productos/default/anonymous.png', NULL, 5000, 6500, 6000, 6000, 9, '2024-04-20 20:49:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `cliente` varchar(255) DEFAULT '',
  `telefono` varchar(12) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `equipo` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `procesador` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `dd` varchar(255) DEFAULT NULL,
  `ssd` varchar(255) NOT NULL,
  `so` varchar(255) DEFAULT NULL,
  `cargador` varchar(250) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `falla` varchar(255) DEFAULT NULL,
  `solucion` varchar(255) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `tipo_servicio` char(255) DEFAULT '',
  `total` float DEFAULT NULL,
  `estatus` tinyint(4) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `folio`, `cliente`, `telefono`, `id_empleado`, `equipo`, `marca`, `procesador`, `ram`, `dd`, `ssd`, `so`, `cargador`, `contrasena`, `falla`, `solucion`, `obs`, `tipo_servicio`, `total`, `estatus`, `fecha_entrega`, `fecha_llegada`, `id_caja`) VALUES
(20, 10001, 'LORENA MARGARITA CHICO', '477000000', 60, 'LAPTOP', 'HP COMPAQ', 'AMD E240', '2', '250 HHD', '0', 'W7', '', 'SIN CONTRASEÑA', 'REVISAR MENSAJE DE VENTILADOR', 'SERVICIO DE PRUEBA SE BORRO EL FOLIO 2 \n\nSE REALIZO MANTENIMIENTO ', 'CON CARGADOR, DEJA MALETIN,\nCONTRASEÑA: scorpion\nTELEFONO: 4777975807', '', 350, 6, '2023-01-11', '2023-01-02', 10),
(22, 10003, 'Carolina Franco Duran', '4776481420', 61, 'LAPTOP', 'DELL', 'CORE I5', '12', '240 SSD', '', 'W10', '', 'SIN CONTRASEÑA', 'REVISAR CODIGO DE ERROR PANTALLA AZUL\nREVISAR BOTON DE ENCENDIDO\nSE LLEVA UN MOSE VORAGO', '', 'CON CARGADOR\n\nPAGO CON TARJETA ', '', 531.19, 6, '2023-01-07', '2023-01-04', NULL),
(23, 10004, 'Serafin Garcia', '4772242339', 61, 'ALL IN ONE ', 'LENOVO', 'AMD A6', '4', '1 TB', '', 'W10', '', 'SIN CONTRASEÑA', 'SISTEMA LENTO\nFORMATEO SIN RESPALDO', '', 'CON CARGADOR DE CORRIENTE', '', 350, 6, '2023-01-07', '2023-01-05', NULL),
(24, 10005, 'Oscar Villegas', '4776464680', 60, 'LAPTOP', 'LENOVO', 'AMD A8', '8', '1 TB', '', 'W 10', '', '845679123', 'MANTENIMIENTO INTERNO FISICO\r\nMANTENIMIENTO S.O CON RESPALDO\r\nDISCO SOLIDO SSD DE 480 GB\r\nCASE PARA DISCO EXTERNO', '', 'CON CARGADOR', '', 1890, 6, '2023-01-12', '2023-01-06', NULL),
(25, 10006, 'MARCO REYES', '4778707951', 61, 'LAPTOP ', 'HP', 'CORE I5', '8', '240 GB ', '0', 'W10', '', 'SIN CONTRASEÑA', 'VENTANAS EMERGENTES', 'DESACTIVAR ALGUNAS PAGINAS QUE MANDAN LA PUBLICIDAD', 'CON CARGADOR', '', 150, 6, '2023-01-11', '2023-01-07', NULL),
(26, 10007, 'Jose Luis Estrada Rico', '3312332906', 64, 'Laptop', 'Lenovo Thinkpad', 'Core i5', '16', '0', '240', 'W10', '', 'Marypily2121', 'Bisagra de pantalla Rota y tapa', 'Cotización de Bisagra y tapa superior del equipo', 'SIN CARGADOR, bisagra y tapa superior rota del equipo', '', 1700, 6, '2023-01-12', '2023-01-09', NULL),
(27, 10008, 'Fernando Garcia', '4775075130', 60, 'ALL IN ONE', 'HP', 'AMD A8', '8', '1 TB', 'SIN DISCO', 'W10', 'Sí', 'SIN CONTRASEÑA', 'SE APAGA REPENTINAMENTE EN OCASIONES', 'REVISAR', 'CON CARGADOR HP GENERICO', '', 0, 6, '2023-01-10', '2023-01-10', NULL),
(28, 10009, 'JAQUELINE GONZALEZ', '4773097660', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'SIN DATO', 'NO ENCIENDE\nBISAGRA DAÑADA', 'REVISION Y COTIZACION', 'SIN CARGADOR ', '', 0, 1, '2023-01-16', '2023-01-10', NULL),
(29, 10010, 'Brayan Herrera', '4776324965', 61, 'LAPTOP', 'GOBIERNO', 'CORE I3', '8', '', '120', 'WINDOWS 10', '', 'SIN CONTRASEÑA', 'REVISAR VENTILADOR SUENA FUERTE, ', 'MANTENIMIENTO INTERNO', 'CON CARGADOR', '', 350, 6, '2023-01-18', '2023-01-11', NULL),
(30, 10011, 'Liliana Romero', '4777069001', 60, 'LAPTOP', 'HP ', 'AMD E2', '4', '0', '32', 'WINDOWS 10', 'Sí', '1003', 'FORMATEO SIN RESPALDO', 'FORMATEO SIN RESPALDO ', 'CON CARGADOR\r\n\r\nYA SE ACABO EL DIA MARTES Y LE MARCAMOS Y NO NOS CONTESTA', '', 350, 6, '2023-01-16', '2023-01-13', NULL),
(36, 10012, 'MARIA GISELA HERNANDEZ', '4771087570', 61, 'LAPTOP ELITEBOOK', 'HP', 'CORE I5', '4', '500', '', 'WINDOWS 10 ', '', 'alesighdzc2484', '- MANTENIMIENTO FISICO \r\n- CAMBIO DE DISCO SOLIDO 480 GB SSD\r\n- INSTALACION DE S.O CON RESPALDO\r\n', 'EN LA DESCRIPCIÓN LA SOLUCIÓN ', 'SIN CARGADOR', '', 1740, 6, '2023-01-17', '2023-01-14', NULL),
(37, 10013, 'GABY MEDRANO', '4774494041', 60, 'LAPTOP', 'HP', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'yotequieromucho1', 'NO DA VIDEO', 'REVISIÓN', 'CON CARGADOR ', '', 0, 6, '2023-01-20', '2023-01-16', NULL),
(38, 10014, 'JORGE ROMERO', '4791191961', 61, 'LAPTOP', 'HP', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'WINDOWS 7', '', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'ACTUALIZACIÓN DE SISTEMA OK', 'CON CARGADOR', '', 350, 6, '2023-01-24', '2023-01-19', NULL),
(39, 10015, 'OLGA GUADIAN MARTINEZ', '4772385078', 60, 'LAPTOP', 'HP', 'CORE I5', '4', '160', '', 'WINDOWS 10', 'Sí', '1623', 'FORMATEO SIN RESPALDO REVISAR DISCO DURO TARDA EN ENTRAR AL SISTEMA DESDE UN PRINCIPIO', 'MANTENIMIENTO FISICO Y FORMATEO', 'CON CARGADOR', '', 700, 6, '2023-01-24', '2023-01-19', NULL),
(40, 10016, 'KARLA MARIANA QUINTANA CARRERA', '4778601425', 64, 'LAPTOP', 'GTO', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'PENDIENTE', 'Sí', 'SIN CONTRASEÑA', 'NO PRENDE ', '1500 +299 DE REGULADOR ', 'LAPTOP + CARGADOR ', '', 1500, 6, '2023-01-30', '2023-01-19', NULL),
(41, 10017, 'Maria de Fatima Gonzalez', '4777027288', 64, 'LAPTOP ', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'NO', 'NO PRENDE', '', 'DEJA LAPTOP CON CARGADOR SIN ENCENDER', '', 0, 1, '0000-00-00', '2023-01-21', NULL),
(42, 10017, 'Maria de Fatima Gonzalez', '4777027288', 64, 'LAPTOP ', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'NO', 'NO PRENDE', '', 'DEJA LAPTOP CON CARGADOR SIN ENCENDER', '', 0, 6, '0000-00-00', '2023-01-21', NULL),
(43, 10018, 'Daniel Sanchez', '4778273941', 61, 'CPU', 'DELL', 'CORE I5', '4', '', 'SIN INFORMACION', 'SIN INFORMACION', 'No', 'sin contraseña', 'CAMBIO DE DISCO SSD 480 + SISTEMA+MANTENIMIENTO INTERNO+ CAMBIO DE PROCESADOR.', 'SE AGREGO EL PROCESADOR TOTAL ANTERIOR DE $1,590 TOTAL CUANDO RECIBE EL EQUIPO DE $2,540 PESOS ', 'SIN CABLES ', '', 2540, 6, '2023-02-11', '2023-01-23', NULL),
(45, 10019, 'Margarita Avenicio', '4778590851', 60, 'LAPTOP', 'TOSHIBA', 'CENTRINO', '3', 'SIN DISCO', '', 'SIN SISTEMA', 'No', 'SIN CONTRASEÑA', 'INSTALAR DISCO DURO Y S.O.\r\nREVISAR CUALQUIER OTRO DETALLE', '', 'SIN CARGADOR Y SIN DISCO\r\n', '', 1240, 6, '2023-01-27', '2023-01-24', NULL),
(46, 10020, 'Cristian Contreras', '4774663243', 60, 'ALL IN ONE', 'HP', 'AMD E-350', '4', '500', 'SIN DATOS', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA', 'REVISARLA A DETALLE\r\nSE APAGA TRABAJANDO CON EL TIEMPO', 'REVISION', 'CON CARGADOR', '', 100, 6, '2023-01-27', '2023-01-24', NULL),
(47, 10021, 'Idalia Castro', '4776828090', 60, 'Laptop', 'HP', 'Intel pentium', 'sin dato', 'sin dato', 'no', 'w10', 'Sí', 'no ', 'equipo lento', '', 'Tarda mucho tiempo en prender', '', 150, 6, '0000-00-00', '2023-01-26', NULL),
(48, 10022, 'ADRIAN CHICO MARMOLEJO', '4773031994', 60, 'LAPTOP', 'ACER', 'INTEL CORE I3', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'SIN DATOS', 'NO ENCIENDE', 'CAMBIO COMPONENTES ELECTRICOS', '', '', 1350, 6, '2023-01-30', '2023-01-27', NULL),
(49, 10023, 'PATRICIA GOMEZ GONZALEZ', '4774114631', 60, 'LAPTOP', 'ACER', 'PENTIUM', '4', '500', 'NO APLICA', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- MUY LENTA REINICIO DE S.O\r\n- REVISAR BISAGRA DAÑADA', 'FORMATEO SIN RESPALDO', 'CON BISAGRA DAÑADA \r\nLINEA EN PANTALLA\r\nTAPA ROTA', '', 350, 6, '2023-02-03', '2023-01-28', NULL),
(50, 10024, 'GENERAL OPERADOR LOGISTICO', '4777507474', 60, 'ALL IN ONE ', 'HP', 'AMD A12', '12', '1 TB', '', 'WIN 10', 'Sí', 'GeneralF', 'SE APAGA EL EQUIPO', 'ACTUALIZACION DE SISTEMA Y BIOS ', 'ENTREGADO', '', 150, 6, '2023-02-07', '2023-01-30', NULL),
(51, 10025, 'VALNTINA DUARTE', '4776491526', 60, 'LAPTOP', 'LANIX', 'PENTIUM', 'SIN DATOS', 'SIN DATOS ', 'SIN DATOS', 'SIN DATOS', 'Sí', 'NO RECUERDA', 'COTIZAR PANTALLA ESTRELLADA\r\nSE PRENDE PERO SE APAGA\r\n', 'CAMBIO DE PANTALLA', 'SE PRENDE PERO SE APAGA', '', 1500, 6, '2023-02-06', '2023-01-30', NULL),
(52, 10026, 'CARLOS RAMOS', '4773160086', 60, 'CPU', 'LENOVO ', 'CORE I3', '4', '500', 'SIN INFORMACION', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'NO DETECTA EL PUERTO ETHERNET', 'actualización de driver', 'se actualizo driver y windows update', '', 200, 6, '2023-02-07', '2023-01-30', NULL),
(53, 10027, 'SERGIO AGUILAR GUZMAN', '4777043753', 60, 'LAPTOP', 'GTO', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', 'EL EQUIPO PRENDE Y SE APAGA, REVISAR TECLADO', 'SOLO SE REVISO OCUPA CAMBIO DE TECLADO Y BOTON DE ENCENDIDO', 'FALTAN DOS TECLAS AL TECLADO\r\n', '', 100, 6, '2023-02-06', '2023-01-31', NULL),
(54, 10028, 'BLANCA VAZQUEZ', '4776755287', 60, 'LAPTOP', 'TOSHIBA', 'CELERON', '4', '1 TB', 'SIN DATOS', 'WIN 10', 'Sí', '1234', 'INSTALAR ANTIVIRUS Y ACTUALIZAR OFFICE', 'ACTUALIZACION DE OFFICE Y ANTIVIRUS SE QUEDO EL MISMO ', 'SOLO ACTIVACION Y INSTALACION', '', 350, 6, '2023-01-31', '2023-01-31', NULL),
(55, 10029, 'NOE VALTIERRA', '4772624031', 60, 'CPU', 'DELL', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'daliaya0106', 'FORMATEO sin respaldo y revisar sonido de ventilador', 'MANTENIMIENTO Y SISTEMA OPERATIVO', 'sin cables', '', 700, 6, '2023-02-08', '2023-02-01', NULL),
(56, 10030, 'ABRAHAM CARRERA', '4771102469', 60, 'LAPTOP', 'LANIX', 'ATOM', '2', '235', 'SIN DATOS', 'WIN 10', 'Sí', 'CERRAJERIA16', 'INSTALACION DE PROGRAMA', 'activación programa', 'CON MOCHILA\r\nADAPTADOR DE MEMORIA\r\nPROGRAMAS', '', 150, 6, '2023-02-08', '2023-02-01', NULL),
(57, 10031, 'RENATA GAONA ', '4776690819', 64, 'LAPTOP', 'LENOVO THINKPAD', 'CORE I5', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'mnbvcxz10', 'No inicia S.O, el equipo no dio imagen al momento de recibirlo ', 'cambio a ssd de 480 + sistema sin respaldo', 'El equipo no da imagen cuando ingresa, el usuario indica que tarda de 7 a 10 min. en prender.', '', 1293, 6, '2023-02-15', '2023-02-03', NULL),
(58, 10032, 'Claudia Flores', '4772860571', 64, 'ALL IN ONE', 'HP', 'INTEL PENTIUM', 'SIN INFORMACION', '320', '', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'TODO OK ', 'EQUIPO ENTREGADO', '', 350, 6, '2023-02-10', '2023-02-03', NULL),
(59, 10033, 'JONATHAN RAMOS', '4424719849', 60, 'LAPTOP', 'HP', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN CONTRASEÑA', 'REVISAR PANTALLA SE VA IMAGEN CUANDO SE ABRE', 'reconeción de flex de video. se probo display en otro equipo y no fallo asi mismo el flex no se logro identificar como tal la falla pero con las pruebas quedo funcionando correctamente.', 'se dieron 30 dias de garantia en el servicio se tomara a cuenta lo cobrado en dado caso de que vuelva a fallar. ', '', 200, 6, '2023-02-13', '2023-02-06', NULL),
(60, 10034, 'LA BUSQUEDA II', '4777723354', 60, 'ALL IN ONE', 'SAMSUNG', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'Consejeria2021', 'No enciende\r\nDa pantalla azul', '', '16DE FEBRERO SE LLAMO Y SE LES AVISO\r\n24 DE FEBRERO SE LES VUELVE A AVISAR\r\n8 DE MARZO  MARCAN PARA PREGUNTAR CUANDO ERA PERO NO PASARON', '', 1728.4, 6, '2023-02-13', '2023-02-06', NULL),
(61, 10035, 'MARIA MARTINA', '4774833001', 60, 'LAPTOP', 'DELL ', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', 'LIMPIEZA  POR DERRAME DE LIQUIDO\r\nREVISAR POR QUE SE APAGA CON EL USO\r\nREVISAR POR QUE DA PANTALLA AZUL', 'mantenimiento físico y actualizaciones de s.o', '', '', 450, 6, '2023-02-06', '2023-02-06', NULL),
(62, 10036, 'PEDRO SERRATOS', '4773473131', 60, 'CPU', 'ARMADO', 'CORE I5', '32', '', '480', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', 'FORMATEO SIN RESPALDO ', 'SIN CABLE DE CORRIENTE', '', 350, 6, '2023-02-14', '2023-02-07', NULL),
(63, 10037, 'PATRICIA GOMEZ GONZALEZ', '4774114631', 64, 'LAPTOP', 'GUANAJUATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'pendiente la mandara por whats', 'No prende el equipo. cliente comenta que al principio batallaban para que prendiera, movían el cargador de la parte conde se conecta a la laptop para que prendiera', 'revisar', 'CARGADOR SE REMPLAZO', '', 490, 6, '2023-02-07', '2023-02-07', NULL),
(64, 10038, 'Jose Mauricio Perez', '4776863096', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'Fabiolamurillo', 'No prende equipo. si detecta el cargador cuando se conecta pero no prende', 'SOLO LA REVISION', 'El cargador presenta desgaste estético cable jalado', '', 100, 6, '0000-00-00', '2023-02-07', NULL),
(65, 10039, 'David alejandro hernandez', '4773854815', 64, 'laptop', 'hp', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'No', 'SIN DATO', 'NO PRENDE.', 'SE REVISO NADA MAS', 'se vendara cargador costo $490', '', 100, 6, '0000-00-00', '2023-02-11', NULL),
(66, 10040, 'Ricardo Cardenas', '4776315181', 64, 'laptop', 'hp', 'core i7', '12', '250', '', 'w10', 'Sí', 'sin contraseña', 'actualización de programa y config. de teclado.', 'formateo y respaldo de inf.', '', '', 450, 6, '0000-00-00', '2023-02-13', NULL),
(67, 10041, 'Beatriz Romero', '4775957851', 60, 'LAPTOP', 'HP', 'CELERON', '4', '500', 'sin dato', 'WIN 10', 'Sí', 'Montielromero', 'Equipo lento\r\nCambiar a Ssd de 480 gb \r\nwind 10 con respaldo de informacion', 'Cambio a ssd 480 gb, formateo y respaldo de info.', 'cargador parchado del cable ', '', 1390, 6, '2023-02-17', '2023-02-14', NULL),
(68, 10042, 'Moises Hernandez', '4774333271', 64, 'laptop ', 'HYUNDAY ', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'Sí', 'SIN DATO', 'Formateo sin respaldo de información', 'formateo sin respaldo w10', '', '', 350, 6, '2023-02-17', '2023-02-15', NULL),
(69, 10043, 'SU Wenci', '7721201878', 60, 'CPU', 'ACER', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN DATOS', 'NO ENCIENDE', 'SE REVISO SIN COBRO', 'SOLO CPU SIN CABLES NI NADA', '', 0, 6, '2023-02-24', '2023-02-17', NULL),
(70, 10044, 'Ana Mariela Alba Barroso', '4771258719', 60, 'LAPTOP', 'ACER ', 'CORE I5', '4', '1 TB', 'SIN DATOS', 'WINDOWS 10', 'Sí', 'SIN DATOS', 'CAMBIO DE DISCO SSD A 480 + FORMATEO', '', 'EQUIPO LENTO', '', 0, 6, '2023-02-18', '2023-02-18', NULL),
(71, 10045, 'CARLOS OLIVA HERNANDEZ', '4779164832', 60, 'LAPTOP', 'COMPAQ', 'CELREON', '4', 'SIN DATOS', 'SIN DATOS', 'WIN 7', 'Sí', 'SIN DATOS', 'FORMATEO CON RESPALDO', 'MANTENIMIENTO FISICO\r\nUSB DE 64 GB KINSTONG\r\nS.O. MAS RESPALDO', '', '', 949, 6, '2023-02-25', '2023-02-18', NULL),
(72, 10046, 'BRAULIO SIERRA', '4772877645', 60, 'LAPTOP', 'DELL', 'CORE I5', '8', 'SIN DATOS', '240', 'WINDOWS 10', 'Sí', 'SIN DATOS', 'revisar bateria\r\nrevisar cargador\r\nrevisar jack de corriente', 'REVISAR', 'Linea en pantalla , quebrada en la tapa superior, jack de corriente dañado, no agarra touchpad', '', 450, 6, '2023-02-27', '2023-02-20', NULL),
(73, 10047, 'Luis Enrique Vargas', '4776383713', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '8 RAM', '1 TB', 'SIN DATOS', 'WIND 10', 'Sí', '3069', '- INSTALACION DE SSD 480 GB \r\n- ACTUALIZACION DE S.O', '', '', '', 1340, 6, '2023-03-04', '2023-02-25', NULL),
(74, 10048, 'Karla Frausto', '4772640219', 64, 'LAPTOP', 'COMPAQ', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'NO CUENTA', 'NO ENCIENDE', 'SE RECONECTO EL DISCO DURO\r\nSE RECONECTARON ALGUNOS COMPONENTES\r\nDRIVER DE AUDIO', '', '', 200, 6, '2023-02-27', '2023-02-27', NULL),
(75, 10049, 'Marlene de Jesus', '4773492264', 60, 'LAPTOP ', 'HP', 'RYZEN 3', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', '20127 ó puede ser 12207', 'ENCIENDE PERO NO DA IMAGEN', 'SE DIO MANTENIMIENTO INTERNO, CON ESO QUEDO', 'SE ENTREGO EQUIPO ALFONSO MARTINEZ', '', 350, 6, '2023-03-02', '2023-03-01', NULL),
(76, 10050, 'Jose Luis Paramo', '4777804983', 60, 'LAPTOP ', 'DELL', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', 'ENCIENDE PERO NO DA IMAGEN', 'LAPTOP SIN REPARAR POSIBLE CHIP ED VIDEO SE LE OFRECIO AL CLIENTE PERO NO LO QUISO SOLO PAGO LA REVISION. ', 'FALTAN TECLAS, SIN TAPA EN LA CARCASA DEL DISCO DURO, CARGADOR PARCHADO CON CINTA.', '', 100, 6, '2023-03-09', '2023-03-02', NULL),
(77, 10051, 'OMAR GRABRIEL TORRES', '4777305715', 64, 'LAPTOP ', 'HP', 'CORE I5', '8', '250', 'SIN DATOS', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'MANTENIMIENTO INTERNO', '', '', '', 350, 6, '2023-03-02', '2023-03-02', NULL),
(78, 10052, 'BERNARDO FUENTES ZUÑIGA', '4772409382', 64, 'LAPTOP', 'HP', 'AMD A9', '4 ', '1 TB', '', 'WIN 10', 'Sí', '1997', 'REVISAR POR LENTA', 'actualizaciones', 'CARGADOR CON CINTA TROSADO DE LA PUNTA', '', 200, 6, '0000-00-00', '2023-03-03', NULL),
(79, 10053, 'MIRIAN LUNA GENERAL', '4777507474', 0, 'LAPTOP', 'LENOVO THINKPAD ', 'CORE I7', '16', 'sin informacion', '512', 'WIN 11', 'Sí', '2145', 'FALLA EN ALGUNAS TECLAS', '', '', '', 350, 6, '2023-03-13', '2023-03-06', NULL),
(80, 10054, 'JOSE NIEVES ALVAREZ', '4777764797', 64, 'CPU', 'ARMADO', 'AMD', '2', '120', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN CONTRASEÑA', 'ENCIENDE PERO SE APAGA, PUEDE DURAR MUCHO O POCO TIEMPO PRENDIDO', 'MANTENIMIENTO INTERNO', 'SIN MANTENIMIENTO, CON POLVO ', '', 350, 6, '2023-03-13', '2023-03-06', NULL),
(81, 10055, 'Christian Medina ', '4776776067', 64, 'imac', 'apple', 'sin dato ', 'sin dato', 'sin dato ', 'sin dato ', 'SIN DATOS', 'No', 'SIN CONTRASEÑA', '-el equipo se apaga.\r\n- ram 8 gb $1,200\r\n-s.o $590\r\n- Material para abrir $1,000\r\n\r\n', 'Revisar el problema porque se apaga.', 'Se apaga una vez cada 2 semanas ', '', 2790, 6, '0000-00-00', '2023-03-06', NULL),
(82, 10056, 'MARIBEL ORTIZ', '4425922957', 64, 'LAPTOP', 'HP', 'PENTIUM', '4', 'sin dato ', 'SIN DATOS', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'SISTEMA DAÑADO', 'CAMBIO A SSD240 GB\r\nSISTEMA OPERATIVO + RESPALDO', 'SIN TORNILLOS\r\nTRAE UNA REPARACION DE SOLDADURA', '', 1190, 6, '2023-03-08', '2023-03-06', NULL),
(83, 10057, 'Sergio Luna', '4771445338', 64, 'LAPTOP', 'DELL', 'CORE I5', '8', '1 TB ', 'SIN DATO ', 'W10', 'Sí', 'SIN DATO', '-No inicia S.O', '-Cambio a disco solido 960 gb $1690\r\n-Instalación de S.O. $350', 'SE ENTRGEA EQUIPO MA. CAUDILLO', '', 2040, 6, '2023-03-08', '2023-03-07', NULL),
(84, 10058, 'VICTOR VARGAS', '4775765578', 64, 'CPU', 'ARMADO', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'No', 'SIN CONTRASEÑA', 'PRENDE PERO NO DA IMAGEN', '', 'SIN CABLE DE CORRIENTE', '', 0, 1, '2023-03-14', '2023-03-07', NULL),
(85, 10059, 'FELIPE GONZALEZ', '4772503511', 64, 'LAPTOP', 'SAMSUNG/HP', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', '- SAMSUNG NO PRENDE REVISAR BATERIA REVISAR CARACTERISTICAS Y SISTEMA OPERATIVO\r\n- HP FALSO CONTACTO, NO CONTRASEÑA, REVISION', '-Mantenimiento  Interno\r\n-Cargador ', '', '', 850, 6, '2023-03-16', '2023-03-09', NULL),
(86, 10060, 'S.N.T.H.P.A.T.C.S.C DE LA R.M.', '4621251844', 60, 'LAPTOP', 'DELL', 'CORE I5', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'WINDOWS 10', 'Sí', 'bimbo1995', '-Mantenimiento Interno, programas de adobe pro', '- Se realizo mantenimiento interno al equipo, limpieza y cambio de pasta $350\r\n- Se instalo una actualizacion de adobe acrobat de edición. $350', 'Cargador con cinta, no inicia sistema seria revisar cliente indica que si iniciaba', '', 700, 6, '2023-03-13', '2023-03-10', NULL),
(87, 10061, 'MIRIAN LUNA GENERAL', '4777507474', 64, 'ALL IN ONE', 'HP/HP', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO\r\n- FORMATEO SIN RESPALDO LAS DOS EQUIPOS', '', 'SOLO EQUIPOS Y CARGADOS 2 ALL IN ONE HP , DEJA SIN ENCENDER\r\npago $1,700+iva total $1,972', '', 1972, 6, '2023-03-18', '2023-03-11', NULL),
(88, 10062, 'GRETEL SARAI TORRES MENDEZ ', '4778063764', 60, 'LAPTOP', 'LENOVO', 'CORE I7', '16', '1 TB ', '120', 'WINDOWS 11', 'Sí', '1201', 'CAMBIO A DISCO SSD DE 1 TB + SISTEMA+ MANTENIMIENTO $1,890+450+450= 2,790 TOTAL', 'SE REALIZO TODO LO MENCIONADO', '', '', 2790, 6, '2023-03-20', '2023-03-13', NULL),
(89, 10063, 'JESUS VERA FUENTES', '4771146293', 60, 'LAPTOP', 'TOSHIBA', 'PENTIUM', '2', '160', '0', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA', '- CONFIGURAR IMPRESORA EN EL CPU $150\r\n- FORMATEO SIN RESPALDO LA LAPTOP $350\r\n- MANTENIMIENTO INTERNO $350', '', 'ENTREGA, CPU, IMPRESORA, LAPTOP. ENTREGA DISCO SOLIDO DE 120 GB', '', 850, 6, '2023-03-21', '2023-03-14', NULL),
(90, 10064, 'LUIS GODINEZ', '4428180992', 60, 'LAPTOP', 'HP', 'CORE I7', '32', 'SIN DATOS', '500', 'WINDOWS 11', 'Sí', 'SIN CONTRASEÑA', '- MARCA PANTALLA AZUL DE CARITA TRISTE Y OTRA PANTALLA DEL DISCO NO SI NO LO TUVIERA\r\n- BOOT  DEVICE NOT FOUND PANTALLA EN NEGRO MARCA ESO ', '', '', '', 0, 6, '2023-03-21', '2023-03-14', NULL),
(91, 10065, 'MARIA MARTINA MORALES', '4774833001', 60, 'LAPTOP', 'HP', 'AMD A4', '4', '500', 'SIN DATOS', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'SE CALIENTA Y SE APAGA EL EQUIPO', 'MANTENIMIENTO INTERNO', 'EQUIPO SUCIO POSIBLE PROBLEMA', '', 350, 6, '2023-03-14', '2023-03-14', NULL),
(92, 10066, 'ZOARA LEON MEDRANO', '4776490795', 60, 'LAPTOP', 'HP', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', '571573', 'LAPTOP SE COMPRIMIO Y DEJO DE VERSE\r\nREVISAR A DETALLE', '', 'PANTALLA ESTRELLADA, NO DA IMAGEN', '', 0, 6, '2023-03-22', '2023-03-15', NULL),
(93, 10067, 'Enrique Lopez', '5545125401', 64, 'laptop', 'hp', 'pentium 4415u', '4', '500', '', 'w10', 'Sí', 'sin contraseña', 'Fallan teclas de los lados.', 'cotizar teclado', '', '', 0, 6, '0000-00-00', '2023-03-16', NULL),
(94, 10068, 'ILSE ALCARAZ', '4776773861', 64, 'LAPTOP', 'LENOVO', 'CORE I3', '4 RAM', 'SIN DATOS', '240 GB', 'WINDOWS 10 ', 'Sí', '2411', 'INSTALACION DE ACTUALIZACIONES', '', 'NO TIENE CUBIERTAS EN LA BISAGRA', '', 350, 6, '2023-03-23', '2023-03-16', NULL),
(95, 10069, 'MIGUEL ANGEL', '4772862344', 60, 'CPU', 'DELL', 'CORE I5', '8 GB RAM', '500', 'SIN DATOS', 'WINDOWS 10 ', 'Sí', 'sin contraseña', 'CPU LENTO REVISAR', 'FORMATEO SIN RESPALDO, NO SE COBRA POR ESTA OCASION POR POCO TIEMPO DE COMPRA.', 'SOLO ENTRGEA CPU', '', 0, 6, '2023-03-23', '2023-03-16', NULL),
(96, 10070, 'MARIA SANDRA ELIZONDO ZUÑIGA', '4772312504', 60, 'LAPTOP', 'DELL', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', '2504', 'NO ENCIENDE, EQUIPO DEJO DE PRENDER POR DESCARGA ELECTRICA', '299 regular\r\n250 reparacion\r\n590 cargador  \r\nPago con transferencia', 'CABLE PELON DEL CARGADOR', '', 1139, 6, '2023-03-24', '2023-03-17', NULL),
(97, 10071, 'PAOLA IRAZU MARQUEZ SANCHEZ', '4772021395', 64, 'LAPTOP', 'HP', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'cobres1583', 'INSTALACION DE OFFICE', '', 'SIN BATERIA, BISAGRAS DAÑADAS, NO INICIA SISTEMA OPERATIVO', '', 0, 6, '2023-03-28', '2023-03-21', NULL),
(99, 10072, 'victor Manuel Velazquez', '4741034817', 64, 'LAPTOP', 'hp', 'CORE I3', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'sin contraseña', 'No prende (comenta que hace 2 años dejo de funcionar, se descargo por completo y ya no cargo)', 'Reparacion en placa madre+ sistema operativo\r\n$1,500+350 = $1,850', 'Deja cargador generico. ', '', 1850, 6, '0000-00-00', '2023-03-25', NULL),
(100, 10073, 'EMMANUEL ALVARADO', '4774146515', 60, 'LAPTOP', 'TOSHIBA', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'No', 'SIN CONTRASEÑA', 'PREPARAR PARA DEJARLA LISTA', 'NO SE REVISA POR QUE NO ENCIENDE ', '', '', 0, 1, '2023-04-01', '2023-03-25', NULL),
(101, 10074, 'Alicia Barrozo', '4774035166', 64, 'LAPTOP', 'HP', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'SIN INFORMACION', 'Sí', 'SIN CONTRASEÑA', '-NO INICIA SISTEMA OPERATIVO\r\n-SOLICITAR BATERIA\r\n-CAMBIO DE DISCO SOLIDO DE 480 GB + SISTEMA', 'Cambio de disco+ sistema+batería PAGADO $1,930', '', '', 1930, 6, '2023-03-29', '2023-03-29', NULL),
(102, 10075, 'MARTIN AGUIRRE', '4772475695', 60, 'LAPTOP', 'HP', 'CORE I7', '8', '1 TB', '120', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', 'BRISAGRA DAÑADA  REPARACION', 'BISAGRA REPARADA MECANICAMENTE', 'BISAGRA DAÑADA\r\nSE MUEVE LA PANTALLA Y SE PONEN CUADROS NEGROS EN PANTALLA', '', 950, 6, '2023-04-05', '2023-03-29', NULL),
(103, 10076, 'VICTOR CARRION', '4773924614', 60, 'CPU', 'LENOVO', 'CORE 2 DUO', '4', '250', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'NO INICIA SISTEMA OPERATIVO', 'FORMATEO Y MANTENIMIENTO', 'CON POLVO', '', 700, 6, '2023-03-30', '2023-03-30', NULL),
(104, 10077, 'HUGO DIAZ', '4777245583', 60, 'ALL IN ONE', 'LENOVO', 'CELERON', '4', '960', 'SIN DATO', 'WINDOS 10', 'Sí', '123856', '- EQUIPO LENTO REVISAR', '- CAMBIO DE DISCO SSD DE 480 GB $ 890\r\n- SISTEMA OPERATIVO + RESPALDO $450+150\r\n- Total $1,490', 'SOLO EQUIPO Y CARGADOR ENTREGA', '', 1490, 6, '2023-04-10', '2023-03-31', NULL),
(105, 10078, 'Claudia Olivares', '4771805008', 64, 'laptop', 'HP ', 'AMD A6 2.70', '8', '', '120', 'WINDOS 10', 'Sí', 'SIN CONTRASEÑA', 'Realizar Mantenimiento al equipo.', 'MANTENIMIENTO INTERNO REALIZADO\r\nENTREGADO EN 05/04/2023', '', '', 350, 6, '0000-00-00', '2023-04-04', NULL),
(106, 10079, 'ROSA ALVARADO', '4775746136', 64, 'LAPTOP', 'HP', 'CORE I5', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'Rubyncha', '- no detecta el internet\r\n- no se escucha nada\r\n- No inicia el sistema operativo', '', '', '', 350, 6, '2023-04-11', '2023-04-04', NULL),
(107, 10080, 'MARISOL MORENO', '4791350799', 60, 'ALL IN ONE', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'ismari24', '-EQUIPO NO ENCIENDE \r\n', '', '- EQUIPO SE ENTREGA DESARMADO CON TODAS SUS PIEZAS SUELTAS\r\n- NO SE REVISA HASTA VER QUE PROBLEMA TIENE', '', 0, 1, '2023-04-17', '2023-04-10', NULL),
(108, 10081, 'EDGAR MALDONADO', '4777371843', 64, 'ALL IN ONE ', 'LENOVO', 'CORE I3', '4', '1 TB', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', 'AUMENTO A 4 GB DE RAM\r\nCAMBIO A SSD DE 480 GB + SISTEMA', 'TODO LO DESCRITO', '', '', 1890, 6, '2023-04-12', '2023-04-11', NULL),
(109, 10082, 'José  Nieves Gonzalez', '4721010208', 64, 'CPU', 'ARMADO', 'CORE I5', '16', '1 TB ', 'SIN DATO', 'WINDOS 10', 'No', 'SIN CONTRASEÑA', 'No prendía cuando lo trajo se conecto botón. ', '- Realizar Mantenimiento $490\r\n- Instalación de SSD M.2 500 GB $1,000\r\n-S.O $350\r\n', 'Sin tapa Lateral, cuando lo trajo no prendía se conecto botón ', '', 1840, 6, '2023-04-17', '2023-04-12', NULL),
(110, 10083, 'CARLOS MARTINEZ', '4774097769', 60, 'LAPTOP', 'TOSHIBA', 'CELERON', '4', '960', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'FALLA EN LA BISAGRA ', '', 'TAPA DE BISAGRA ROTA', '', 1000, 6, '2023-04-19', '2023-04-12', NULL),
(111, 10084, 'Adrian Ruiz Rodriguez', '4777955696', 64, 'CPU', 'HP ', 'CORE I5', '4', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'Mimis.123', 'NO PRENDE, REVISAR BOTON DE ENCENDIDO. ', 'BOTON REPARADO', 'REVISAR BOTON DE ENCENDIDO, SE QUEDA PEGADO', '', 150, 6, '0000-00-00', '2023-04-13', NULL),
(112, 10085, 'Carlos Gustavo Cielo de la Rosa', '5576330459', 64, 'LAPTOP', 'lenovo', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'PEDIR CARGADOR Y FORMATEO', '-  CARGADOR PARA LAPTOP $490\r\n-FORMATEO SIN RESPALDO W8 $350\r\n- TOTAL DE $840', 'Deja equipo sin encender no trae carga y se solicitara el cargador.', '', 840, 6, '2023-05-03', '2023-04-15', NULL),
(113, 10086, 'Samuel Grijalva', '4778188890', 60, 'CPU', 'LENOVO', 'AMD A8', '8 RAM', '500', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'NO ENCIENDE EQUIPO ', 'CAMBIO DE PLACA MADRE SE APLICA DESCUENTO POR SER CLIENTE', 'GIRAN MUCHO LOS VENTILADORES CUANDO SE ACELERAN, RECIBIMOS EL EQUIPO CON PLAYER OBSTRUYENDO LA ZONA DE VENTILACION', '', 1200, 6, '2023-04-28', '2023-04-21', NULL),
(114, 10087, 'Jose Muñoz', '4521493230', 64, 'LAPTOP', 'DELL ', 'CORE I3', '8', 'SIN DATO', 'SIN DATO', 'W10', 'Sí', 'SIN CONTRASEÑA ', 'EQUIPO SE BLOQUEABA Y SE APAGABA.', 'SE DIAGNOSTICA DAÑO EN CARGADOR. \r\nVENDER CARGADOR.\r\nREALIZAR MANTENIMIENTO INTERNO. \r\n\r\nSE ENTREGO EQUIPO TODO OK 28042023', 'Batería un poco floja', '', 840, 6, '2023-04-28', '2023-04-24', NULL),
(115, 10088, 'Olegario Juarez', '4777521482', 60, 'LAPTOP', 'APPLE', 'CORE I5 ', '8', '', '120', 'CATALINA', 'Sí', '1234abc', 'formateo sin respaldo \r\nsubir a ventura', 'formateo sin respaldo  ', '', '', 590, 6, '2023-05-02', '2023-04-25', NULL),
(116, 10089, 'Luza aceves', '4775776847', 60, 'COMPUTADORA', 'HP', 'CORE I7', '8', '500', 'NO APLICA', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA ', 'Mantenimiento Interno\r\n- Limpieza Placa Madre y puertos\r\n- Sopleteo a gabinete y placa madre\r\n- Cambio de pasta a procesador intel', '', 'Sucursal Haciendas del Rosario (Autolata)\r\nMantenimiento $350 Visita acordada $250', '', 600, 6, '2023-04-25', '2023-04-25', NULL),
(117, 10090, 'Luza aceves', '4775776847', 64, 'COMPUTADORA', 'HP', 'CORE I3', '4', '160', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA ', 'Mantenimiento Interno\r\n- Limpieza Placa Madre y puertos\r\n- Sopleteo a gabinete y placa madre\r\n- Cambio de pasta a procesador intel\r\n- Limpieza de periféricos\r\n- Limpieza de monitor', 'Se recomienda un aumento de ram y un cambio a ssd para que funcione mejor se le comento a la persona que recibió.', 'Sucursal Satelite \r\nMantenimiento $350 Visita acordada $250', '', 600, 6, '2023-04-26', '2023-04-26', NULL),
(118, 10091, 'Antonio Torres', '4771754572', 60, 'LAPTOP', 'HP', 'CORE I5', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'SIN DATOS', 'Sí', '0420', 'NO ENCIENDE', '- CAMBIO E TARJETA MADRE\r\n- CAMBIO DE TECLADO ', '', '', 2300, 6, '2023-05-03', '2023-04-26', NULL),
(119, 10092, 'CELIA CAMARENA', '4777054153', 60, 'LAPTOP', 'LENOVO', 'CORE I5 ', '8', '500', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA ', 'ACTUALIZACION DE  PROGRAMA', '', '', '', 0, 6, '2023-04-27', '2023-04-27', NULL),
(120, 10093, 'MARCO ANTONIO GARCIA', '4773114719', 60, 'LAPTOP', 'BLUE LIGHT', 'ATOM', '1', '320', 'NO APLICA', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA ', ' INSTALAR CONTROLADORES Y  CROOME, DEJAR LISTO PARA TRABAJAR', 'TODO OK', 'BATERIA NO RETIENE', '', 350, 6, '2023-04-27', '2023-04-27', NULL),
(121, 10094, 'ARACELY PATLAN', '4774326121', 64, 'LAPTOP', 'HP', 'CORE I3', '8', 'SIN DATOS', '256', 'WINDOWS 11', 'Sí', 'SIN CONTRASEÑA', 'ACTUALIZACIONES DE SISTEMA IDIOMA\r\nY ACTUALIZACION DE PAQUETERIA', '', '', '', 550, 6, '2023-04-28', '2023-04-28', NULL),
(122, 10095, 'ELENA DE LOS ANGELES VALADEZ RAMIREZ', '4731370362', 64, 'CPU', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'Armar equipo', 'Armar equipo OK ENTREGADO 06052023', 'DEJA COMPONENTES POR SEPARADO', '', 800, 6, '0000-00-00', '2023-04-29', NULL),
(123, 10096, 'Luza aceves', '4775776847', 64, 'COMPUTADORA', 'HP', 'CORE I5', '8', '250', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'Mantenimiento Interno\r\n- Limpieza Placa Madre y puertos\r\n- Sopleteo a gabinete y placa madre\r\n- Cambio de pasta a procesador intel\r\n- Limpieza de periféricos\r\n- Limpieza de monitor', 'Sucursal Jardines de los Naranjos Vinateria\r\nMantenimiento $350 Visita acordada $250', '', '', 600, 6, '2023-04-27', '2023-04-27', NULL),
(124, 10097, 'Luza aceves', '4775776847', 64, 'COMPUTADORA', 'HP', 'CORE I7', '8', '500', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'Mantenimiento Interno\r\n- Limpieza Placa Madre y puertos\r\n- Sopleteo a gabinete y placa madre\r\n- Cambio de pasta a procesador intel', '', 'Sucursal Quinta los Naranjos \r\nMantenimiento $350 Visita acordada $250', '', 600, 6, '2023-04-27', '2023-04-27', NULL),
(125, 10098, 'ISRAEL CHAVEZ', '4777008272', 60, 'LAPTOP', 'HP', 'CELERON', '4', '500', 'SIN DATO', 'WINDOWS 10', 'No', '1', 'AUMENTO DE RAM A 4 GB ', 'Sin nigun aumento de ram solo se realizo la revisión.', 'MANCHSA EN TAPA SUPERIOR\r\nDESGASTE DE TOUCH PAD', '', 100, 6, '2023-05-06', '2023-05-03', NULL),
(126, 10099, 'Luza aceves', '4775776847', 64, 'COMPUTADORA', 'HP', 'CORE I5', '4', '500', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'Mantenimiento Interno\r\n- Limpieza Placa Madre y puertos\r\n- Sopleteo a gabinete y placa madre\r\n- Cambio de pasta a procesador intel', '', 'Sucursal Más Vino Amberes\r\nMantenimiento $350 Visita acordada $250', '', 600, 6, '2023-05-04', '2023-05-04', NULL),
(127, 10100, 'Saul Rizo', '4771338355', 64, 'cpu', 'dell', 'core i7', 'sin dato ', 'sin dato', 'sin dato', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'EQUIPO NO DA VIDEO, PITA CUANDO PRENDE', 'REVISAR MANT. \r\nREVISAR HDD\r\nSI TODO ESTA BIEN INSTALAR SISTEMA OPERATIVO.\r\n\r\n- CAMBIO DE DISCO A UN SSD DE 240 GB\r\n- UN CABLE SATA\r\n- MANTENIMIENTO INTERNO Y SISTEMA SIN RESPALDO ', 'DEJA EL EQUIPO CON PROPLEMA DE NO DA VIDEO COMENTA QUE SE DEJO DE USAR UN AÑO', '', 1340, 6, '0000-00-00', '2023-05-05', NULL),
(128, 10101, 'SERGIO OLIVO', '4772747904', 64, 'CPU', 'HP', 'CORE I5', '4', '250', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', 'ACTUALIZACIONES \r\nMANTENIMIENTO', 'ACTUALIZACIONES \r\nMANTENIMIENTO', '', '', 400, 6, '2023-05-05', '2023-05-05', NULL),
(129, 10102, 'SR. Corona', '4771331145', 60, 'ALL IN ONE', 'APPLE', 'CORE I7', '8 RAM', '1 TB', 'SIN DATO', 'HIGH SIERRA', 'No', '123', 'ACTUALIZACIONES\r\n- Material para pantalla y sistema O.S $1,200\r\n- Disco ssd de 480 gb $790\r\n- 8 gb mas de ram mac $1,200\r\nTOTAL $3,190', 'Actualización para mejor velocidad!', 'se entrega solo equipo all in one', '', 3190, 1, '2023-05-05', '2023-05-05', NULL),
(130, 10103, 'MARTIN AGUIRRE', '4777992440', 60, 'LAPTOP', 'HP', 'CORE I7', '8', '1 TB', '120', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', 'ENCIENDE PERO NO DA IMAGEN\r\n- CUANDO MUEVE LA PANTALLA HAY VECES QUE SE VE Y OTRAS QUE NO\r\n- SE CALENTABA CON EL USO Y SE TRABO', 'REPARACION DE FLEX Y MANTENIMIENTO ', 'OTRA OPCION DE TELEFONO 4772475695', '', 950, 6, '2023-05-15', '2023-05-08', NULL),
(131, 10104, 'GABRIEL TORRES', '4773801497', 60, 'LAPTOP', 'ASUS', 'AMD A4', '4', '500', 'SIN DATO', 'WINDOWS 10', 'Sí', 'Dians2023', 'EQUIPO MOJADO DE REFRESCO', '-LIMPIEZA INTERNA\r\n- FORMATEO SIN RESPALDO', 'TECLAS ESTAN MUY DURAS SE PEGAN', '', 350, 6, '2023-05-16', '2023-05-09', NULL),
(132, 10105, 'Ariadna Ascencio ', '4776830052', 64, 'ALL IN ONE', 'APPLE', 'sin dato', 'sin dato ', 'sin dato ', 'sin dato ', 'SIN DATO', 'No', '827139', 'No inicia s.o', '-DISCO SOLIDO SSD 480 GB $790\r\n- SISTEMA OPERATIVO $590\r\n- MANTENIMIENTO $590\r\n- COREL $350\r\n- TOTAL $2,320', 'No se ha dado mantenimiento ', '', 1890, 6, '2023-11-10', '2023-05-09', NULL),
(133, 10106, 'GERARDO GUTIERREZ', '4777534860', 60, 'LAPTOP', 'DELL', 'CORE 2 DUO', '4', 'SIN DATO', '120', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'NO FUNCIONA EL TOUCH PAD', 'INSTALACION DE CONTROLADOR DE TOUCH PAD\r\nACTIVACION DE OFFICE Y ACTUALIZACIONES ', 'SIN CARGADOR, SE BATALLA AL ENCENDER', '', 150, 6, '2023-05-10', '2023-05-10', NULL),
(134, 10107, 'MARCOS CISNEROS', '4772017592', 64, 'LAPTOP', 'ASUS ', 'CORE I3', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'Sí', '700908', 'No prende', 'SIN SOLUCION , SE COBRA REVISION', 'plástico con estrellada en equina arriba del teclado.\r\ncargador reparado.\r\ncliente retiro hdd de 1 tb\r\ncliente comenta que la apagaron y después no prendió.\r\n', '', 100, 6, '2023-06-15', '2023-05-11', NULL),
(135, 10108, 'CESAR ANDRADE', '4774455411', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'NO ENECIENDE', '', 'SOLO CPU', '', 0, 6, '2023-05-18', '2023-05-11', NULL),
(136, 10109, 'LUNA LOPEZ LOURDES', '4775213440', 60, 'LPATOP', 'LENOVO', 'SIN DATO', 'SIN DATO', '', 'SIN DATO', 'SIN DATO ', 'Sí', 'SIN CONTRASEÑA', 'EQUIPO NO ENCIENDE', 'NO TUVO SOLUCION EQUIPO YA NECESITA REMPLAZO EN LA PLACA MADRE ', 'SIN TAPA DE CD', '', 100, 6, '2023-05-19', '2023-05-12', NULL),
(137, 10110, 'Rubi Esmeralda Lopez Martinez', '4791453704', 60, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'No', 'SIN CONTRASEÑA', 'QUITARLA CONTRASEÑA $250\r\nMANTENIMIENTO INTERNO $350', 'FORMATE SIN RESPALDO + MANTENIMIENTO', 'ENTREGA SOLO EL CPU, EQUIPO NO SE PRUEBA POR DEMACIADO POLVO', '', 700, 6, '2023-05-22', '2023-05-15', NULL),
(138, 10111, 'RENATA DOMINGUEZ', '4775656823', 60, 'LAPTOP', 'GTO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'EQUIPO NO INICIA SISTEMA OPERATIVO', 'SIN SOLUCION, SE COBRA REVISION', 'INDICA QUE BORRARON ARCHIVOS, QUITARON  BLOQUEO Y NO PUEDEN CARGAR SISTEMA OPERATIVO', '', 100, 6, '2023-05-22', '2023-05-15', NULL),
(139, 10112, 'REYES RAMIREZ', '4776769441', 60, 'LAPTOP', 'APPLE', 'CORE I5', '4', 'SIN DATO', 'SIN DATO', 'VENTURA', 'Sí', '1234', 'LIMPIEZA DE SISTEMA\r\nFORMATEO SIN RESPALDO', 'INSTALACION DE SISTEMA', '', '', 590, 6, '2023-05-15', '2023-05-15', NULL),
(140, 10113, 'Adrian Rodriguez', '4777955696', 64, 'LAPTOP', 'Lenovo', 'AMD Ryzen 5', '8', '1 tb ', '120', 'w11', 'No', '4020', 'Algunas teclas no funcionan', 'Revisar Teclado', '', '', 0, 6, '0000-00-00', '2023-05-16', NULL),
(141, 10114, 'Ulises Alcantar', '4772682127', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'No', 'SIN CONTRASEÑA', 'No inicia s.o ', 'Instalación de S.O  sin respaldo de información  w7 64 bits \r\nSSD DE 120 $390 S.O. 350 TOTAL $740\r\n', 'NO TRAJO NOTA RECIBE LAURA ADANELY MENDIOLA GONZALEZ \r\nCON NUMERO DE INE DE 1406135606523', '', 740, 6, '2023-05-22', '2023-05-18', NULL),
(142, 10115, 'ADAN AGUILAR', '4773946504', 60, 'LAPTOP', 'HP', 'CORE I3', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'Sí', 'SIN CONTRASEÑA', 'SE INTENTO CARGAR SISTEMA Y NO SE PUDO, SE SOLICITA CARGAR SISTEMA', '', 'SIN DATOS', '', 350, 6, '2023-05-19', '2023-05-19', NULL),
(143, 10116, 'Miriam Gomez', '4778147562', 64, 'LAPTOP', 'HP', 'CORE I5', '8', '1 tb ', 'SIN DATO', 'SIN DATO ', 'No', 'MIRIAM ', 'EQUIPO LENTO', 'INSTALAR ACTUALIZACIONES Y ACTIVACION', 'FORMATEO SIN RESPALDO $350', '', 350, 6, '0000-00-00', '2023-05-19', NULL),
(144, 10117, 'ADAN AGUILAR', '4773946504', 60, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '1171', '- EQUIPO NO DA IMAGEN\r\n- MENCIONAN QUE SE VA LA IMAGEN Y REGRESA\r\n- SE VEN UNA RAYAS EN LA PANTALLA', 'cambio de pantalla y flex de video', 'NO DA IMAGEN\r\nIMAGENES COMO SE VE EN 477233 8016', '', 3200, 6, '2023-05-29', '2023-05-22', NULL),
(145, 10118, 'IVAN VELAZQUEZ', '4776148030', 60, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', 'NO ARRANA SISTEMA, REVISAR DISCO OCUPA RESPALDO', '- Cambio de disco a 480 gb ssd\r\n- Mantenimiento interno\r\n- Sistema operativo sin respaldo', 'BISAGRA DAÑADA SIN SISTEMA, CARGADOR GENERICO\r\n\r\nENTREGADO EL 25/05/2023 A SERGIO IVAN VELAZQUEZ', '', 1490, 6, '2023-05-29', '2023-05-22', NULL),
(146, 10119, 'LUIS ANGEL CALDERON', '4792641010', 60, 'LAPTOP', 'HP', 'CORE I5', '8', '500', 'SIN DATO', 'WINDOWS 11', 'Sí', 'SIN CONTRASEÑA', 'FALTAN CONTROLADORES NO FUNCIONA VARIAS COSAS', '', '', '', 150, 6, '2023-05-30', '2023-05-23', NULL),
(147, 10120, 'CRISTINA LUNA BECERRA', '4772886954', 60, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'FALLA EN CENTRO DE CARGA, SE SUMIO,', 'SE CAMBIO CABLE DE CORRIENTE, Y SE ACOMODO EL JACK DE CARGA', '', '', 100, 6, '2023-05-30', '2023-05-23', NULL),
(148, 10121, 'ROSALVA RODRIGUEZ', '4773404146', 60, 'LAPTOP', 'DELL', 'CORE I3', '4', '320', 'SIN DATO', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', '- FORMATEO SIN RESPALDO \r\n- AUMENTO DE RAM A 8 GB ', '- FORMATEO SIN RESPALDO $350\r\n- AUMENTO DE RAM A 8 GB $800', '', '', 1150, 6, '2023-05-24', '2023-05-24', NULL),
(149, 10122, 'CARLOS RANGEL', '4778664852', 60, 'CPU', 'ARMADO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'DAÑO DE SISTEMA ', 'FORMATEO SIN RESPALDO', '', '', 350, 6, '2023-06-02', '2023-05-26', NULL),
(150, 10123, 'ANA MARIELA ALBA BARROSO', '4771258719', 60, 'LAPTOP', 'ACER', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'p4nda', 'PRENDE PERO NO DA VIDEO', 'Mantenimiento interno y reparación de que no encendia $550', 'VISAGRA ROTA', '', 550, 6, '2023-06-09', '2023-06-02', NULL),
(151, 10124, 'CECILIA ALVAREZ', '4777762599', 60, 'LAPTOP', 'LENOVO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'NO ENCIENDE', 'SOLO REVISION', 'RAYONES EN CARCASA, FALTA TAPA ABAJO DE PANTALLA, ESQUINA QUEBARADA', '', 100, 6, '2023-06-09', '2023-06-02', NULL),
(152, 10125, 'AGUSTIN NILO GONZALEZ', '4776465066', 60, 'ALL IN ONE', 'APPLE IMAC', 'CORE I5', '8', '1 TB', 'SIN DATO', 'CATALINA', 'No', 'SIN CONTRASEÑA', 'CAMBIO A DISCO SSD\r\n- Refacciones+ instalacion+ s.o+ respaldo+ disco solido de 960 total = $3,190', 'SE ENTREGA EL EQUIPO CON TODO LO MENCIONADO ', 'ENTREGA SOLO EQUIPO', '', 3190, 6, '2023-06-09', '2023-06-02', NULL),
(153, 10126, 'GENERAL MIRIAM LUNA', '4777507474', 60, 'ALL IN ONE', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', 'MANENIMIENTO INTERNO', 'ANTENA Y SERVICIO $450+199+IVA = $752.84', 'SIN DETALLES', '', 752.84, 6, '2023-06-08', '2023-06-03', NULL),
(154, 10127, 'JORGE ERNESTO ARANDA', '4775942443', 60, 'LAPTOP ', 'HP', 'CORE I5', '8', 'SIUN DATO', '256', 'WINDOWS 11', 'Sí', '1270', 'soporte al paqueteria de office y autocad 2018', 'SE INSTALO AUTOCAD Y OFFICE', '', '', 700, 6, '2023-06-12', '2023-06-05', NULL),
(155, 10128, 'LUIS GUTIERREZ', '4771186323', 60, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'NO ENCIENDE', '', '', '', 0, 1, '2023-06-17', '2023-06-10', NULL),
(156, 10129, 'NATALY DE LA ROSA', '4778823241', 60, 'CPU', 'HP', 'AMD', '4', '', '240', 'W10', 'No', 'Avante2210.', 'AUMENTO DE 4 GB DE RAM', '-AUMENTO DE MEMORIA RAM 4GB', '', '', 490, 6, '2023-06-12', '2023-06-10', NULL),
(157, 10130, 'JUAN CONTRERAS', '4775677246', 60, 'LAPTOP', 'LENOVO', 'CORE I7', '8', 'SIN DATO', '500', 'WINDOWS 11', 'Sí', '9551', '- COTIZACION DE PANTALLA LENOVO\r\n- REVISAR PANTALLA Y FLEX DE ACER', 'cambio de pantalla a lenovo, acer no solucion.', '- LAPTOP ACER PANTALLA NO SE VE SI ENCIENDE DA SALIDA DE VIDEO POR LA HDMI.\r\n- ACER QUEBRADA EN ELPLASTICO DE LADO IZQUIERDO, TAPA SUPERIOR RAYADA. (CORE I7-4GRN/16 GB RAM/1 TB HHD)', '', 2400, 6, '2023-06-19', '2023-06-12', NULL),
(158, 10131, 'ANGELA FRAGA', '4773492264', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', '20127', 'NO ENCIENDE, SE CALIENTA', 'SE DRENO ENERGIA Y SE INSTALARON ACTUALIZACIONES.', '', '', 100, 6, '2023-06-13', '2023-06-13', NULL),
(159, 10132, 'ROGELIO JARAMILLO', '4776189988', 60, 'LAPTOP', 'GTO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', 'FORMATEO SIN RESPALDO', 'Formateo sin respaldo', '', '', 350, 6, '2023-06-20', '2023-06-13', NULL),
(160, 10133, 'DAVID BARAJAS ARMONIZACION INTEGRAL', '4773020871', 60, 'CPU', 'HP', 'CORE I5', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'MANTENIMIENTO INTERNO Y DE SISTEMA CON RESPALDO Y CHECAR PUERTO ETHERNET', '', '', '', 350, 6, '2023-06-20', '2023-06-13', NULL),
(161, 10134, 'DANIA GUADALUPE', '4778254104', 60, 'CPU', 'DELL', 'SIN DATO', '', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', '01052019', 'NO ENTRA A SISTEMA', '', '', '', 1439, 6, '2023-06-20', '2023-06-13', NULL),
(162, 10135, 'Fernando López ', '4772068823', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'La olvidaron', 'Se le olvido contraseña, desbloquear', '', '', '', 250, 6, '0000-00-00', '2023-06-16', NULL),
(163, 10136, 'Corona Gonzalez', '4771331145', 60, 'laptop', 'Apple', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '123', 'EQUIPO MOJADO DE LIQUIDO', '', 'EQUIPO ESCURRIENDO LIQUIDO ', '', 350, 6, '2023-06-16', '2023-06-16', NULL),
(164, 10137, 'Nancy Ramirez', '4773167937', 64, 'laptop', 'lenovo', 'Intel core i5', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'Sí', '1974', 'Prende y se apaga.', 'RAM DAÑADA, SE REEMPLAZO RAM DE 8 GB $890 + $100 SERVICIO', '', '', 950, 6, '0000-00-00', '2023-06-17', NULL),
(165, 10138, 'Juan Alberto Sanchez Rosas', '4772176687', 60, 'CPU', 'LENOVO', 'CORE I5', '4', '250', 'NO APLICA', 'sin dato', 'No', 'SIN CONTRASEÑA , SOLO ENTER', 'Mantenimiento interno con cambio de pasta termica', 'Mnatenimiento y cable de displayport a hdmi $350+99', '', '', 449, 6, '0000-00-00', '2023-06-19', NULL),
(166, 10139, 'AZUCENA ORTEGA', '4778605029', 60, 'LAPTOP', 'LENOVO', 'CORE I5', '8 GB', '', '256', 'W10', 'Sí', 'SIN  DATO', 'SE CALENTABA, RUIDO EN VENTILADOR, BAJO BRILLO', 'MANTENIMIENTO', '', '', 350, 6, '2023-06-27', '2023-06-20', NULL),
(167, 10140, 'JESUS VERA', '4771146293', 64, 'LAPTOP', 'HP', 'CORE I3', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '9512187', 'INSTALACION DE PROGRAMA', 'ACTUALIZACION DE PROGRAMA ', '', '', 350, 6, '2023-06-20', '2023-06-20', NULL),
(168, 10141, 'ALEJANDRO HERNANDEZ', '4776293830', 60, 'CPU', 'ARMADO', 'SIN DATO ', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'crocgdl', 'NO ENCIENDE NADA', 'fuente ', 'TAPA NO CIERRA AL 100% POR ANTENA', '', 890, 6, '2023-06-28', '2023-06-21', NULL),
(169, 10142, 'HECTOR RAMIREZ', '4771370857', 60, 'ALL IN ONE', 'HP', 'AMD E1', '4', 'SIN DATO', '120', 'W10', 'Sí', 'SIN  DATO', 'ACTUALIZACION  DE OFFICE Y QUITAR ANTIVIRUS', '', '', '', 350, 6, '2023-06-29', '2023-06-22', NULL),
(170, 10143, 'ALFREDO ESCOBAR ', '4778463596', 60, 'LAPTOP', 'DELL', 'CORE I3', '4', '320', '', 'w10', 'Sí', 'auditore123', '- Cambio a disco ssd de 480 gb  $590\r\n- sistema Operativo sin respaldo $ 350\r\n- 8 gb mas de memoria ram  $980\r\n- Cargador para el equipo $490 \r\ntotal $2,030', '', 'cargador con detalle.', '', 2410, 6, '2023-06-30', '2023-06-24', NULL),
(171, 10144, 'DIANA ALVARADO', '4771061024', 60, 'LAPTOP', 'HP', 'AMD RYZEN 5', '8', '500', 'SIN DATO', 'WIN 11', 'Sí', '197519', 'ACTUALIZACION DE OFFICE', '', '', '', 350, 6, '2023-06-26', '2023-06-26', NULL),
(172, 10145, 'OSVALDO CERVANTES', '4778056560', 64, 'LAPTOP', 'HP', 'AMD RADION VEGA', '8', '1 TB', 'SIN DATO', 'WIN 10', 'Sí', '1711', '- REVISAR BATERIA\r\n-REVISAR CLICK DE TOUCHA\r\n- REVISAR VENTILADOR', '- Mantenimiento $490\r\n- Batería nueva $990 ', 'BATERIA INFLADA Y PARTE DE TOUCH PAD QUEBRADA \r\nNUMERO DE TITULAR 4778146761 MAMA 4778056560', '', 1480, 6, '2023-07-03', '2023-06-26', NULL),
(173, 10146, 'Ma. Alejandra Hermosillo', '4772231127', 64, 'LAPTOP', 'HP', 'core i5', '4', 'sin dato', 'sin dato', 'sin dato', 'Sí', 'sin dato ', 'No inicia Sistema operativo. ', 'cambio ssd 480 gb $590\r\ns.o+ respaldo $500\r\npila bios $150', '', '', 1140, 6, '0000-00-00', '2023-06-28', NULL),
(174, 10147, 'ISSER  JORDAN MONARREZ VARGAS', '4777923259', 60, 'LAPTOP', 'HP', 'AMD RYZEN 3', '12', '1 TB', '120 ', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', ' ACTUALIZACION DE PROGRAMAS OFFICE, AUTOCAD', 'SE ACTUALIZARON', '', '', 500, 6, '2023-07-06', '2023-06-29', NULL),
(175, 10148, 'Alejandro Gonzalez', '4772436278', 60, 'LAPTOP', 'ASUS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'NO ENCIENDE NADA NI LOS LED', 'SE DRENO ENERGIA Y SE APLICARON ACTUALIZACIONES', '', '', 250, 6, '2023-07-06', '2023-06-29', NULL),
(176, 10149, 'LORENA VILLANUEVA', '4771274293', 60, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'NO ENCIENDE', 'CARGADOR SE REMPLAZA', 'ABIERTAS EN LAS ESQUINAS', '', 550, 6, '2023-07-07', '2023-06-30', NULL),
(177, 10150, 'DON CHAVA SALVADOR', '4771051305', 0, 'CPU', 'DELL', 'CORE I7', '8', '480', '', 'WIN 7', 'No', 'SIN CONTRASEÑA', 'CAMBIO A SSD', '- MANTENIMIENTO INTERNO $350\r\n- DISCO SOLIDO DE 480 GB SSD $590\r\n- SISTEMA CON RESPALDO $350\r\n- CASE PARA DISCO SATA $149  TOTAL $1,439', '', '', 1439, 6, '2023-06-30', '2023-06-30', NULL),
(178, 10151, 'ISAI CLETO', '4791462634', 60, 'LAPTOP', 'HP', 'CORE I5', '4', '160', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', 'FORMATEO SIN RESPALDO', '', 'DISCO CON DAÑO ANALIZADO AUN ASI SE CARGA SISTEMA OPERATIVO', '', 350, 6, '2023-07-08', '2023-07-01', NULL),
(179, 10152, 'SUGEY PRECIADO MENDEZ', '4776960591', 60, 'LAPTOP', 'DELL XPS', 'CORE 2 DUO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN 7', 'Sí', 'SIN CONTRASEÑA', 'NO INICIA SISTEMA', 'FORMATEO SIN RESPALDO ', 'LA TAPA DEL DISCO NO CUENTA CON TAPA ', '', 350, 6, '2023-07-08', '2023-07-01', NULL),
(180, 10153, 'Valeria Martinez', '4775349148', 64, 'LAPTOP', 'lenovo', 'core i5', '8', '500', 'SIN DATO', 'w10', 'No', 'SIN CONTRASEÑA', 'LENOVO GRIS: DISCO DURO DAÑADO  \r\nLENOVO BLANCA NO INICIA SISTEMA-CONTRASEÑA: ValeriaMartinez05', 'BLANCA: INSTALAR S.O Y REVISAR SI DISCO ESTA EN BUEN ESTADO SIN RESPALDO\r\nLENOVO GRIS: PENDIENTE DE CONFIRMAR\r\nSOLUCION:\r\n- 2 SOLIDOS 480 GB DE $590X2\r\n- 2 FORMATEOS SIN RESPALDO $350X2', 'LENOVO GRIS: FALTA TECLA ALT \r\nLENOVO BLANCA: PANTALLA ESTRELLADA', '', 1880, 6, '0000-00-00', '2023-07-03', NULL),
(181, 10154, 'EDUARDO CHACON', '4791531615', 64, 'LAPTOP', 'TOSHIBA', 'CORE I7', '8', 'SIN DATO', '960', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'TECLADO REVISAR REPARACION, TECLAS SUELTAS', 'SE ACOMODARON LAS TECLAS, TODO OK ', '', '', 150, 6, '2023-07-11', '2023-07-04', NULL),
(182, 10155, 'SONIA URBANO', '4772842612', 64, 'LAPTOP', 'DELL', 'CORE I5', '8', '1 TB', 'SIN DATO', 'WIN 11', 'No', '9283', '- FORMATEO CON RESPALDO $500\r\n- + DISCO SSD SATA DE 960 GB $1,000', '', '', '', 1500, 6, '2023-07-11', '2023-07-04', NULL),
(183, 10156, 'Tania Zarato', '4776762813', 60, 'LAPTOP', 'DELL', 'CORE I7', '4', '500', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'ACTUALIZACION DEL OFFICE', '', '', '', 350, 6, '2023-07-05', '2023-07-05', NULL),
(184, 10157, 'Jose Alfredo Nicasio Segoviano', '4773551539', 64, 'CPU', 'DELL', 'SIN DATO', 'SIN DATO', 'sin dato', 'SIN DATO', 'sin dato', 'No', 'SIN CONTRASEÑA', 'No prende, el botón de encendido prende en color naranja', '-CAMBIO DE FUENTE $850\r\n- MANTENIMIENTO$350', '', '', 1200, 6, '2023-07-11', '2023-07-05', NULL),
(185, 10158, 'MARIANA ONTIVEROS', '4773780409', 60, 'LAPTOP', 'LENOVO', 'CORE 2 DUO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'NO INICIA SISTEMA', '- REINSTALACION DE SISTEMA SIN REPALDO\r\n- \r\n', '', '', 350, 6, '2023-07-13', '2023-07-13', NULL),
(186, 10159, 'Roberto Gomez', '4773158553', 64, 'LAPTOP', 'DELL', 'AMD RYZEN 5', '16', '1 TB', '256', 'WIN 11', 'Sí', 'chivas1908', '-ACTUALIZACION DE OFFICES', '', '', '', 350, 6, '2023-07-14', '2023-07-07', NULL);
INSERT INTO `servicios` (`id`, `folio`, `cliente`, `telefono`, `id_empleado`, `equipo`, `marca`, `procesador`, `ram`, `dd`, `ssd`, `so`, `cargador`, `contrasena`, `falla`, `solucion`, `obs`, `tipo_servicio`, `total`, `estatus`, `fecha_entrega`, `fecha_llegada`, `id_caja`) VALUES
(187, 10160, 'ANA DIAZ GONZALEZ', '4791436875', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'gabyrenovada', 'SISTEMA DAÑADO\r\nEQUIPO SE CAYO', 'VENDER EL CARGADOR HP ORIGINAL 490 ', '-DISCO SOLIDO DE 960 GB $1000\r\n- SISTEMA OPERATIVO MAS REPALDO $500\r\n- CARGADOR  DEHP PUNTA AZUL $490', '', 1990, 6, '2023-07-17', '2023-07-10', NULL),
(188, 10161, 'SAUL MIRANDA', '4777304395', 60, 'LAPTOP ', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'sin dato ', '- EQUIPO MOJADO', '-MANTENIMIENTO INTERNO PROFUNDO', '', '', 490, 6, '2023-07-17', '2023-07-10', NULL),
(189, 10162, 'MARIO ESQUIVEL', '4771201243', 60, 'CPU', 'COMPAQ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'LED ENCIENDE EN NARANJA ', '- CASE EXTERNO  XMEDIA $329\r\n-  SOPLETEO $50', 'SIN TAPA LATERAL', '', 379, 6, '2023-07-19', '2023-07-12', NULL),
(190, 10163, 'JOB DE JESUS MENDOZA', '7445310155', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'Macross_992O', '-NO ENCIENDE', '', '', '', 0, 1, '0000-00-00', '2023-07-14', NULL),
(191, 10164, 'Alejandro Ibarra Gomez', '4792641212', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-SISTEMA OPERATIVO MUY LENTO \r\n', '-Revisar sistema y disco duro\r\n-revisar batería \r\n-No ocupa respaldo de información.', '', '', 1340, 6, '2023-07-17', '2023-07-17', NULL),
(192, 10165, 'ROGELIO OLEA', '4772505200', 60, 'LAPTOP', 'HP', 'PENTIUM', '8', '1 TB', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-EQUIPO LENTO\r\n- FORMATEO ', 'FORMATEO Y RESPALDO $580 CON FACTURA', '- CLICK DERECHO SE SIENTE DURO', '', 580, 6, '2023-07-24', '2023-07-17', NULL),
(193, 10166, 'Gabriela Alvarez', '4777521369', 60, 'CPU', 'ARMADO', 'AMD RYZEN 5', '16', 'SIN DATO', '500', 'WIND 10', 'No', '2085', '- SE ESCUECHA RUIDO AL TRABAJARLA\r\n-SE SOBRECALIENTA COMO A LAS 2 HORAS Y SUENA EL VENTILADOR', '- MANTENIMIENTO Y INSTALACION DE SISTEMA', 'SIN DETALLE', '', 700, 6, '2023-07-24', '2023-07-17', NULL),
(194, 10167, 'Raymundo Gaona', '4774310481', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'No da video', '', '', '', 0, 1, '0000-00-00', '2023-07-19', NULL),
(195, 10168, 'Vanessa Barrera', '5535203775', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'No prende\r\n- derrame de liquido el equipo estaba prendido cuando sucedio (con agua)', '- LIMPIEZA PROFUNDA POR DAÑO LIQUIDO', '', '', 490, 6, '0000-00-00', '2023-07-19', NULL),
(196, 10169, 'Gabriela Alvarez', '4777521369', 60, 'ALL IN ONE', 'HP', 'CORE I3', '6', 'SIN DATO', '120', 'WIN 10', 'No', 'SIN CONTRASEÑA', '-FORMATEO CON RESPALDO', 'FORMATEO CON RESPALDO', '', '', 500, 6, '2023-07-26', '2023-07-19', NULL),
(197, 10170, 'JESUS SILVA RODRIGUEZ', '4491037193', 64, 'CPU', 'DELL', 'C2D', '4', '160', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-OFFICE DESACTIVADO\r\n-PANTALLA AZUL CON CARA TRISTE', '- Mantenimiento interno\r\n- Respaldo de Informacion', '', '', 500, 6, '2023-07-28', '2023-07-21', NULL),
(198, 10171, 'DANIEL RANGEL', '4774750903', 60, 'LAPTOP', 'HP LENOVO', 'RYZEN 2 CORE I7', '4', 'SIN DATO', '256', 'WIN 11', 'No', 'GALINDO', '- HP ACTIVAR OFFICE, LENTITUD, REVISAR BATERIA, ERROR DE BATERIA\r\n- LENOVO AZUL FORMATEO SIN RESPALDO COTIZAR CARGADOR', '-cargador Lenovo gen $490\r\n-cargador 45w hp punta azul $490\r\n- s.o $350\r\n-mant $350', 'HP SIN GOMAS ABAJO', '', 1680, 6, '2023-07-28', '2023-07-21', NULL),
(199, 10172, 'Juan Antonio Galvan ', '4773012405', 64, 'LAPTOP', 'HP', 'i5 primera', '8', 'no', '240', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- revisar wifi se desconecto\r\n-Actualizaciones update\r\n-se calienta y se apaga 25 min ', '-Mantenimiento Físico. $350\r\n- Actualizaciones $50\r\n', '', '', 400, 6, '2023-07-25', '2023-07-22', NULL),
(200, 10173, 'HECTOR ANDRES CALVILLO', '4776769172', 60, 'LAPTOP', 'SONY', 'CORE I5', '4', 'SIN DATO', '111', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- FORMATEO CON RESPALDO\r\n- REVISAR SI CAMARA AGARRA Y QUE EL TECLADO SE LE CAMBIA', '- FORMATEO CON RESPALDO', 'NO DETECTA EL CLIK DERECHO ', '', 500, 6, '2023-07-31', '2023-07-24', NULL),
(201, 10174, 'EDGAR URZUA DIAZ', '5518028775', 60, 'ALL IN ONE', 'LENOVO', 'INTEL CORE I3', '8', '430', 'SIN DATO', 'WIND 11', 'Sí', 'SIN CONTRASEÑA', '- CAMBIO A DISCO SOLIDO SSD\r\n- CLIENTE TRAE DISCO \r\n- SISTEMA OPERATIVO + RESPALDO', '-RESPALDO\r\n-SISTEMA OPERATIVO\r\n-INSTALACION DE DISCO (DISCO EL CLIENTE LO TRAIA)', '', '', 600, 6, '2023-08-03', '2023-07-25', NULL),
(202, 10175, 'Rafael Sanchez', '4771410956', 64, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'sin dato', '-Contraseña de admin para acceder al equipo', '-desbloqueo de bios $1,000\r\n-ssd 480 gb $590\r\n-pila bios $100\r\n-s.o $350', '- ya se había llevado a revisar a otros técnicos (4 o 5 lugares) ', '', 2040, 6, '2023-07-28', '2023-07-25', NULL),
(203, 10176, 'FERNANDO GARCIA CEBALLOS', '4772010435', 60, 'LAPTOP', 'HONOR', 'RYZEN 5', '16', '367', '120', 'WIN 11', 'No', '13521352', '-ACTUALIZAIONES DE MICROSOFT', '-PAQUETERIA DE OFFICE INTALADA', '', '', 250, 6, '2023-07-26', '2023-07-26', NULL),
(204, 10177, 'Roberto Rizo', '4772818408', 60, 'LAPTOP', 'HP', 'CORE I3', '4', 'SIN DATO', '480', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- REVISAR LENTITUD\r\n-COTIZAR BATERIA', '- SE AGREGO MEMORIA RAM DE 4 GB $890\r\n- SERVICIO INSTALACION $150', '- PANTALLA DAÑADA', '', 1040, 6, '2023-08-02', '2023-07-26', NULL),
(205, 10178, 'AGUSTIN NILO', '4776465066', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', '040597la', '- ENCIENDE PERO NO DA IMAGEN\r\n', 'Solo Revision', '-PANTALLA ESTRELLADA\r\n', '', 100, 6, '2023-08-02', '2023-07-26', NULL),
(206, 10179, 'JUAN JOSE MARES CARPIO', '4771138712', 60, 'LAPTOP', 'GATEWAY', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO DETECTA EL WIFI', '', '-REJILLA DE VENTILACION ROTA', '', 0, 6, '2023-07-27', '2023-07-27', NULL),
(207, 10180, 'Aurora Flores', '4775774725', 64, 'LAPTOP', 'SONY', 'CORE I3', '6', '500', 'SIN DATO', 'WINDO 10 ', 'Sí', 'SIN CONTRASEÑA', '- CHECAR ACTUALIZACIONES', '-FORMATEO CON RESPALDO', '- BATERIA NO RETIENE\r\n', '', 500, 6, '2023-08-03', '2023-07-27', NULL),
(208, 10181, 'RICARDO GUTIERREZ', '4776542654', 64, 'LAPTOP ', 'DELL', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-SE COTIZA CARGADOR', '', '-DETECTA CARGADOR QUE NO TIENE LA SUFIENTE ENERGIA, CONSEGUIR UNO DE 90 WHATS EL DE 65 NO LE FUNCIONA', '', 0, 6, '2023-08-03', '2023-07-27', NULL),
(209, 10182, 'HERNAN ARON OLIVO MENDOZA', '4771234098', 64, 'LAPTOP', 'LENOVO', 'RYZEN 3', '8', '1', 'SIN DATO', 'WINDO 10 ', 'Sí', 'si tiene no tiene el dato', 'FORMATEO DEL EQUIPO', 'FORMATEO  SIN RESPALDO', 'SIN DETALLES', '', 350, 6, '0000-00-00', '2023-07-29', NULL),
(210, 10183, 'Dayra Estefany Urtado Lara', '4774658384', 64, 'cpu', 'hp', 'corei7', '8', '500', '', 'WINDO 10 ', 'No', 'SIN CONTRASEÑA', '-Disco duro dañado', 'CAMBIO A DISCO SOLIDO 480 GB  $590\r\nS.O $350', 'DISCO DAÑADO', '', 940, 6, '0000-00-00', '2023-07-29', NULL),
(211, 10184, 'LOURES DUARTE', '4721475766', 64, 'CPU', 'HP', 'CORE I3', '4', '320', 'SIN DATO', 'WINDO 10 ', 'No', 'SIN CONTRASEÑA', '- PUERTOS FRONTALES DESCONECTADOS\r\n- VENTILADOR DE FUENTE DE PODER\r\n-CLIENTE INDICA NO DA VIDEO ', '-LIMPIEZA SIN CAMBIO DE PASTA\r\n-SE CONECTAN VENTILADORES USB Y FUENTE', 'FRANJA PLATEADA ROTA', '', 350, 6, '2023-08-05', '2023-07-29', NULL),
(212, 10185, 'ADRIANA MARTINEZ', '4775803608', 60, 'LAPTOP ', 'LENOVO', 'CORE I5', '8', 'SIN DATO', '480', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO', '- MANTENIMIENTO INTERNO', '- FALTA TECLA ALT\r\n- NO GOMITA DE TRANSPOIN ', '', 350, 6, '2023-08-07', '2023-07-31', NULL),
(213, 10186, 'Cristian Michell Contreras', '4774663243', 60, 'LAPTOP', 'DELL', 'CORE I3', '1', '160', 'SIN DATO', 'WIN 7', 'Sí', 'SIN CONTRASEÑA', '-MANTENIMIENTO INTERNO', '-MANTENIMIENTO INTERNO', '-despostillada  en la esquina\r\n- plastico en la camara\r\n- Se mojo el teclado', '', 350, 6, '2023-08-03', '2023-07-31', NULL),
(214, 10187, 'JUAN MANUEL MARTINEZ', '4772946469', 64, 'LAPTOP', 'ASUS', 'CORE I5', '8', '1 TB', '120', 'WIN 11', 'Sí', '0011', '- NO DETECTA CARGADOR', '-SE CONSIGUE CARGADOR TODO OK', '- SE VE QUE ABRIERON EL EQUIPO', '', 490, 6, '2023-08-07', '2023-07-31', NULL),
(215, 10188, 'SILVIA CHARLES', '4776496944', 64, 'ALL IN ONE', 'HP', 'CORE 2 DUO', '8', '1 TB', 'SIN DATO', 'WIN 10', 'Sí', '9636 9654', '- CONFIGURACION DE ANTENA WIFI\r\n- ACTUALIZACION CON RESPALDO', '-FORMATEO Y RESPALDO', '', '', 500, 6, '2023-08-08', '2023-08-01', NULL),
(216, 10189, 'FRANCISCO JAVIER PEREZ', '4775806945', 64, 'CPU', 'ARMADO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-NO DA IMAGEN', '-MANTENIMIENTO INTERNO', '-NO TIENE TAPA LATERAR\r\n- TARJETA GRAFICA CON MANCHA DE LIQUIDO\r\n4778989818 CON CRISTO', '', 490, 6, '2023-08-01', '2023-08-01', NULL),
(217, 10190, 'JOISES ROMERO', '4772411161', 64, 'CPU', 'DELL', 'CORE 2 DUO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO ENCIENDE\r\n- POSIBLEMENTE EN FUENTE DE DAÑO DE PODER', '- Se pego plástico para atornillar bisagra', '- HUBO BAJON DE LUZ', '', 250, 6, '2023-08-08', '2023-08-01', NULL),
(218, 10191, 'MARIBEL ORTIZ GONZALES ', '4425922957', 64, 'LAPTOP', 'HP ACER ', 'AMDA8 ', '6 GB ', 'SIN DATO', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'HP FORMATEO SIN RESPALDO WIN10\r\nACER REVISAR VISAGRA ', '', 'HP TODO BIEN \r\nACER PANTALLA ESTRELLADA \r\n-ENTREGA DOS EQUIPOS', '', 350, 6, '2023-08-08', '2023-08-01', NULL),
(219, 10192, 'ADRIANA MARTINEZ', '4775803608', 64, 'LAPTOP', 'LENOVO', 'PENTIUM', 'SIN DATOS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO', '', '- PANTALLA ESTA ESTRELLADA', '', 350, 6, '2023-08-09', '2023-08-02', NULL),
(220, 10193, 'ALEX FERNANDO SAVEDRA', '7711293884', 64, 'CPU', 'ARMADO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO DA VIDEO', 'LIMPIEZA BASICA ', '', '', 150, 6, '2023-08-09', '2023-08-02', NULL),
(221, 10194, 'Ulises Alarcon', '4778481825', 64, 'LAPTOP', 'LENOVO', 'CORE I5', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '681030', 'Prende no da imagen', '- SE CONECTO LA PANTALLA NUEVAMENTE Y SE TESTEO', 'Dé repente cuando prende se ve y se va la imagen ', '', 200, 6, '0000-00-00', '2023-08-02', NULL),
(222, 10195, 'Miriam Godínez Ramírez', '3310000892', 64, 'LAPTOP', 'DELL', 'CORE I5', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', 'Realizar mantenimiento Interno. ', '- MANTENIMIENTO INTERNO', '', '', 350, 6, '2023-08-08', '2023-08-02', NULL),
(223, 10196, 'DANIEL VERMUDEZ', '4772063278', 64, 'LAPTOP', 'DELL', 'RAYZEN 5', '8', 'SIN DATO', '240', 'WIN 10', 'Sí', '051216', '- INSTALACION DE 8 GB $890\r\n- DISCO SOLIDO 960 GB SSD $990\r\n- SISTEMA OPERATIVO + RESPALDO $500\r\n- MANTENIMIENTO INTERNO $350\r\n- MAS FACTURA +IVA  \r\n- TOTAL $3166.80', '', '', '', 3166, 6, '2023-08-10', '2023-08-03', NULL),
(224, 10197, 'ROBERTO RIZO', '4772818408', 60, 'CPU', 'ASUS', 'CORE I3', 'SIN DATOS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA ', '- NO ENCIENDE', '- CAMBIO DE FUENTE $329\r\n- INSTALACION $100', '-CINTA EN LA TAPA SUPERIOR\r\n- SE LES FUE LA LUZ Y NO ENCENDIO', '', 429, 6, '2023-08-10', '2023-08-03', NULL),
(225, 10198, 'JUAN MANUEL MORALES', '4775916301', 60, 'LAPTOP', 'LENOVO', 'CORE i5-2da', '8', 'SIN DATO', 'SIN DATO', '', 'Sí', 'SIN CONTRASEÑA ', '-NO INICIA SISTEMA ', '- SOLO REVISION DISCO DAÑADO', '-VENTILA ROTA Y ESQUINAS ', '', 100, 6, '2023-08-08', '2023-08-03', NULL),
(226, 10199, 'CAROLINA FRANCO DURAN', '4776481420', 60, 'LAPTOP', 'LENOVO', 'CORE I7', '8', 'SIN DATO', '240', 'WIN 10', 'Sí', 'Moises0404', '- FORMATEO SIN RESPALDO\r\n-FALLA DE TECLADO', '', '', '', 0, 6, '2023-08-12', '2023-08-05', NULL),
(227, 10200, 'Jose Gutierrez', '0', 64, 'CPU', 'hp', 'sin dato', 'SIN DATOS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA ', 'Prende y no da video.', '- CAMBIO DE PLACA MADRE ', '', '', 1700, 6, '2023-08-17', '2023-08-07', NULL),
(228, 10201, 'Rogelio Sanchez ', '4776746295', 64, 'CPU', 'hp', 'sin dato', 'SIN DATOS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA ', 'No enciende el cpu, se fue la luz  mientras llovia y ya no inicio. ', '-cambio de tarjeta madre $1,750\r\n- memoria ram de 4 gb $490 \r\n-Total $2,240', '', '', 2240, 6, '2023-08-08', '2023-08-08', NULL),
(229, 10202, 'AMERICA ORNELAS MARTINEZ', '4773167104', 60, 'LAPTOP', 'HP', 'CORE I5', '4', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- NO INICIA SISTEMA OPERATIVO\r\n- NO DETECTA EL DISCO', '-DISCO SOLIDO 240 GB\r\n- MANTENIMIENTO Y SISTEMA OPERATIVO', '- BATERIA NO FUNCIONA\r\n- INCLUYE UN PENCIL', '', 1190, 6, '2023-08-16', '2023-08-09', NULL),
(230, 10203, 'JORGE LEON ', '4777021581', 60, 'CPU', 'DELL', 'CORE I5', '6', '1 TB', '', 'WIN 7', 'No', 'SIN CONTRASEÑA', 'SE TRAJO POR QUE NO PRENDIA EL EQUIPO Y CUANDO LO TRAJO SI ENCENDIO ', '- MANTENIMIENTO INTERNO', 'ABOYADURA EN PARTE TRASERA', '', 350, 6, '2023-08-17', '2023-08-16', NULL),
(231, 10204, 'ABRAHAM ACEVEDO', '4772876503', 60, 'LAPTOP ', 'COMPAQ', 'AMD', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- NO DA IMAGEN ENCIENDE EL EQUIPO', '- Recalentado de chip de video ', '- NO ENCIENDE LED DE DISCO DURO\r\n- SIN BATERIA', '', 500, 6, '2023-08-23', '2023-08-16', NULL),
(232, 10205, 'HECTOR RAMIREZ', '4772801567', 60, 'LAPTOP', 'HP', 'AMD A9', '12', '1 TERA', 'SIN DATO', 'WIN 10', 'Sí', '1985', '- FORMATEO A WINDOWS 11 SIN RESPALDO', '-formateo sin respaldo $350', '', '', 350, 6, '2023-08-24', '2023-08-17', NULL),
(233, 10206, 'Corona Gonzalez', '4771331145', 60, 'ALL IN ONE', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '- NO DETECTA DISCO ', '', '', '', 0, 6, '2023-08-25', '2023-08-18', NULL),
(234, 10207, 'SAUL MIRANDA', '4777304395', 60, 'ALL IN ONE', 'LENOVO', 'AMD ANTHLON SILVER', '4', '1 TERA', 'SIN DATO', 'SIN DATO', 'Sí', '2023', '-CAMBIO DE DISCO DE 480 GB SSD $490\r\n- SISTEMA OPERATIVO WINDOWS 11 SIN RESPALDO SIN OFFICE $350\r\n- AUMENTO DE RAM  UN MODULO DE 8 GB $890\r\n- TOTAL $1,730+IVA $2,006.80 ', '', '- CINTA CON CARGADOR', '', 2180.8, 6, '2023-08-25', '2023-08-18', NULL),
(235, 10208, 'LUIS AMEZQUITA', '4777230018', 60, 'LAPTOP', 'LENOVO T460S', 'CORE I5', '8', 'SIN DATO', '256', 'WIN 11', 'No', '1803', '-REPARACION DE VISAGRA', '-REPARACION DE VISAGRA', '-CABLES DE WIFI MORDIDOS', '', 1000, 6, '2023-08-26', '2023-08-19', NULL),
(236, 10209, 'FATIMA CARDONA', '4776470158', 60, 'LAPTOP', 'ACER', 'AMD ATHOL', '3', '100', 'SIN DATO', 'WIND 7', 'Sí', 'SIN CONTRASEÑA', '- PANTALLA DAÑADA COTIZAR', '- CAMBIO DE PANTALLA $1,500', 'CARGADOR CON CINTA', '', 1500, 6, '2023-08-26', '2023-08-19', NULL),
(237, 10210, 'DIEGO SANCHEZ', '4771189160', 60, 'LAPTOP', 'DELL G3', 'CORE I5', '8', 'SIN DATO', '240', 'WIN 11', 'Sí', 'Reggae.2025', '- PANTALLAS AZUL REVISAR MOTIVO\r\nCLIENTE DICE QUE DESDE ANTES DE INSTALAR UN PROGRAMAS CODEBLOGS LE DABA MUCHO LA PANTALLA AZUL', 'NO SE LLEVO ACABO EL SERVICIO', '- BASE TRASERA FALTANTE\r\n- GOMAS DE BASE TRASERA', '', 0, 6, '2023-08-26', '2023-08-19', NULL),
(238, 10211, 'Cristina Molina Palma ', '4779164505', 60, 'LAPTOP', 'MacBook', 'CORE I5', '8', '', '120', 'High Sierra', 'Sí', '0', 'Revisar Teclado, teclas fallan ', '-cambio de teclado', 'Ninguna ', '', 700, 6, '2023-10-09', '2023-08-21', NULL),
(239, 10212, 'Imelda Sifuente Gomez', '4778051904', 64, 'laptop ', 'hp', 'core i5', '6', 'sin dato', 'sin dato', 'sin dato', 'Sí', 'sin dato', '-formateo sin respaldo $350\r\n-disco 480GB SSD $590\r\n-bateria nueva $750\r\n\r\n-$1690', 'se realizaron los cambios ', '', '', 1690, 6, '2023-08-23', '2023-08-23', NULL),
(240, 10213, 'Karen Rodriguez', '4791174496', 64, 'CPU', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-No prende, revisar si se podría recuperar el equipo\r\n-Respaldo de información \r\n-Revisar respaldo de el programa VIGAZAP', 'MANTENIMIENTO INTERNO Y CAMBIO DE PILA BIOS.', '', '', 400, 6, '0000-00-00', '2023-08-25', NULL),
(241, 10214, 'Jonathan Ramirez', '4792651451', 64, 'Laptop', 'Asus, Lenovo', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'lenovo: Jony2323 asus: Crox2022', '-Asus: Se conecto un cargador dañado y creo corto, ya no prende.\r\n-Lenovo: No prende. ', '-Cambio de mosfet y capacitadores \r\n-Con factura ', 'Lenovo: Golpe en esquina, falta un tornillo, el cargador trae cinta.\r\nAsus: Sin detalles. ', '', 1856, 6, '0000-00-00', '2023-08-25', NULL),
(242, 10215, 'Manuel Alejandro Alvarez ', '4621098985', 64, 'CPU', 'DELL', 'Core 2duo', 'SIN DATO', '250', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-No inicia SO\r\n-Posible daño en el DD por falta de mantenimiento. \r\n-Ocupa respaldo de informacion ', '- DISCO SSD 480 GB $490\r\n- MANTENIMIENTO $350\r\n- ACTUALIZACION CON RESPALDO $500\r\n- MOUSE ALAMBRICO $79', '', '', 1419, 6, '2023-08-29', '2023-08-25', NULL),
(243, 10216, 'LIBIA SAHARA MORENO IBARRA', '4778658628', 64, 'LAPTOP', 'FUJITSU', 'CORE I5', '6', '250', 'SIN DATO', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', '- DEJA EL EQUIPO PARA TESTEAR BATERIA QUE SE SOLICITO', '', '', '', 0, 6, '2023-08-25', '2023-08-25', NULL),
(244, 10217, 'Ana lilia Gutierrez', '4775019430', 64, 'Laptop', 'hp', 'SIN DATO', 'SIN DATO', '500', '', 'WINDOWS 8', 'Sí', '18kybalion', 'Revisar lector de discos ', '-INSTALACION DE REPRODUCTOR', '', '', 150, 6, '2023-08-28', '2023-08-25', NULL),
(245, 10218, 'Juan Rangel ', '4771348204', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '8', '1000', 'SIN DATO', 'WINDOWS 10', 'Sí', '2305', 'Instalación de Disco solido 480 Gb $490\r\ninstalación $100\r\nS.O $350 Pendiente de confirmar Respaldo', 'Instalación de Disco solido 480 Gb $490\r\ninstalación $100\r\nS.O $350 Pendiente de confirmar Respaldo\r\nTODO OK ', '', '', 940, 6, '2023-08-31', '2023-08-25', NULL),
(246, 10219, 'ANGELO MARTINEZ', '4776860446', 64, 'LAPTOP', 'HP', 'CELERON', '4', 'SIN DATO', '240', 'WINDOWS 11', 'No', '270520', 'ACTUALIZACION DE SISTEMA', '', '', '', 350, 6, '2023-08-26', '2023-08-26', NULL),
(247, 10220, 'OSCAR ABRHAM ARCOS OROZCO', '4773695744', 62, 'LAPTOP', 'MACBOOK PRO 15', 'CORE I5', '8', 'SIN DATO', '128', 'HIGH SIERRA', 'Sí', 'qwerty', '- ACTUALIZACION DE SISTEMA\r\n- INSTALACION DE OFFICE', '- ACTUALIZACION DE SISTEMA\r\n- INSTALACION DE OFFICE *****TODO OK ****', '- CARGADOR GENERICO\r\n- NO LLAMAR WHATS SOLAMENTE', '', 590, 6, '2023-08-28', '2023-08-28', NULL),
(248, 10221, 'Victor Mendez', '4772173447', 64, 'LAPTOP', 'HP', 'INTEL PENTIUM ', '4', '1TB', '', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', '-Cambio de disco SSD 240 $390\r\n-Instalación disco $100\r\n-SO $350', '-Cambio de disco SSD 240 $390\r\n-Instalación disco $100\r\n-SO $350', 'SIN DETALLES', '', 840, 6, '2023-08-30', '2023-08-28', NULL),
(249, 10222, 'OFELIA RAMIREZ', '4777095508', 64, 'CPU', 'HP', 'PENTIUM DUAL', '2', '320', 'SIN DATO', 'WIND 7', 'No', 'SIN CONTRASEÑA', '- CAMBIO DE DISCO 160 GB HHD $100\r\n- SISTEMA OPERATIVO WINDOWS 7 $350\r\n- MANTENIMIENTO $350\r\n- PILA BIOS $50', '- CAMBIO DE DISCO 160 GB HHD $100\r\n- SISTEMA OPERATIVO WINDOWS 7 $350\r\n- MANTENIMIENTO $350\r\n- PILA BIOS $50\r\nTODO OK', '- DISCO DURO DAÑADO\r\n- MUCHO POLVO', '', 850, 6, '2023-09-05', '2023-08-29', NULL),
(250, 10223, 'FERNANDO TORRES', '4778138490', 64, 'LAPTOP', 'HP', 'AMD A10', '12', '1 TB', '', 'WIND 10', 'Sí', '980304', '- MENSAJE DE FALLA DE VENTILADOR\r\n-REVISAR LA LENTITUD\r\n- REVISAR A CAMBIO DE RAM A 16 GB ', '- Mantenimiento al Ventilador', '', '', 2501, 6, '2023-09-02', '2023-08-29', NULL),
(251, 10224, 'MOTO MAX', '4774951729', 60, 'CPU', 'HP/ DELL', 'CORE I7/ CORE 2 DUO', '4/ 4', '250/160', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- CAMBIO A DISO SOLIDO 480 HP/ CAMBIO A 240 DELL $880\r\n- SISTEMAS OPERATIVOS SIN RESPALDO$700\r\n- CAMBIO DE RAM 4 GB A LA HP $490\r\n- MANTENIMIENTO PARA LA DELL $350', '- COSTO DE HP $1,330\r\n- COSTO DE DELL $1090\r\n- TOTAL DE $2,420', '- CPU DEL CUENTA CON POLVO ', '', 2420, 6, '2023-09-12', '2023-08-30', NULL),
(252, 10225, 'Silvia Charles ', '4776496944', 64, 'AIO', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'No inicia S.O', 'Instalación de SSD 960 GB $990\r\nS.O W10 $350', 'Cotizar Case para HDD 3.5\"', '', 1340, 6, '2023-09-01', '2023-08-30', NULL),
(253, 10226, 'Jose de Jesus Ortiz', '4776500560', 60, 'CPU', 'DELL', 'CORE I5', '4', '250', '', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-No inicia sistema operativo', '- SE REPARO EL SISTEMA OPERATIVO', 'SIN DATELLES', '', 250, 6, '2023-09-05', '2023-09-01', NULL),
(254, 10227, 'Jonathan Ramirez', '4792651451', 64, 'LAPTOP', 'HP', 'CORE I3', '8', 'SIN DATO', '256', 'WIN 11', 'Sí', '33540470', '-Pantalla parpadea', '- SOLO REVISION', '-Goma de tapa esta partida\r\n-Rayones en tapa superior', '', 100, 6, '2023-10-11', '2023-09-01', NULL),
(255, 10228, 'Manuel Canchola ', '4721379274', 64, 'CPU', 'ARMADA', 'AMD RYZEN 5', '32', 'SIN DATO', '500', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-Revisar por calentamiento (en trabajo pesado aprox 10 min, prende y entra a bios)\r\n-Hace 3 meses hubo cambio de pasta térmica al procesador (a la grafica no se le cambio pasta)', '-No tuvo solucion no se cobro nada!', '-Grafica rtx3070 de 8gb\r\n-No trae tapa de cierre', '', 0, 6, '2023-09-08', '2023-09-01', NULL),
(256, 10229, 'FERNANDO SOTO MUÑOZ', '4777119625', 64, 'LAPTOP', 'HP', 'AMD A6', '4', 'SIN DATO', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-FORMATEO CON RESPALDO DE INFORMACION\r\n- MANTENIMIENTO INTERNO\r\n- Cambio de disco ssd de 480 gb ', '', '- ESQUINA QUEBARA\r\n- RAYONES EN LA TAPA SUPERIOR', '', 1340, 6, '2023-09-11', '2023-09-04', NULL),
(257, 10230, 'RAUL LOPEZ', '4776745170', 64, 'LAPTOP', 'DELL', 'RYZEN 5', '16', '1 TB', '256', 'WIN 11', 'No', '2006', '- ACTUALIZACIONES', '- SE ACTUALIZO', '', '', 350, 6, '2023-09-04', '2023-09-04', NULL),
(258, 10231, 'ULISES ANDRADE', '4775251470', 64, 'CPU', 'LENOVO', 'AMD A8', '8', '500', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- SISTEMA OPERATIVO NO INICIA\r\n- REVISAR DISCO ', '- REINSTALACION DE SISTEMA MAS RESPALDO DE INFORMACION', '- FORMATEO MAS RESPALDO ', '', 500, 6, '2023-09-08', '2023-09-06', NULL),
(259, 10232, 'JORGE LEON', '4777021581', 64, 'CPU', 'ARMADA', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'S', 'WIND 10', 'No', 'Senna', '-No inicia sistema operativo\r\n- Si  lleva respaldo de información  \r\n- Revisar disco Duro', '-', '', '', 1990, 6, '2023-09-13', '2023-09-06', NULL),
(260, 10233, 'BRUNO RODRIGO ', '4771234193', 64, 'ALL IN ONE', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-PRENDE PERO NO DA VIDEO\r\n- FALTA DE MANTENIMIENTO', '-REVISION', '', '', 100, 6, '2023-09-14', '2023-09-08', NULL),
(261, 10234, 'Raúl Diaz', '4775647370', 64, 'ALL IN ONE', 'APPLE', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '123', 'No inicia S.O\r\n', 'Abrir equipo y cerrar Respaldo de inf. + S.O= $1,300\r\nSSD 960 GB $790', '', '', 2090, 6, '0000-00-00', '2023-09-11', NULL),
(262, 10235, 'ARMONIZACION INTEGRAL', '4773113935', 64, 'CPU', 'DELL', 'CORE I5', '4', 'SIN DATO', '240', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-MANTENIMIENTO INTERNO', '-MANTENIMIENTO INTERNO\r\n- MEMORIA RAM 8 GB \r\nFACTURADO', '4773020871 WHATS', '', 1438.4, 6, '2023-09-13', '2023-09-11', NULL),
(263, 10236, 'ARMONIZACION INTEGRAL', '4773113935', 64, 'CPU', 'HP', 'CORE I7 ', '8', 'SIN DATO', '480', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- REVISAR ERROR DE VENTILADOR DE FUENTE\r\n- FORMATEO CON RESPALDO\r\n- MANTENIMIENTO INTERNO\r\n-INSTALACION DE NITRO', '', 'SERVICIO CON FACTURA', '', 1276, 6, '2023-09-20', '2023-09-13', NULL),
(264, 10237, 'GENERAL OPERADOR LOGISTICO', '4777507474', 64, 'ALL IN ONE ', 'DELL', 'CORE I7', '12', 'SIN DATO', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '-NO INICIA SISTEMA OCUPA RESPALDO DE INFORMACION', '', '- APARECE UNA PANTALLA DE MEMORIA MANAGER\r\n- BAD SISTEMS CONFIGURATIONS', '', 0, 1, '2023-09-14', '2023-09-14', NULL),
(265, 10238, 'JOSUE HERNANDEZ ', '4771568651', 60, 'LAPTOP', 'LENOVO', 'CORE I5', '8', '500', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', 'REVISAR ANTE POR QUE LE DEJO DE DAR IMAGEN\r\n- Cambio a disco ssd de 960 gb $1000\r\n- Actualizacion de sistema  $450\r\n- aumento de memoria ram 8 gb $990\r\n- case de disco sata negro $199\r\n-  Total $2,639', 'REVISAR ANTE POR QUE LE DEJO DE DAR IMAGEN\r\n- Cambio a disco ssd de 960 gb $1000\r\n- Actualizacion de sistema  $450\r\n- aumento de memoria ram 8 gb $990\r\n- case de disco sata negro $199\r\n-  Total $2,639', 'ENTREGADO OK 20/09/2023', '', 2639, 6, '2023-09-22', '2023-09-15', NULL),
(266, 10239, 'Oscar Villegas', '4776464680', 60, 'LAPTOP', 'HP', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- Enciende pero no da Señal', '- DISCO SOLIDO DE 960 GB $790\r\n- SISTEMA OPERATIVO + RESPALDO $500\r\n- MANTENIMIENTO INTERNO $350\r\n- TOTAL = $1,640 +IVA TOTAL =$1,902.40\r\n', '- Viene con la tapa destornillada', '', 1902.4, 6, '2023-09-22', '2023-09-15', NULL),
(267, 10240, 'SAYRA LIZETH HERRERA', '4771156077', 64, 'laptop', 'hp', 'AMD A6', '8', '1 TB', 'SIN DATO', 'WIND 10', 'Sí', '111915bccl', '-  ACTUALIZACION DE SISTEMA SOLAMENTE WIND Y PAQUETE SIN RESPALDO\r\n- MANTENIMIENTO INTERNO', '-  ACTUALIZACION DE SISTEMA SOLAMENTE WIND Y PAQUETE SIN RESPALDO\r\n- MANTENIMIENTO INTERNO', 'esquina reparada, Lateral quebrada de las ventilas de disipador,  esquina superior de pantalla, puerto usb dañado, Cinta cubierta del cargador.', '', 700, 6, '2023-09-25', '2023-09-18', NULL),
(268, 10241, 'CAROLINA  FRANCO DURAN', '4776481420', 64, 'LAPTOP', 'LENOVO', 'CORE I7', '8', 'SIN DATO', '240', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '- MOUSE SE MUEVE SOLO\r\n- CARGADOR HAY VECES QUE NO CARGA', '', '- CARGADOR ORIGINAL LENOVO 490', '', 490, 6, '2023-09-26', '2023-09-19', NULL),
(269, 10242, 'JOSE MAURICIO', '4776863096', 64, 'LAPTOP', 'LANIX', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'No enciende, estaba prendida y conectada a la luz. se fue la luz y ya no encendio.', '', 'rayones en carcasa, pendiente de traer cargado para pruebas', '', 0, 1, '0000-00-00', '2023-09-19', NULL),
(270, 10243, 'RAYMUNDO GAYTAN', '4771230074', 60, 'CPU', 'LENOVO', 'AMD A8', '8', '500', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- FALLA EN SISTEMA OPERATIVO \r\n- INDICA QUE PARPATEA LA BARRA DE TAREAS', '- SE FORMATEO CON RESPALDO', 'POR SER CLIENTE SOLO SE COBRO EL RESPALDO EL SISTEMA LO COBRO LA EMPRESA', '', 150, 6, '2023-09-20', '2023-09-20', NULL),
(271, 10244, 'BRANDON LUNA', '4772358250', 64, 'LAPTOP', 'GTO', 'CELERON', '8', 'SIN DATO', '128', 'WIN 11', 'Sí', '290902', '- NO ESTA CARGANDO LA BATERIA\r\n- COMENTA QUE PUEDE TRAER ALGUN CORTO', '- BATERIA DAÑADA SOLO SE COBRO REVISION', '- GOMITAS SE ESTAN DESPEGANDO\r\n- CARGADOR MUY ENROSCADO DEL CABLE', '', 100, 6, '2023-09-27', '2023-09-20', NULL),
(272, 10245, 'JESUS VERA', '4771313540', 60, 'CPU', 'DELL', 'CORE I5', '4', '160', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-NO ENCIENDE', '- CAMBIO DE FUENTE DE PODER ', '', '', 1392, 6, '2023-09-20', '2023-09-13', NULL),
(273, 10246, 'Alexis Murillo', '4771137536', 64, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'alexis234', '-No prende se mojo con agua, se intento prender al siguiente dia y no prendio. ', '', 'Derrame de liquido (agua)', '', 490, 6, '0000-00-00', '2023-09-21', NULL),
(274, 10247, 'JAIME HORTA', '4771398363', 60, 'LAPTOP', 'ASUS', 'CORE I7', '8', '1 TB', 'SIN DATO', 'WIND 10', 'Sí', '0477', '- ACTUALIZACIONES DE SISTEMA CRL', '- INSTALACION DE ACTUALIZACIONES CRL', '', '', 350, 6, '2023-09-21', '2023-09-21', NULL),
(275, 10248, 'kimberly Anguiano', '4772069322', 64, 'LAPTOP', 'TOSHIBA', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-REPARACION DE BISAGRAS \r\n-DISCO DE ESTADO SOLIDO DE 240 GB \r\n- INSTALACION DE SISTEMA', '- REPARACION DE LA BISABRA\r\n-FORMATEO SIN RESPALDO\r\n- DISCO DURO DE 250 GB  $100', '- VIENE ABIERTA\r\n- BISAGRA DESPRENDIDA DE DONDE SE ATORA', '', 650, 6, '2023-09-28', '2023-09-21', NULL),
(276, 10249, 'VIRGINIA VILCHIS', '4772628671', 64, 'LAPTOP', 'HP', 'AMD A8', '8', 'SIN DATO', '120', 'WIND 10', 'Sí', '0102', '- REVISION NO ENCIENDE EN SU CASA', '- CAMBIO DE BATERIA COSTO $500', '- TECLADO DE WINDOWS NO FUNCIONA', '', 500, 6, '2023-09-29', '2023-09-22', NULL),
(277, 10250, 'Lucia Padilla Mares', '4779199267', 64, 'Laptop', 'hp', 'sin dato', 'sin dato', 'sin dato', 'sin dato ', 'sin dato', 'Sí', 'sin dato', '- Equipo prende pero no da video.', '-SOLO REVISION NO SOLICITO EL SERVICIO', 'Franja plata qubrada del latera, y faltan dos partes de la parte del frente.', '', 100, 6, '0000-00-00', '2023-09-23', NULL),
(278, 10251, 'JOSE LUIS SANDOVAL HERMOSILLO', '4771063475', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DAYO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '070501', '- NO ENCIENDE LA GUARDO ENCENDIDA', '- CAMBIO DE CIRTUITOS INTEGRADOS $2,900\r\n- MANTENIMIENTO PREVENTIVO $700', '- FALTA UNA GOMITA EN LA BASE ', '', 3600, 6, '2023-12-05', '2023-09-26', NULL),
(279, 10252, 'GUILLERMO ARENAS', '4773333235', 60, 'LAPTOP', 'HUAWEI', 'AMD RYZEN 5', '8', '366', '128', 'WINDOWS 11', 'Sí', 'armani7161', '- ACTUALIZACIONES SOLICITADAS', '- APLICADAS ACTUALIZACIONES', '', '', 350, 6, '2023-09-26', '2023-09-26', NULL),
(280, 10253, 'PAOLA IRAZU MARQUEZ SANCHEZ', '4772221395', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIND 10', 'Sí', 'cobres1538', '- cambio de disco a ssd de 480 gb + s.o sin respaldo $590+350= $940', '- cambio de disco a ssd de 480 gb + s.o sin respaldo $590+350= $940', '-DETALLES ESTETICOS\r\n-SIN BATERIA\r\n- BISAGRA DAÑADA\r\n- SIN GOMAS EN LA TAPA TRASERA\r\n- SISTEMA LENTO', '', 940, 6, '2023-10-05', '2023-09-28', NULL),
(281, 10254, 'Alfonso Vazquez', '4772982613', 60, 'LAPTOP', 'GATEWAY', 'INTEL CELERON', '4', '300', 'SIN DATO', 'WINDOWS 8', 'Sí', 'SIN CONTRASEÑA', '-ACTUALIZACIONES DE SISTEMA SIN REPALDO', '', '', '', 350, 6, '2023-10-07', '2023-09-30', NULL),
(282, 10255, 'EDUARDO BIMBO', '4441213607', 60, 'LAPTOP', 'DELL', 'CORE I 7', '8', 'SIN DATO', '240', 'WINDOWS 10', 'No', '2023', '- FORMATEO CON RESPALDO\r\n- CLIENTE COMENTA QUE TIENE VIRUS NO APARECEN \r\n- MANTENIMIENTO INTERNO', '- FORMATEO CON RESPALDO $500\r\n- CLIENTE COMENTA QUE TIENE VIRUS NO APARECEN \r\n- MANTENIMIENTO INTERNO', '- FORMATEO CON RESPALDO $500\r\n- MANTENIMIENTO NO!', '', 500, 6, '2023-10-09', '2023-10-02', NULL),
(283, 10256, 'LUIS HERRERA', '4772742804', 60, 'LAPTOP', 'HP', 'INTEL CELERON', '4', 'SIN DATO', '128', 'WINDOWS 11', 'Sí', '1507', '- ACTUALIZACION DE SISTEMA', '-ACTUALIZACION', '', '', 350, 6, '2023-10-04', '2023-10-04', NULL),
(284, 10257, 'EDWIN VALLE CANO', '4492018205', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '8', '', 'SIN DATO', 'WINDOWS 10', 'Sí', 'SIN CONTRASEÑA', '- SE APAGA POR CALENTAMIENTO', '-REVISION DEL EQUIPO $100', '-CINTA EN TAPA NO CUENTA CON TORNILLOS Y PESTAÑA QUEBRADA\r\n- DEJA PLACA MADRE DE USO', '', 100, 6, '2024-02-27', '2023-10-05', NULL),
(285, 10258, 'INGENIO', '4776848353', 60, 'MONITOR', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- NO ENCIENDE', '', '-DEJA CARGADOR PERO NOS FALTA UNA PUNTA', '', 0, 1, '2023-10-13', '2023-10-06', NULL),
(286, 10259, 'CLAUDIA OLIVARES', '4771805008', 60, 'LAPTOP', 'HP', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- EQUIPO MOJADO, LIMPIAR EL EQUIPO PARA VER SI FUNCIONA EN DADO CASO DE QUE NO SE RECUPERA LA INFORMACION', '- LIMPIEZA PROFUNDA $490\r\n- RESPALDO $250\r\n- MEMORIA USB 64 GB $79', '-TAPA ESQUINA SUPERIOR CON DETALLE INFERIOR', '', 819, 6, '2023-10-06', '2023-10-06', NULL),
(287, 10260, 'MARTHA RITA ALVARO MORALES', '4773098301', 64, 'LAPTOP', 'HP/LENOVO', 'AMD A4/CORE 2 DUO', '4/2', '500/160', 'SIN DATO', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA', 'DETALLES HP\r\n-COTIZAR TECLADO\r\n-DERRAME DE LIQUIDOS\r\n\r\nDETALLES LENOVO\r\n- SE APAGA DESPUES DE TIEMPO\r\n- LE MARCA ERROR DE VENTILADOR', '- HP YA SE ENTREGO LA ENTREGO ISSAC \r\n- SOLO REVISION SE ENTREGO LA LENOVO 27/10/2023', '-LENOVO BISAGRA SE SIENTE FLOJA\r\n- HP NO FUNCIONA CLICK IZQUIERNO Y ALGUNAS TECLAS', '', 100, 6, '2023-10-27', '2023-10-09', NULL),
(288, 10261, 'Jaime Horta', '4771398363', 60, 'CPU', 'HP', 'CORE I5', '8', '500', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', '- DISCO SOLIDO 480 SSD $590\r\n- SISTEMA SIN RESPALDO $350\r\n- ACTUALIZACION DE COREL $350\r\n- PDF PRO ACTUALIZACIONES $350', '- DISCO SOLIDO 480 SSD $590\r\n- SISTEMA SIN RESPALDO $350\r\n- ACTUALIZACION DE COREL $350', '', '', 1640, 6, '2023-10-09', '2023-10-09', NULL),
(289, 10262, 'CRISTIAN TORRES', '4772335406', 60, 'LAPTOP', 'LENOVO T420', 'CORE I5', '12', '500', 'SIN DATO', 'WINDOWS 10', 'No', 'lumacri.', '- LIMPIEZA FORMATEO CON RESPALDO', '- FORMATEO CON RESPALDO', '-falta letra e en etiqueta de lenovo', '', 500, 6, '2023-10-09', '2023-10-09', NULL),
(290, 10263, 'Fabiola Davalos', '4777035085', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'claudio', 'no inicia S.O\r\nsi ocupa respaldo de información\r\nSe callo el equipo cuando venían para acá antes de ya tenia la falla.\r\nRevisar que el disco duro este funcional.\r\n', '-DISCO SOLIDO DE 240 GB $390\r\n- INSTALACION DE SISTEMA CON RESPALDO $500\r\n- TOTAL $890', 'Se callo cuando venían para acá, tiene una quebrada en la parte superior falta un pedazo de plástico ', '', 890, 6, '2023-10-12', '2023-10-09', NULL),
(291, 10264, 'Jose Luis Estrada Rico', '3312332906', 64, 'LAPTOP', 'dell', 'CORE I 7', '16', 'no', '480', 'WINDOWS 11', 'No', 'SIN CONTRASEÑA', 'Actualización acrobat', 'Actualizar Acrobat', '', '', 350, 6, '2023-10-10', '2023-10-09', NULL),
(292, 10265, 'ALDO SOTO', '4778160016', 64, 'LAPTOP', 'LENOVO', 'CORE I3', '4', '500', 'SIN DATO', 'WINDOWS 8', 'Sí', '7235', '- FORMATEO CON RESPALDO\r\n- MAS DISCO SOLIDO DE 240 GB SSD\r\n- 4 GB DE MEMORIA RAM', '', '- PANTALLA ESTRELLADA', '', 1480, 6, '2023-10-10', '2023-10-10', NULL),
(293, 10266, 'Moises Gaona', '4772745878', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'modo', '- NO ENCIENDE', '- FUENTE DE PODER DE WHATS  500 $415\r\n- SISTEMA OPERATIVO CON RESPALDO $500', '- PAGO CON TRASNFERENCIA', '', 915, 6, '2023-10-14', '2023-10-10', NULL),
(294, 10267, 'GENERAL OPERADOR LOGISTICO', '4777507474', 64, 'LAPTOP/LAPTOP/CPU/ALL IN ONE', 'HP/LENOVO/LENOVO/ HP', 'CORE I5/CORE I7/CORE/AMD A 8 I6', '6/8/16/4', '', '500/512/500 HHD/240', 'WIN10/ WIN 11/WIN 10/WIN 10', 'Sí', 'SIN CONTRASEÑA', '- COTIZAR BATERIA HP \r\n- COTIZAR BATERIA  LENOVO\r\n- CPU LENOVO MANTENIMIENTO INTERNO+ SSD 480 SSD+ S.O. CON RESPALDO\r\n- ALL IN ONE HP REVISAR ERROR DE DISCO DURO POSIBLE CAMBIO A  240 SSD + S.O  SIN RESPALDO', '', '-HP QUEBARA EN UNA ESQUINA, RAYONES DE USO TAPA SUPERIOR', '', 0, 1, '2023-10-11', '2023-10-11', NULL),
(295, 10268, 'JOSE MARIA PIO', '9712227780', 61, 'CPU', 'HP', 'CORE I3', '4', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'TUBULAR2021', '-NO INICIA EL SISTEMA OPERATIVO\r\n- NO DETECTA DISCO\r\n- OCUPA RESPALDO DE INFORMACION ', '- SOLO REVISION', '', '', 100, 6, '2023-10-18', '2023-10-11', NULL),
(296, 10269, 'SILVIA CHARLES', '4776496944', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- ENCIENDE PERO NO DA IMAGEN', '-Cambio de memoria ram', '-PANTALLA ESTRELLADA', '', 490, 6, '2023-10-11', '2023-10-11', NULL),
(297, 10270, 'JORGE ARMANDO', '4776843157', 64, 'LAPTOP', 'SAMSUNG', 'AMD E2', '4', '500', 'SIN DATO', 'WINDOWS 10', 'Sí', 'Donamaria1950', '-Hacer Prueba que funcione disco duro con windows 7\r\n- Que corran Programas', '-Instalación de sistema', '', '', 350, 6, '2023-10-19', '2023-10-12', NULL),
(298, 10271, 'CLAUDIA OLIVARES', '4771805008', 65, 'IMPRESORA ', 'SAMSUNG', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- CONFIGURACION DE IMPRESORA AL SISTEMA', '-CONFIGURACION LISTA ', '', '', 150, 6, '2023-10-12', '2023-10-12', NULL),
(299, 10272, 'Saul Miranda ', '4777304395', 64, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'REVISION', 'REVISIÓN SIN SOLUCIÓN', '', '', 100, 6, '2023-10-13', '2023-10-13', NULL),
(300, 10273, 'Erick Gonzalez ', '3312685121', 64, 'CPU ', 'ARMADO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO PRENDE .', '', '', '', 0, 1, '0000-00-00', '2023-10-13', NULL),
(301, 10274, 'Josue Galvan', '4773097698', 64, 'LAPTOP', 'HP', 'CORE I3', '4', '1 TB', 'SIN DATO', 'W10', 'Sí', 'SIN DATO', 'formateo', 'FORMATEO SIN RESPALDO', 'CARGADOR SIN CABLE TRIFASICO', '', 350, 6, '2023-10-16', '2023-10-16', NULL),
(302, 10275, 'Salvador Hernandez', '4777720471', 65, 'LAPTOP', 'TOSHIBA', 'CELERON', '4', '800', '', 'W10', 'No', 'sahe', '-Lentitud\r\n-Activación de office \r\n-Checar puerto de auricular', '-Actualizaciones \r\n-Instalación de paquetería ', '-Ninguna\r\n', '', 250, 6, '2023-10-19', '2023-10-16', NULL),
(303, 10276, 'Adrian Rodriguez', '4777869804', 65, 'LAPTOP', 'ARMADA', 'SIN DATO', 'SIN DATO', 'SIN DATO ', '', 'W10', 'Sí', 'SIN DATO', '-No inicia sistema\r\n', '- cambio a disco ssd de 500 gb m2 $690\r\n- formateo sin respaldo $350', '-Cargador no original', '', 1040, 6, '2023-10-28', '2023-10-16', NULL),
(304, 10277, 'CARLOS MENDOZA', '4773804504', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- NO ENCENDIA SE TUVO QUE RETIRAR LA BATERIA PARA QUE PRENDIERA\r\n-ENCIENDE LA PANTALLA PERO NO DA IMAGEN', '', '', '', 0, 1, '2023-10-23', '2023-10-16', NULL),
(305, 10278, 'Luz del Carmen Ruiz', '4771598450', 60, 'LAPTOP', 'DELL', 'CORE I7', '16', 'SIN DATO ', '512', 'W11', 'Sí', 'SIN CONTRASEÑA', '-SOLICITA AUMENTO DE 16 GB MAS', '-SE AUMENTO LA RAM A 16 GB PARA QUE QUEDARA A 32 GB COSTO DE MODULOS $1,500', '', '', 1500, 6, '2023-10-16', '2023-10-16', NULL),
(306, 10279, 'Manuel Escamilla', '4777054153', 60, 'ALL IN ONE', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'ALL IN ONE\r\n-No guarda archivos de word \r\n', '-Reparación de programa \r\n-Recuperación de archivos', 'SIN DETALLES ', '', 350, 6, '2023-10-24', '2023-10-17', NULL),
(307, 10280, 'Luis Ernesto Mendez  de General ', '4771299491', 60, 'ALL IN ONE', 'HP', 'AMD A 8', '6', '1 TB', 'SIN DATO', 'W10', 'Sí', 'SIN CONTRASEÑA', 'REVISAR MUY LENTAS\r\n- 1 HP FORMATEO SIN RESPALDO \r\n-2 HP MARCA DISCO DAÑADO SIN RESPALDO', '1 hp\r\n- Mantenimiento interno $350\r\n- sistema operativo sin respaldo $350\r\n- disco de estado solido 480 gb $550\r\n- ram de 8 gb $890\r\n$2,140\r\nhp 2\r\n- Mantenimiento interno $350\r\n- sistema operativo con respaldo $500\r\n- disco de estado solido 480 gb $550', '', '', 5362.85, 6, '2023-10-25', '2023-10-17', NULL),
(308, 10281, 'INGENIO', '4776848353', 64, 'LAPTOP', 'HP', 'CORE I7', '16', 'SIN DATO', '256', 'WIN 10', 'Sí', 'ingenio1985', '-NO DEJA ESCRIBIR EN EL BUSCADOR Y AL PONER UNA CONTRASEÑA DEL WIFI NO DEJA ESCRIBIR\r\n- SE VA ACTUALIZAR EL OFFICE', '-Reparación de archivos de sistema \r\n-Actualización de paquetería ', '- FALTA TECLA F1\r\n-NO CUENTA CON TRACK POINT', '', 350, 6, '2023-10-25', '2023-10-18', NULL),
(309, 10282, 'Juan Alberto Silva ', '4732585708', 64, 'LAPTOP', 'LENOVO', 'CORE I7', '16', '', '512', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '-Revisar parpadeo en pantalla\r\n-Touch pad se batalla en moverlo', '- CAMBIO DE TECLADO NUEVO $790\r\n- MANTENIMIENTO $350', '', '', 1140, 6, '0000-00-00', '2023-10-18', NULL),
(310, 10283, 'Cristian Contreras ', '4774663243', 65, 'LAPTOP', 'PANASONIC ', 'CORE I5', '10', '160', '', 'WIN 7', 'No', 'MXV()()d002014', '-Instalar disco solido \r\n-Instalación de sistema ', '-1 MODULO DE RAM 4 GB $490\r\n- 1 DISCO SOLIDO 960 GB $790\r\n- SISTEMA OPERATIVO $350', '-Falta la tecla T\r\n-Tapas laterales dañadas ', '', 1630, 6, '2023-10-23', '2023-10-18', NULL),
(311, 10284, 'Hector Ullivary', '3337004555', 64, 'LAPTOP', 'MAC', '', '', '', '', '', 'No', 'SIN CONTRASEÑA', '-Sistema bloqueado ', 'Sin solución', '-Tapa inferior suelta ', '', 100, 6, '0000-00-00', '2023-10-19', NULL),
(312, 10285, 'OSCAR OLVERA', '4775414608', 64, 'HP', 'LAPTOP', 'CELERON', '4', 'SIN DATO', '32', 'WIN 10', 'Sí', 'SIN DATO', '- FORMATEO SIN RESPALDO', '', '', '', 350, 6, '2023-10-30', '2023-10-23', NULL),
(313, 10286, 'SAUL RIZO AGUADO', '4771338355', 65, 'LENOVO', 'THINKPAD', 'CORE I7', '8 RAM', 'SIN DATO', '480 GB', 'WIN 10', 'Sí', 'SIN DATO', '- REVISAR POR QUE SE CONGELA PANTALLA DE ERROR', '- FORMATEO CON RESPALDO $500', '', '', 500, 6, '2023-10-27', '2023-10-23', NULL),
(314, 10287, 'EDUARDO CHAVEZ BARAJAS', '4775808404', 64, 'ALL IN ONE', 'GUIA', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '- NO ENCIENDE EL EQUIPO', '-Solo Revision', '', '', 100, 6, '2023-10-31', '2023-10-24', NULL),
(315, 10288, 'JORGE GUTIERREZ', '4776387848', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', '-NO ENCIENDE', 'DAÑO EN TARJETA MADRE SIN SOLUCION', '- SE QUEDA UN DISCO DE 500 GB , SE VE SARO EN ALGUNOS COMPONENTES DE LA PLACA MADRE', '', 100, 6, '2023-10-26', '2023-10-26', NULL),
(316, 10289, 'Alfonso Vazquez', '4772982613', 64, 'CPU ', 'IBM', 'PENTIUM 4', '1 GB ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'instalación windows ME/98', 'instalación windows ME/98', 'sin dato', '', 0, 6, '2023-11-04', '2023-10-26', NULL),
(317, 10290, 'Roberto Carlos', '4772270050', 65, 'CPU', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', '', 'SIN DATO', 'No', '77', '-NO ENCIENDE, SE CALIENTE Y SE APAGO EL EQUIPO', '- REVISION $100\r\n- CAMBIO DEC COMPONENTES A OTRO CPU $100', '', '', 200, 6, '2023-10-30', '2023-10-27', NULL),
(318, 10291, 'MIRIAM REYNA  GOMEZ', '4775185565', 65, 'LAPTOP', 'HP', 'CORE I5', '4', '500', 'SIN DATO', 'WIND 10', 'Sí', '180602', '- MANTENIMIENTO INTERNO\r\n- CAMBIO DE DISCO SSD 480 \r\n- FOERMATEO SIN RESPALDO\r\n- COTIZAR BATERIA', '- MANTENIMIENTO INTERNO $350\r\n- CAMBIO DE DISCO SSD 480 $590\r\n- FOERMATEO SIN RESPALDO $350\r\n- COTIZAR BATERIA ........ TOTAL $1,290 PAGO EN TRANFERENCIA', '- SE LLEVO A OTRO LADO PERO NO LE DIERON SOLUCION AL PROBLEMA!', '', 1290, 6, '2023-10-28', '2023-10-28', NULL),
(319, 10292, 'EDUARDO AXEL RODRIGUEZ PEREZ', '4775920108', 65, 'LAPTOP', 'HP', 'AMD E2', '4', '30', 'SIN DATO', 'WIND 10', 'Sí', '1234', '-REVISION POR EXPANCION DE RAM Y DISCO\r\nO SI NO FORMATO SIN RESPALDO', '- ADPTADOR DE DISCO $500\r\n- DISCO DE ESTADO SOLIDO 480 GB $590\r\n- 2 MEMORIA RAM DE 4 GB $890\r\n- FORMATEO SIN RESPALDO  $350\r\n- INSTALACION DE DISCO Y MEMORIA RAM  $100', '- NO RETIENE BATERIA', '', 2430, 6, '2023-10-28', '2023-10-28', NULL),
(320, 10293, 'ANTONIO MENDOZA', '4774060078', 65, 'TABLET ', 'SURFACE', 'CORE I5', '8', 'SIN DATO', '256', 'WIND 11', 'Sí', '241060', '- FORMATEO SIN RESPALDO  WINDOWS 10', '-FORMATEO WINDOWS 10 OK', '', '', 350, 6, '2023-10-31', '2023-10-30', NULL),
(321, 10294, 'Miguel Martinez', '4771361653', 64, 'LAPTOP', 'HP', 'SIN DATO', '', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '- Prende y no da video \r\n-foco cuando de conexión de cargador prende y se apaga ', '-LIMPIEZA DE RAM Y SE REVISO Y SE RETIRO UNA MEMORA RAM INCOMPATIBLE', 'Batería no retiene', '', 250, 6, '2023-11-04', '2023-10-30', NULL),
(322, 10295, 'Jose Angel Almaguer', '4791363672', 64, 'CPU ', 'HP ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'Pinky', '-No inicia S.O\r\n- Llamar para confirmar cambio de disco (revisar salud del disco y aun asi llamar para confirmar cambio de disco)\r\n-sin respaldo de info', '-DISCO SOLIDO DE 480 GB SSD $590\r\n- FORMATEO SIN RESPALDO $350\r\n- TOTAL $940', '', '', 940, 6, '2023-11-03', '2023-10-30', NULL),
(323, 10296, 'ALEJANDRO BUENROSTRO', '4771277348', 64, 'LAPTOP', 'HP', 'CORE I5', '8', '320', 'SIN DATO', 'WINDOWS 10', 'Sí', '110719', '- REVISAR LA LENTITUD\r\n- ANALIZAR DISCO DISCO\r\n- ACTUALIZACIONES \r\n- MANTENIMIENTO INTERNO', '-Mantenimiento interno', '', '', 350, 6, '2023-10-30', '2023-10-30', NULL),
(324, 10297, 'OSCAR DOMINGUEZ', '4776967248', 65, 'LAPTOP', 'HP ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WINDOWS 10', 'Sí', '159615', '-REVISAR POR QUE NO CARGA LA BATERIA\r\n- MANTENIMIENTO $350\r\n- REVISAR EQUIPO LENTO ', 'cambio de bateria $990\r\nformateo $350', ' NO RETIENE LA BATERIA', '', 1340, 6, '2023-11-07', '2023-10-31', NULL),
(325, 10298, 'HECTOR MIGUEL VELAZQUEZ', '5524366525', 65, 'CPU', 'DELL OPTIPLEX', 'CORE 2 DUO', '4', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', '- NO DETECTA DISCO DURO', '-MANTENIMIENTO Y FORMATEO SIN RESPALDO', '', '', 700, 6, '2023-11-03', '2023-11-03', NULL),
(326, 10299, 'JOSE FRANCISCO SANCHEZ FRANCO', '4776479010', 60, 'LAPTOP', 'LENOVO', 'AMD RYZEN  5', '8', 'SIN DATO', '256', 'WIN 11', 'Sí', 'FF1305Cappy', '- MANTENIMIENTO INTERNO\r\n', '- MANTENIMIENTO INTERNO\r\n', '', '', 700, 6, '2023-11-10', '2023-11-03', NULL),
(327, 10300, 'Ismael Falcon', '4791793986', 64, 'CPU', 'armado vorago', 'AMD A8', '8', '1 TB', 'SIN DATO', 'WIN 10', 'No', 'SIN DATO', '-FORMATERO SIN RESPALDO\r\n- MANTENIMIENTO INTERNO', '-FORMATEO SIN RESPALDO\r\n- MANTENIMIENTO INTERNO', '', '', 700, 6, '2023-11-06', '2023-11-03', NULL),
(328, 10301, 'SAMUEL GONZALEZ', '4792235068', 60, 'CPU', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', '-NO ENCIENDE ', '-MEMORIA RAM DE 4 GB $590 CON LA INSTALACION', '- SIN FUENTE SIN TAPA\r\n- NO ENCIENDE POR ESO NO SE REVISAN CARACTERISTICAS ', '', 590, 6, '2023-11-03', '2023-11-03', NULL),
(329, 10302, 'DANIELA CALVILLO', '4791009749', 64, 'LAPTOP', 'HP', 'CORE I5', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'SIN DATO', '- REVISAR FALLA EN TECLAS DE TECLADO\r\n- SI TECLADO NO SE REPARA COTIZAR TECLADO', '- MANTENIMIENO INTERNO $350\r\n- SE REMPLAZA TECLADO DEJA ANTICIPO DE $350  SE ADJUNTA PAGO A CAJA EL DIA 04/11/2023', '-PEQUEÑA QUEBRADA EN LA ESQUINA Y DESPINTADA EN LA OTRA ESQUINA', '', 700, 2, '2023-11-06', '2023-11-03', NULL),
(330, 10303, 'JOSE CALVILLO QUIJAS', '4773525552', 64, 'LAPOP', 'DELL', 'CORE I7', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'SIN DATO', '-CAMBIO A DISCO SOLIDO DE 480 GB\r\n- FORMATEO SIN RESPALDO\r\n-REVISION DE TOUCHPAD\r\n- SE PEGOUNA ESQUINA\r\n-COTIZACION DE BATERIA', '-CAMBIO A DISCO SOLIDO DE 480 GB $590\r\n- FORMATEO SIN RESPALDO $350\r\n-REVISION DE TOUCHPAD $50\r\n- SE PEGOUNA ESQUINA \r\n-BATERIA $1,100\r\n- TRAC POINT $50\r\n- TOTAL $2,140', '-CAMBIO A DISCO SOLIDO DE 480 GB\r\n- FORMATEO SIN RESPALDO\r\n-REVISION DE TOUCHPAD\r\n- SE PEGOUNA ESQUINA\r\n-COTIZACION DE BATERIA\r\n- TRAC POINT', '', 2140, 6, '2023-11-04', '2023-11-04', NULL),
(331, 10304, 'Manuel Jimenez', '4771353471', 64, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '- ENCIENDE PERO NO DA IMAGEN', '-Limpieza interna de ram y reseteo de bios !', '- FRANJA EN TAPA SUPERIOR', '', 174, 6, '2023-11-13', '2023-11-06', NULL),
(332, 10305, 'CARLOS TORRES', '4776838359', 65, 'LAPTOP', 'HP', 'CORE I3', '8', 'SIN DATO', '512', 'WIN 11', 'No', '472580', '-ACTUALIZACIONES DE OFFICES', '-INSTALACION COMPLETA OK', '', '', 350, 6, '2023-11-08', '2023-11-08', NULL),
(333, 10306, 'Mariana Alvarez', '4773994379', 64, 'LAPTOP', 'LENOVO', 'CELERON', '8', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '-SE CONGELA EL EQUIPO NO DEJA TRABAJAR\r\n- MARCA PANTALLA AZUL', '-Formateo + Respaldo de info $500\r\n- Mantenimiento $350', '-TAPA DE BISAGRA', '', 850, 6, '2023-11-16', '2023-11-09', NULL),
(334, 10307, 'ARMANDO QUINTERO', '4772241873', 65, 'LAPTOP', 'ACER', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN 10', 'Sí', 'SIN DATO', '- NO INICIA EL SISTEMA SOLICITA RESPALDO', 'SE CANCELO EL SERVICIO. ', '', '', 0, 5, '2023-11-16', '2023-11-09', NULL),
(335, 10308, 'Javier Martinez', '5510093097', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '16', 'SIN DATO', '256', 'WIN 11', 'No', 'cobrar429', 'Tecla Backspace ', '- se limpio el teclado y se hizo reconexión!', '- PENDIENTE DE TRAER NOTA DE GARANTIA \r\n- no la trajo y no se le cobro por que no se realizo cambio de piezas sale!', '', 0, 6, '2023-11-10', '2023-11-10', NULL),
(336, 10309, 'Adrian Rodriguez', '4777869804', 64, 'LAPTOP', 'HP ', 'CELERON', '4', '500', 'sin dato', 'w10', 'Sí', 'Sin dato', 'Equipo Lento \r\n', '- solido 480 gb \r\n-Formateo sin respaldo \r\n-RAM 8 GB ', 'Bat. no retiene \r\n- Se tomo a cuenta cambio de disco solido de la nota #10276', '', 1240, 6, '0000-00-00', '2023-11-11', NULL),
(337, 10310, 'ROMAN RODRIGUEZ', '4777201094', 65, 'LAPTOP', 'HP', 'CORE I5', '8', 'SIN DATO', '256', 'WIN 11', 'No', 'SIN CONTRASEÑA', '- NO DETECTA EL TECLADO', '-ACTUALIZACION DE BIOS Y CONTROLADORES', 'ENTREGO ISSA ', '', 250, 6, '2023-11-27', '2023-11-14', NULL),
(338, 10311, 'Jorge Alberto', '4791401040', 64, 'LAPTOP', 'HP', 'INTE CELERON', '2', '500', 'SIN DATO', 'WIN 10', 'Sí', 'AlbertoChavez', '- DISCO SOLIDO 960 GB $89\r\n- MANTENIMIENTO INTERNO $350\r\n- MODULO E 8 GB CON INSTALACION $990\r\n- SISTEMA POPERATIVO SIN RESPALDO $350\r\n- TOTAL $2,580', '', '', '', 2580, 1, '2023-11-22', '2023-11-15', NULL);
INSERT INTO `servicios` (`id`, `folio`, `cliente`, `telefono`, `id_empleado`, `equipo`, `marca`, `procesador`, `ram`, `dd`, `ssd`, `so`, `cargador`, `contrasena`, `falla`, `solucion`, `obs`, `tipo_servicio`, `total`, `estatus`, `fecha_entrega`, `fecha_llegada`, `id_caja`) VALUES
(339, 10312, 'Ruben de la Rosa', '4775272984', 60, 'CPU', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'CON CONTRASEÑA', '- FORMATEO SIN RESPALDO', '-Formateo sin respaldo\r\nentregado', '', '', 350, 6, '2023-11-24', '2023-11-15', NULL),
(340, 10313, 'INGENIO', '4776848353', 65, 'LAPTOP ', 'DELL', 'CORE I7', '16', 'SIN DATO', '512', 'WINDOWS 11 ', 'No', 'SIN CONTRASEÑA', '- LENTITUD EN EL EQUIPO ', '-FORMATEO', '', '', 350, 6, '2023-11-23', '2023-11-16', NULL),
(341, 10314, 'Enrique Barajas', '5616839631', 64, 'LAPTOP ', 'HP', 'AMD RYZEN 3', '8', 'SIN DATO', '256', 'WINDOWS 11 ', 'Sí', '241024', '-INSTALACION DE COREL ', '-INSTALACION DE COREL ', '', '', 350, 6, '2023-11-16', '2023-11-16', NULL),
(342, 10315, 'ALEJANDRO GUERRERO', '4772530044', 64, 'LAPTOP', 'DELL', 'CORE I5', '16', 'SIN DATO', '512', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '- ACTUALIZACION DE PROGRAMAS ', '-PDF\r\n-ACTUALIZACION DE WINDOWS Y PAQUETERIA', '- TECLA \"A\" Y SHIF BORROSAS\r\n- TAPA SUPERIOR Y TAPA INFERIOR CON RAYONES\r\nTOTAL $ 850+139 MOUSE  INAMABRICO ACTEK TOTAL $989', '', 989, 6, '2023-11-18', '2023-11-17', NULL),
(343, 10316, 'Jesus Hernandez ', '4771784955', 64, 'LAPTOP', 'acer', 'CELERON', '2', 'SIN DATO', 'SIN DATO', 'NO INICIA', 'No', 'SIN CONTRASEÑA', 'No inicia S.O', '- Instalar S.O sin Respaldo de información \r\n- Testear HDD\r\n- formateo sin respaldo entregado 25112023 issac', '', '', 350, 6, '2023-11-25', '2023-11-20', NULL),
(344, 10317, 'SAHARAI SAMAHARA', '4777293232', 60, 'cpu', 'hp', 'PENTIUM', '2', '320', '', 'WIN 7', 'No', 'SIN CONTRASEÑA', '-FORMATEO CON RESPALDO A WINDOWS 7', '-Formateo con respaldo 7', '', '', 500, 6, '2023-11-20', '2023-11-20', NULL),
(345, 10318, 'ROCIO REYNOSO', '4775978650', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN  DATO', 'Sí', 'SIN CONTRASEÑA', '-NO INICIA SISTEMA OPERATIVO\r\n-REVISAR DISCO\r\n- NO IMPORTA RESPALDO', '', '-CARGADOR CON CINTA', '', 350, 6, '2023-11-20', '2023-11-20', NULL),
(346, 10319, 'Daniel Rangel', '4774750903', 60, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- FORMATEO SIN RESPALDO', '', 'SIN LAS GOMAS EN LA TAPA DE ABAJO Y TAPA RAYADA', '', 350, 6, '2023-11-21', '2023-11-21', NULL),
(347, 10320, 'JORGE HERNANDEZ CHAVEZ', '4773551103', 65, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN  DATO', 'Sí', 'SIN CONTRASEÑA', '- NO ENCIENDE EL EQUIPO \r\n- SE LLEVO A DISTINTOS LUGARES DE REPARACION', '- CAMBIO DE BOTON DE ENCENDIDO\r\n- MOUSE INALMBRICO $139 ', '- CARCASA ROTA\r\n- TOUCHPAD DESCGASTADO\r\n- FALTA PLASTICO EN PARTE LATERAR DERECHA\r\n- MARCAS DE USO', '', 739, 6, '2023-11-29', '2023-11-21', NULL),
(348, 10321, 'MICHELL MUÑOZ', '4771326718', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN  DATO', 'No', 'SIN CONTRASEÑA', '- EQUIPO LENTO\r\n-SUCIEDAD DE POLVO', '- MANTENIMIENTO INTERNO $350\r\n- DISO DE ESTADO SOLIDO 240 SSD $490\r\n- FORMATO CON RSPALDO $500\r\n- TOTAL $1,340', '', '', 1340, 6, '2023-12-02', '2023-11-23', NULL),
(349, 10322, 'CARLOS ZERTUCHE', '4776462972', 60, 'LAPTOP', 'APPLE', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', '- REVISION EN GENERAL', '-CARGADOR DE MAC $590+IVA =$684 EN EFECTIVO ', '- NO SE REVISO', '', 684, 6, '2023-11-15', '2023-11-27', NULL),
(350, 10323, 'CARLOS ZERTUCHE', '4772740045', 64, 'IMAC', 'APPLE', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN DATO', 'llamar', '-SOLO REVISION NO QUISO EL SERVICIO NO SE COBRO', 'Rayas rosas en la pantalla, despostillada en lado derecho de la pantalla, raspones en carcasa', '', 0, 6, '2023-12-21', '2023-11-27', NULL),
(351, 10324, 'Mariana Cortes', '4731211902', 64, 'LAPTOP', 'LENOVO', 'CORE I7', '16', 'SIN DATO', '512', 'W10', 'Sí', 'Comercial2', 'Revisar y Cotizar Baterías', '', '', '', 0, 1, '0000-00-00', '2023-11-27', NULL),
(352, 10325, 'ALEJANDRO HERNADEZ', '4776293830', 65, 'CPU', 'ACTECK', 'CORE I5', '16', '2 TB', 'SIN DATO', 'W11', 'No', 'Aa35958614', '- VIRUS, CAMBIO FORMATO DE ARCHIVOS Y LOS CIFRO Y TRATAR DE RECUERAR ARCHIVOS', '-100 REVISION  NO SE PUDO SOLUCIONAR', '', '', 100, 6, '2023-12-01', '2023-12-01', NULL),
(353, 10326, 'ALEJANDRO HERNANDEZ', '4776293830', 65, 'CPU', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-NO DA VIDEO, TUVIERON UN APAGON', '', '', '', 0, 1, '2023-12-11', '2023-12-04', NULL),
(354, 10327, 'RICARDO GUTIERREZ', '4778272970', 64, 'LAPTOP ', 'LENOVO', 'INTEL CELERO', '2', 'SIN DATO', '30', 'WIN 10', 'Sí', '2010', '- FORMATEO SIN RESPALDO\r\n-REVISAR SI SE PUEDE HACER CAMBIO DE DISCO DE ALMACENAMIENTO', '- FORMATEO SIN RESPALDO', 'TODAS LAS ESQUINAS CON RASPONES Y TAPA SUPERIOR Y INFEIOR CON RAYONES', '', 350, 6, '2023-12-08', '2023-12-05', NULL),
(355, 10328, 'ANGELES GRANADOS', '4721113815', 65, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'SIN DATO', 'WIN 10', 'Sí', 'paola1847', '-Formateo con respaldo\r\n- Respaldo se manda a otro disco\r\n- Pedir la bateria deja anticipo', '-Formateo con respaldo $500 \r\n-  bateria $790\r\n- total $1,290', '', '', 1290, 6, '2023-12-18', '2023-12-08', NULL),
(356, 10329, 'MIRIAM LUNA GENERAL OPERADOR', '4777507474', 64, 'LAPTOP ', 'LENOVO/DELL', 'CORE I7/CORE I5', '16/12', 'SIN DATO ', '256/480', 'WIN 10/11', 'Sí', 'fer14129 / sin contraseña', '-LENOVO\r\n-COTIZAR BATERIA NO RETIENE CARGA\r\nDELL\r\n-REVISAR CONEXION A INTERNET SE DESACTIVA Y CONTROLADORES FALTANTES Y REVISAR BATERIA', '-ACTUALIZACION DE CONTROLADORES', '', '', 100, 6, '2023-12-08', '2023-12-08', NULL),
(357, 10330, 'Eduardo Tmayo', '4775789559', 64, 'LAPTOP', 'DELL', 'CORE I7', '16', 'SIN DATO ', '512', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '- ACTUALIZACIONES DE SSITEMA', '-Activacion del autocad', '-ESQUINA SUMIDA MUY PEQUEÑA', '', 100, 6, '2023-12-08', '2023-12-08', NULL),
(358, 10331, 'INGENIO', '4776848353', 65, 'CPU', 'ARMADO', 'SIN DATO', ' SIN DATO ', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-ENCIENDE PERO NO DA VIDEO', '- MEMORIA RAM DE 4 GB INSTALADA ACAMBIO ', '-PROTECTOR DE DISCOS ESTA SUMIDA', '', 590, 6, '2023-12-20', '2023-12-13', NULL),
(359, 10332, 'ANGEL MARTINEZ', '4775763357', 64, 'CPU', 'DELL', 'CORE I5', '8', '1', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-NO INICIA EL SISTEMA OPERATIVO\r\n- SI OCUPA RESPALDO', '- SISTEMA OPERATIVO CON RESPALDO $500\r\n- DISCO SOLIDO 960 \r\n- BOCINAS ACTECK $205\r\n- TOTAL $1,605', '', '', 1605, 6, '2023-12-16', '2023-12-14', NULL),
(360, 10333, 'Amalia Valdivia', '0', 64, 'laptop', 'acer', 'sin dato', 'sin dato', 'sin dato', 'sin dato', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'Pantallas azules. ', 'no se dio el servicio', '', '', 100, 6, '0000-00-00', '2023-12-14', NULL),
(361, 10334, 'Jesus Posada', '4774488860', 64, 'LAPTOP', 'LENOVO', 'AMD E1', '4', '160', '', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- SE SIENTE LENTA REVISAR QUE SE PUEDE HACER', '- FORMATEO CON RESPALDO $350\r\n-  MEMORIA RAM DE 4 GB $490\r\n- TOTAL $840 + COMISION $876.62', '- DAR SOLUCION ANTES DEL DIA MARTES', '', 876.62, 6, '2023-12-19', '2023-12-15', NULL),
(362, 10335, 'IGNACIO VAZQUEZ', '4771610527', 60, 'CPU', 'HP', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- ENCIENDE PERO NO DETECTA EL DISCO REVISAR', '-DISCO DE 240 GB SSD $490\r\n- SISTEMA OPEARTIVO SIN RESPALDO $350', '', '', 840, 6, '2023-12-28', '2023-12-15', NULL),
(363, 10336, 'Tomas Tadeo Muñoz ', '4792255917', 64, 'CPU', 'LENOVO', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'Prende pero no da Video.', 'Se removió polvo y se limpio memoria RAM.', '', '', 150, 6, '2023-12-15', '2023-12-15', NULL),
(364, 10337, 'ALBERTO SANCHEZ', '4772176687', 64, 'CPU', 'LENOVO', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'HopeWorld', '- NO INICIA SISTEMA REVISAR SISTEMA OPERATIVO Y DISCO DURO\r\n', '- FORMATEO CON RESPALDO $500\r\n- DISCO SOLIDO 480 GB KINSTONG $590\r\n- TOTAL $1,090', '', '', 1090, 6, '2023-12-20', '2023-12-16', NULL),
(365, 10338, 'CARLOS GUSTAVO CIELO DE LA ROSA', '5576330459', 64, 'LAPTOP', 'ACER', 'CORE I5', '8', 'SIN DATO', ' SIN DATO', 'WIND 11', 'No', '637274', '-REVISION DE MEMORIA RAM PARA AUMENTO', '-Memoria ram de 16 gb costo de $1,600 pesos 1500 en efectivo y 104.36 en tarjeta', '', '', 1600, 6, '2023-12-25', '2023-12-18', NULL),
(366, 10339, 'ALFONSO MARTINEZ', '4776477193', 64, 'LAPTOP', 'HP', 'CORE I5', '8', '1 TB', '240', 'WIND 11', 'Sí', '290813', '- REVISAR ERROR DE WINDOWS, ACTUALIZACION DE BIOS Y SISTEMA $150\r\n- MANTENIMIENTO INTERNO $600\r\n- COTIZAR BATERIA', '', '-ESQUINA DOBLADA\r\n- TOUCH PAD DESGASTE', '', 750, 6, '2023-12-26', '2023-12-19', NULL),
(367, 10340, 'ILIANA MICHELLE MARTINEZ FUENTES', '4777005495', 64, 'LAPTOP', 'DELL', 'CORE I7', '8', '1 tb', '128', 'SIN DATO', 'Sí', 'IMF68046', '- NO INICIA EL SISTEMA OPERATIVO \r\n- OCUPA RESPALDO DE INFORMACION', '-MANTENIMIENTO GAMER $750\r\n- FORMATEO CON RESPALDO $500\r\n- SSD DE 1 TERA KINSTONG M.2 $1,100\r\n- TOTAL $2,350\r\n- ENTREGA ISSAC 05-01-2024', '- QUEBRADA DE LADO DERECHO', '', 2350, 6, '2024-01-05', '2023-12-20', NULL),
(368, 10341, 'JUAN HERRERA', '4776634733', 64, 'CPU', 'ARMADO', 'CORE I3', '4', 'SIN DATO', '240', 'WIND 10', 'No', 'Pas1234', '- MANTENIMIENTO INTERNO\r\n- AUMENTO DE RAM A  8 GB\r\n- ACTIVACION DE OFFICE', '- MANTENIMIENTO INTERNO $350\r\n- AUMENTO DE RAM A  4 GB $490\r\n- ACTIVACION DE OFFICE $0\r\n- BOCINAS MARCA ACTECK $215\r\n- TOTAL $1,055', '', '', 1055, 6, '2023-12-21', '2023-12-20', NULL),
(369, 10342, 'MONICA HERNANDEZ', '4792300980', 60, 'LAPTOP/CPU', 'HP/ARMADO', 'SIN DATO/AMD A10', 'SIN DATO/4 GB', 'SIN DATO/1 TB', 'SIN DATO', 'SIN DATO/ WIND 10', 'Sí', 'uliloleando64/ SIN CONTRASEÑA', '-LAPTOP HP NO ENCIENDE \r\n- CPU MANTENIMIENTO INTERNO + SISTEMA OPERATIVO SIN RESPALDO', 'CPU: MANTENIMIENTO $350, FORMATEO SIN RESPALDO $350, FUENTE DE PODER $415\r\nLAPTOP: SE DRENO ENERGIA Y RESETEO DE BIOS $200', '', '', 1315, 6, '2023-12-29', '2023-12-22', NULL),
(370, 10343, 'Rafael Sanchez', '4771410956', 64, 'LAPTOP', 'DELL', 'SIN DATO', ' SIN DATO', 'sin dato', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- PANEL DE CONTROL DE AUDIO', '- PANEL DE CONTROL DE AUDIO', '', '', 150, 6, '2023-12-22', '2023-12-22', NULL),
(371, 10344, 'ALONDRA RAMIREZ', '4773987705', 64, 'LAPTOP', 'HP', 'CORE I5', '8', '320', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- CAMBIO DE DISCO A SSD DE 960 GB $890\r\n- FORMATEO CON RESPALDO $500\r\n- MANTENIMIENTO INTERNO $350\r\n- TOTAL $1,740', 'SE REALIZO TODO EL SERVICIO', '- DETALLES ESTETICOS EN CARCASA', '', 1740, 6, '2023-12-29', '2023-12-27', NULL),
(372, 10345, 'JORGE ERNESTO ARANDA', '4775942443', 65, 'LAPTOP', 'HP', 'CORE I5', '8', '1 TB', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- MANTENIMIENTO COMPLETO GAMING\r\n- PENDIENTE POR CAMBIO DE DISCO Y FORMATO\r\n- COTIZACION DE CARGADOR\r\n- WINDOWS 11 ', '- DISCO M2 500 GB $790\r\n- SISTEMA OPERATIVO $350\r\n-MANTENIMIENTO GAMER $750\r\n-CARGADOR 590+COMISION $615.72', '- CARGADOR ENTREGA PERO ESTA DAÑADO', '', 2505.72, 6, '2023-12-31', '2023-12-28', NULL),
(373, 10346, 'GUSTAVO TRUJILLO', '4778596771', 60, 'CPU', 'HP', 'CORE I5', '4', '250', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO', '- MANTENIMIENTO INTERNO $350', '', '', 350, 6, '2023-12-29', '2023-12-28', NULL),
(374, 10347, 'ALEJANDRO HERNANDEZ', '4776293830', 60, 'LAPTOP', 'HP', 'INSIDE', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- REVISAR DISCO ANALIZAR POR QUE TIENE POCO QUE SE CAMBIO\r\n- Y POSIBLE SISTEMA DAÑADO', '- FORMATEO SIN RESPALDO $ 350\r\n- DISCO SOLIDO DE 120 GB $390', '', '', 740, 6, '2024-01-03', '2023-12-28', NULL),
(375, 10348, 'FERNANDO MARTINEZ', '4777862228', 65, 'cpu', 'DELL OPTIPLEX', 'CORE 2 DUO', '4', '160', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO\r\n-NO INICIA EL SISTEMA Y REINICIA LA IMAGEN\r\n- CLIENTE INDICA QUE SE LE CONGELABA EN PANTALLA NEGRA\r\n- NO HAY ACCESO A HERRAMIENTAS DE SISTEMA', 'Mantenimiento fisico completo $350\r\ncambio de disco 160 gb sin sistema $150', 'no se instalo el sistema operativo. ', '', 500, 6, '2024-01-04', '2023-12-28', NULL),
(376, 10349, 'ROBERTO RIZO', '4772818408', 0, '2 CPU', 'ARMADO', 'CORE I5/ core i3', '8/4', '240 ', '1 TB/500', 'WIND 10/w7', 'No', 'SIN CONTRASEÑA', '- CLIENTE COMENTA QUE SE APAGA\r\n- FORMATEO CON RESPALDO\r\ncpu 2 core i3:\r\nrevisar programa de aspel si se puede respaldar y pendiente de confirmar con cliente.', '-3 MANTENIMIENTOS INTERNOS $1,050\r\n- 3 FORMATEOS CON RESPALDO $1,500\r\n- 2 DISCOS SOLIDOS DE 480 GB SSD $980\r\n- TOTAL $3,530 EFECTIVO \r\nENTREGA ISSAC 05-01-2024', '- TAPA EN LA PARTE DE LAS PCI', '', 3530, 6, '2024-01-05', '2023-12-30', NULL),
(377, 10350, 'SERGIO LUNA HERNANDEZ', '4771445338', 64, 'LAPTOP/CPU', 'HP/MAC', 'CORE 2 DUO/SIN DATO', '4/SIN DATO', '240 SSD/SIN DATO', 'SIN DATO', 'WINDOWS 7', 'No', 'SIN CONTRASEÑA', 'LAPTOP HP\r\n- DESITALACION DE JUEGOS\r\n-COTIZAR BATERIA\r\n- CHECAR TECLA 0\r\n\r\nCPU\r\n- NO DA VIDEO\r\n- SI SE REPARA REVISAR QUE NECESITA', '- SE ENTREGO LAPTOP 04/01/2024 ANGELES  $150 PAGO EN EFECTIVO COBRADO\r\n- CPU ENTREGADO SOLO REVISION $100 11/01/2024 ISAAC ENTREGA', '- LAPTOP NO TIENE LA TECLA 0 *DEJA UNA WIFI EXTERNA\r\n- CPU ', '', 100, 6, '2024-01-11', '2023-12-30', NULL),
(378, 10351, 'CRISTIAN  HERNANDEZ', '4774125223', 64, 'CPU', 'LANIX', 'CORE I5', '6', 'SIN DATO', '480', 'WIND 10', 'No', 'OLD2019WEST', '- SE DISTORCIONA LA IMAGEN', '-MANTENIMIENTO INTERNO $350\r\n- SE LIMPIO LA RAM', 'DETALLES ESTETICOS DE USO', '', 350, 6, '2024-01-08', '2024-01-02', NULL),
(379, 10352, 'JOSE CRUZ MEDINA', '4771709858', 60, 'LAPTOP', 'DELL', 'CORE 2 DUO', '4', 'SIN DATO', '64', 'WINDOWS 7', 'No', 'SIN CONTRASEÑA', '-MANTENIMIENTO INTERNO', '-MANTENIMIENTO INTERNO $350', '', '', 350, 6, '2024-01-05', '2024-01-02', NULL),
(380, 10353, 'Eustaquio Morales', '4771069687', 64, 'CPU', 'ARMADO', 'core i7', 'sin dato', 'sin dato', 'sin dato', 'w10', 'No', 'SIN CONTRASEÑA', 'No inicia S.O\r\n-Prende pero se apago 2 veces después de tiempo de encendido aquí en revisión.', 'Cambio a disco de estado solido 2 tb sagate $1550\r\nservicio de revición e instalación de disco $100\r\n\r\n', '', '', 1650, 6, '0000-00-00', '2024-01-02', NULL),
(381, 10354, 'CARLOS RODRIGUEZ', '5511189701', 64, 'LAPTOP', 'HP', 'CELERON', '8', '1 TB', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '-CAMBIO DE DISCO A 480 GB SSD  $590\r\n- FORMATEO CON RESPALDO $500\r\n- TOTAL $1,090', '-CAMBIO DE DISCO A 480 GB SSD  $590\r\n- FORMATEO CON RESPALDO $500\r\n- TOTAL $1,090 +$79 pesos ', '- FALTA UNA GOMA', '', 1169, 1, '2024-01-06', '2024-01-05', NULL),
(382, 10355, 'PATRICIA GOMEZ GONZALEZ', '4774114631', 65, 'CPU', 'ARMADO', ' CORE 2 DUO', '3', '250', 'SIN DATO', 'WINDOWS 10', 'No', 'SIN CONTRASEÑA', '-MANTENIMIENTO INTERNO\r\n-REVISION DE BIOS\r\n-reisar por cable vga', '-MANTENIMIENTO INTERNO $350\r\n- CAMBIO DE BATERIA BIOS $50\r\n-CABLE VGA $69\r\n- TOTAL $469 EFECTIVO ISSAC ', '', '', 469, 6, '2024-01-10', '2024-01-05', NULL),
(383, 10356, 'NANCY ALEJANDRA CARRILLO ARANDA', '4772752917', 65, 'LAPTOP', 'HP', 'CELERON', '4', '500', 'SIN DATO', 'WIND 10', 'Sí', 'Licaf:)*19', '- CAMBIO DE DISCO A SSD DE 120 GB \r\n- FORMATEO SIN RESPALDO', '- DISCO A SSD DE 120 GB  $390\r\n- FORMATEO SIN RESPALDO $350\r\n- TOTAL $740', '- CARCASA BLANCA CON MANCHAS DE USO', '', 740, 6, '2024-01-11', '2024-01-06', NULL),
(384, 10357, 'JESUS CARREON', '4771298302', 65, 'LAPTOP', 'HP', 'CORE I3', '8', '1 TB', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- INSTALACION DE DISCO SOLIDO \r\n- SISTEMA OPERATIVO SIN RESPALDO DE INFORMACION', 'Unidad de estado solido 240 gb $490\r\nInstalación de s.o $350', '', '', 840, 6, '2024-01-15', '2024-01-08', NULL),
(385, 10358, 'ALEJANDRO VILLEGAS VELAZQUEZ', '4778344789', 65, 'LAPTOP ', 'HP ', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '7050321', '- NO ENCIENDE\r\n- NO INICIA SISTEMA', '- SOLO REVISION', '-CARGADOR CON CABLES ESPUESTOS', '', 100, 6, '2024-01-10', '2024-01-08', NULL),
(386, 10359, 'JUAN HERRERA', '4776634733', 64, 'LAPTOP', 'HP', 'AMD A8', '8', '500', 'SIN DATO', 'WIN 10', 'Sí', 'Gmail1052', '- FORMATEO SIN RESPALDO $350\r\n- CAMBIO DE DISCO SSD 120 GB $390\r\n- MANTENIMIENTO INTERNO $350\r\n- TOTAL $ 1,090', '', '- DOS TORNILLOS FALTANTES\r\n- QUEBARADA EN LA TAPA SUPERIOR ESQUINA DERECHA ', '', 1090, 1, '2024-01-16', '2024-01-09', NULL),
(387, 10360, 'CESAR SEGURA', '4775735515', 64, 'ALL IN ONE ', 'HP', 'CORE 2 DUO', '4', '320', 'SIN DATO', 'WINDOWS 7', 'Sí', 'SIN CONTRASEÑA', '-MANTENIMIENTO FISICO $590 PAGADO EFECIVO\r\n- MAS REVISION  $100 FALTA DE LIQUIDAR NO SE COBRO', '-MANTENIMIENTO FISICO $590 PAGADO EFECIVO', '-QUEBADO PLASTICO LADO IZQUIERDO', '', 590, 6, '2024-01-12', '2024-01-09', NULL),
(388, 10361, 'RUBEN DE LA ROSA ', '4775272984', 60, 'CPU ', 'LENOVO', 'CORE I5', '8', '250', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- FORMATEO SIN RESPALDO ', '- ACTUALIZACION DE SISTEMA ', '', '', 350, 1, '2024-01-09', '2024-01-09', NULL),
(389, 10362, 'PATRICIA GOMEZ GONZALEZ', '4774114631', 65, 'LAPTOP', 'GTO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- COTIZAR CARGADOR', '', '- NO CUENTA CON LAS GOMAS FRONTALES\r\n- FALTA UNA GOMA DE LAS GOMAS ESQUINA', '', 0, 1, '2024-01-17', '2024-01-10', NULL),
(390, 10363, 'OLEGARIO JUEAREZ RIVERA', '4777551482', 65, 'IMAC', 'APPLE', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- No inicia SISTEMA O.\r\n', '- DISCO DE 960 GB SSD $990\r\n- INSTALACION DEL SISTEMA $690\r\n- REVISION DE FUENTE DE PODER $150\r\n- TOTAL $1,830', '4732942119', '', 1830, 6, '2024-04-09', '2024-01-10', NULL),
(391, 10364, 'DANIELA MIRELES', '4778453188', 64, 'LAPTOP', 'DELL', 'CORE I5', '12', '500 GB', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '-REVISION DE BISAGRADAS', 'reparación de bisagras y cables que se conectan awifi', '- UNA DE BISAGRAS COMPLEMENTEN DESPEGADA TENER CUIDADO AL ABRIRLA\r\n- CLICK DERECHO NO FUNCIONA\r\n-  DEL OTRO LADO DE BISAGRA  PLASTICO ROTO\r\n- PEQUEÑA SUMIDA EN LA TAPA SUPERIOR', '', 800, 6, '2024-01-11', '2024-01-11', NULL),
(392, 10365, 'MIRIAM', '0', 64, 'LAPTOP', 'HP', 'PENTIUM', '8', '500', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '-EQUIPO LENTO\r\n', '-CAMBIO DE DISOC SOLIDO DE 240 GB SSD $490\r\n- SISTEMA OPERATIVO $350\r\n- BATERIA $780\r\n- TOTAL $1,620', '- TAPA SUPERIOR QUEBRADA DE LADO DERECHO', '', 1620, 6, '2024-01-12', '2024-01-11', NULL),
(393, 10366, 'MANUEL JIMENEZ', '4771353471', 64, 'ALL IN ONE', 'HP', 'CORE I5', '12', '2 TB', 'SIN DATO', 'WIN 10', 'Sí', 'Esomamona69', '- ESTA LENTA REVISAR \r\n- REVISAR QUE DISCO DE ESTADO SOLIDO SOPORTA\r\n-LLAMAR AL CLIENTE', '- DISCO SOLIDOS 960 GB SSD $990\r\n- SISTEMA OPERATIVO $350\r\n- DISCO EXTERNO 1 TERA$1,250\r\n- TOTAL MAS IVA $1,340 TRAANFERENCIA', '', '', 1340, 6, '2024-02-12', '2024-01-11', NULL),
(394, 10367, 'JORGE LEON', '4777021581', 65, 'CPU', 'ARMADO', 'CORE I7', '32', '2 TERAS', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- NO FUNCIONA BARRA DE TAREAS\r\n- FORMATEO CON RESPALDO\r\n- PARTICIONARL EL DISCO 500 GB/1500 GB\r\n- BUSCAR UNA CARPETA LLAMADA 1 CUADROS', '-FORMATEO CON RESPALDO', '', '', 500, 6, '2024-01-12', '2024-01-11', NULL),
(395, 10368, 'ALBERTO VILCHES', '4776829705', 60, 'LAPTOP', 'LENOVO', 'CORE I7', '16', 'SIN DATO', '256', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '-COTIZAR BATERIA', 'BATERIA NUEVA', '', '', 2900, 6, '2024-01-25', '2024-01-11', NULL),
(396, 10369, 'MONICA MONAJARAZ', '4772217973', 65, 'CPU 2', 'ARMADO/ ARMADO', 'SIN DATO/ SIN DATO', 'SIN DATO/ SIN DATO', 'SIN DATO/ SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/ SIN DATO ', 'No', 'SIN CONTRASEÑA', '- UN CPU NO ENCIENDE\r\n-EL OTRO NO DA VIDEO', 'CPU DELL: limpieza RAM + Memoria ram 4 gb $490\r\nCPU ARMADO: CAMBIO DE FUENTE $599 + $150', 'DETALLES DE USO', '', 1399, 6, '2024-01-18', '2024-01-11', NULL),
(397, 10370, 'SUASANA GALVAN NAVA', '4791472140', 60, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- COTIZAR JACK DE ENTRADA', '- SE REPARO JACK DE CARGA SE REMPLAZA PIEZA QUEDA IGUAL POR FUERA', '- JACK SALIDO POR FUERA ', '', 290, 6, '2024-01-18', '2024-01-11', NULL),
(398, 10371, 'MA DE LOURDES HERNADEZ', '4771065153', 64, 'LAPTOP', 'DELL', 'CORE 2 DUO', '4', '80', '', 'WIN 7', 'No', 'SIN CONTRASEÑA', '- FORMATEO CON RESPALDO INSTALAR WINDOWS 10', '- FORMATEO CON RESPALDO INSTALAR WINDOWS 10', 'NO TRAE EL TRANSPOINT', '', 500, 6, '2024-01-23', '2024-01-16', NULL),
(399, 10372, 'Gabriela Medrano ', '4774494041', 65, 'LAPTOP', 'HP', 'CORE I7 ', '8', '1 TB ', '', 'WIN10', 'No', 'SIN CONTRASEÑA', '-realizar Mantenimiento y actualizaciones', '- Mantenimiento completo preventivo: $750\r\n- Actualizaciones de S.O $100', '', '', 850, 6, '0000-00-00', '2024-01-19', NULL),
(400, 10373, 'Edgar Flores ', '4771551363', 64, 'LAPTOP', 'HP', 'Core i5', '8', '320', '', 'WIN10', 'Sí', 'flores2024', '- instalación de SSD 480 GB SSD\r\n- Instalación de S.O + Respaldo de info', '- instalación de SSD 480 GB SSD $590\r\n- Instalación de S.O + Respaldo de info $500\r\n- Respaldar Archivos -MM&Consultores en disco local c: ', '- carcasa pra case $149', '', 1239, 6, '2024-01-19', '2024-01-19', NULL),
(401, 10374, 'CONY ALMAGUER', '4776415144', 64, 'LAPTOP', 'MACBOOK AIR', 'CRE I3', '8', 'SIN DATO', '251', 'CATALINA', 'Sí', '2024', '- INSTALACION DE OFFICE', '', '-LADO DERECHO GOLPE\r\n- LADO IZQUIERDO', '', 590, 6, '2024-01-26', '2024-01-20', NULL),
(402, 10375, ' CONY ALMAGUER', '4776415144', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- SACAR RESPALADO DE INFORMACION\r\n-CLIENTE CONFIRMA REPARACION DE EQUIPO', 'No se realizo el servicio', '-CARCASA LADO DERECHO ROTA\r\n-BISABRA DERECHA FRAGIL\r\n-CARCASA ROTA EN LOS PUERTOS IZQUIERNOS', '', 0, 6, '2024-01-27', '2024-01-20', NULL),
(403, 10376, ' CONY ALMAGUER', '4776415144', 64, 'LAPTOP', ' HP CROMBOOK', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-PRIMERO PENDIENTE DE CONFIRMAR AL CLIENTE\r\n- SI ENCIENDE PERO NO INICIA SISTEMA\r\n', 'No se realizo el servicio', '', '', 0, 6, '2024-01-27', '2024-01-20', NULL),
(404, 10377, 'CONY ALMAGUER', '4776415144', 64, 'LAPTOP', 'DELL', 'CORE I3', '4', '500', 'SIN DATO', 'WIN 8', 'Sí', 'cao27', '-pendiente de confirmar servicio\r\n- con virus, paqueteria de office desactivada y lentitud', '', '', '', 350, 6, '2024-01-27', '2024-01-20', NULL),
(405, 10378, 'RENE LOPEZ', '4774152840', 65, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'tanery001', '- ENCIENDE PERO NO DA VIDEO', '- ACTUALIZACION BIOS Y RECONFIGURACION DE LA MISMA\r\nENTREGA ISSAC 27012024', '', '', 200, 6, '2024-01-27', '2024-01-22', NULL),
(406, 10379, 'MARIANO MORENO', '4773098067', 65, 'LAPTOP', 'HP', 'CORE I3', '8', '1 TB ', 'SIN DATO', 'WIN10', 'No', 'SIN CONTRASEÑA', '-COTIZAR BATERIA\r\n-COTIZAR REPARACION DE BISAGRAS', '- REPARACION ED BISAGRAS $1,500\r\n- BATERIA HP DE $700', 'BISAGRAS DESPEGADAS DE LA TAPA', '', 2200, 6, '2024-02-01', '2024-01-23', NULL),
(407, 10380, 'Veronica Perez', '4775592660', 65, 'LAPTOP', 'HP', 'celeron', '', '', '62', 'w11', 'Sí', 'Alexa231212', '-Actualización sistema 2021\r\n- Configuración Modo\r\n-Desinstalar antivirus Mcafy ', '- Instalación de office\r\n- condiguracion modo s\r\n- desintalar Mcafy', '', '', 450, 6, '2024-01-24', '2024-01-23', NULL),
(408, 10381, 'SANDRA ORTIZ', '4776848353', 65, 'CPU', 'DELL', 'XEON', '2', '2 TB', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO INICIA SISTEMA', '- REVISION DE DISCO $100\r\n- Y DE SISTEMA $100\r\nSE ENTREGA DISCO DURO DAÑADO APARTE', '', '', 200, 6, '2024-01-24', '2024-01-23', NULL),
(409, 10382, 'DAVID NARVAEZ', '4772749670', 65, 'LAPTOP', 'DELL', 'Core i5', '8', 'SIN DATO', '240', 'WIN10', 'Sí', 'SIN CONTRASEÑA', '- COTIZAR PANTALLA Y TAPA SUPERIOR Y TECLADO ', '', '- TAPA QUEBRADA, RASPADA EN TAPA INTERIOR, LINEA EN PANTALLA', '', 0, 1, '2024-01-30', '2024-01-23', NULL),
(410, 10383, 'TAMAR COLEGIO MORA', '4778514939', 60, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'm4m4l', '-NO ENCIENDE POSIBLE CORTO EN PLACA MADRE', '', '-SIN BATERIA\r\n-FALTAN TORINILLOS EN TAPA\r\n- QUEBARADA EN LA TAPA DE ABAJO', '', 0, 1, '2024-02-08', '2024-01-25', NULL),
(411, 10384, 'MOISES ROMERO', '4772411161', 65, 'LAPTOP', 'ACER', 'CORE I3', '8', 'SIN DATO', '256', 'w11', 'Sí', '2048', '-REPARACION DEBISAGRA IZQUIERDA EN PANTALLA', '-REPARACION DE BISAGRA $1,400\r\n-MANTENIMIENTO INTERNO $350\r\n', '-TAPA IZQUIERDA EN PURTO USB', '', 1750, 6, '2024-02-07', '2024-01-26', NULL),
(412, 10385, 'JUAN JOSE RAMIREZ', '4771735268', 65, 'LAPTOP', 'RCA', 'PENTIUM', '4', 'SIN DATO', '120', 'WIN 11', 'Sí', 'fertorres21', '- ACTUALIZACIONES SOLICITADAS POR EL CLIENTE PAQUETERIA OFF', '', '', '', 450, 1, '2024-01-26', '2024-01-26', NULL),
(413, 10386, 'ENRIQUE BARAJAS', '4776192499', 64, 'CPU', 'LENOVO', 'AMD A8', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN10', 'No', 'SIN CONTRASEÑA', '- REVISAR POR LENTITUD', '- ACTUALIZACION DEL SISTEMA Y REVISION\r\n$174 FACTURADO', '', '', 174, 6, '2024-01-30', '2024-01-26', NULL),
(414, 10387, 'Sergio Aguilar ', '4777043753', 65, 'AIO', 'DELL', 'PENTIUM', '4', '160', 'SIN DATO', 'WIN10', 'Sí', 'SIN CONTRASEÑA', '-WIFI CONECTADO MARCA REDES SIN ACCESO.\r\n- ETHERNET NO RECONOCIDO \r\n', '-CONFIGURACION DE DISPOSITIVO WIFI', '', '', 250, 6, '2024-01-30', '2024-01-29', NULL),
(415, 10388, 'Cesar Romero', '4773799524', 65, 'LAPTOP', 'DELL', 'Core i5', '16', 'SIN DATO', '480', 'WIN10', 'Sí', 'Millo2023, 0405', 'Actualizaciones solicitadas por cliente', 'Actualizaciones', '', '', 350, 6, '2024-01-30', '2024-01-30', NULL),
(416, 10389, 'Beatriz Banda', '4772605049', 65, 'LAPTOP', 'DELL', 'Core i5', '8', '1 TB ', 'SIN DATO', 'WIN10', 'Sí', 'Fran0055   ó 0055 cualquiera de esas dos', '- Formateo con respaldo por que se traba mucho', '-MANTENIMIENTO INTERNO $350\r\n- ACTUALIZACION DEL SISTEMA $200\r\n- TOTAL $550 EFECTIVO MARIA CAUDILLO ENTREGA ', '-BISAGRA DERECHA FLOJA\r\n', '', 550, 6, '2024-02-07', '2024-01-30', NULL),
(417, 10390, 'ANTONIO ESCAREÑO ', '4777934275', 65, 'LAPTOP', 'ACER', 'RYZEN 5', '8', 'SIN DATO', '960', 'WIN10', 'Sí', '0211', '- REPARACION DE BISAGRASA REVISAR Y PASAR COSTO LE INTERESA', '-SE REPARO BISAGRA', '-BISAGRA ROTA', '', 1500, 6, '2024-02-10', '2024-01-30', NULL),
(418, 10391, 'JUANA MORA', '4779078569', 65, 'LAPTOP/LAPTOP', 'LENOVO/GTO', 'AMD A6/ SIN DATO', '8GB/SIN DATO', '1 TB/SIN DATO', 'SIN DATO/SIN DATO', 'WIN10/WIN 10', 'Sí', 'SIN CONTRASEÑA', 'FORMATO SIN RESPALDO EN AMBOS EQUIPOS', '- 2 FORMATEOS SIN RESPALDO $700\r\n- 1 CARGADOR LENOVO $500\r\n- TOTAL $1,200 ENTREGA ANGELES', 'LENOVO\r\n- 3 TORNILLOS FALTANTES, 3 GOMAS EN LA PARTE DE ABAJO, MARCAS DE USO\r\n GTO\r\n-GOMA EN LA TAPA DE ABAJO', '', 1200, 6, '2024-02-03', '2024-01-31', NULL),
(419, 10391, 'JUANA MORA', '4779078569', 65, 'LAPTOP/LAPTOP', 'LENOVO/GTO', 'AMD A6/ SIN DATO', '8GB/SIN DATO', '1 TB/SIN DATO', 'SIN DATO/SIN DATO', 'WIN10/WIN 10', 'Sí', 'SIN CONTRASEÑA', 'FORMATO SIN RESPALDO EN AMBOS EQUIPOS\r\n- COTIZAR CARGADOR LAPTOP LENOVO\r\n- REVISION DE BATERIA EN LA LENOVO', '', 'LENOVO\r\n- 3 TORNILLOS FALTANTES, 3 GOMAS EN LA PARTE DE ABAJO, MARCAS DE USO\r\n GTO\r\n-GOMA EN LA TAPA DE ABAJO', '', 0, 1, '2024-02-07', '2024-01-31', NULL),
(420, 10392, 'ENRIQUE BARAJAS', '4776192499', 64, 'LAPTOP', 'HP', 'AMD RYZEN 3', '8', 'SIN DATO', ' SIN DATO', 'SIN DATO', 'Sí', '241024', '- QUITAR CONTRASEÑA SI NO FORMATEO SIN RESPALDO\r\n-INSTALACION DE COREL\r\n', '- FORMATEO SIN PRESPALDO $350\r\n- instalar corel $250 \r\n-600+iva = $696 pago en tranferencia', '', '', 696, 6, '2024-02-06', '2024-02-03', NULL),
(421, 10393, 'JESUS GARCIA', '4791408161', 65, 'LAPTOP', 'TOSHIBA', 'CELERON', '4', '250', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- INSTALACIONDE AUTOCAD', '-INSTALACION DE AUTOCAD', '-FALTAN TORNILLOS EN LA PARTE DE ABAJO', '', 350, 6, '2024-02-07', '2024-02-06', NULL),
(422, 10394, 'Omar Alvarado', '4777524019', 65, 'LAPTOP', 'MACBOOK AIR', 'CORE I5', '8', 'SIN DATO', '256', 'Monterey', 'Sí', 'cococactus', '- MANTENIMIENTO INTENRNO', '-MANTENIMIENTO INTENRNO', '- GOLPE EN LADO IZQUIERD', '', 590, 1, '2024-02-06', '2024-02-06', NULL),
(423, 10395, 'ARMANDO MELCHOR REVILLA', '4773962955', 64, 'LAPTOP', 'MACBOOK PRO', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-REVISAR SISTEMA OPERATIVO, NO INICIA, DISCO QUE NO ESTE DAÑADO', '', '- FALTA UNA GOMA APARTE DE ABAJO OTRA SE DESPEGA, FALTA UN TORNILLO', '', 100, 6, '2024-03-11', '2024-02-07', NULL),
(424, 10396, 'MAYRA NEGRETE', '4774138375', 65, 'LAPTOP', 'DELL', 'CORE I5', '8 RAM', 'SIN DATO', '128 GB', 'WIN 10 ', 'Sí', 'SIN CONTRASEÑA', '-ACTUALIZACIONES DE OFFICE', '', '', '', 350, 1, '2024-02-15', '2024-02-08', NULL),
(425, 10397, 'CESAR LOPEZ', '4771231126', 64, 'LAPTOP', 'DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- NO ENCIENDE', '- SE CONECTO BOTON DE ENCENDIDO', '', '', 200, 6, '2024-02-12', '2024-02-09', NULL),
(426, 10398, 'Orlando Valadez', '4771156421', 65, 'LAPTOP', 'HP', 'CORE I3', '4', 'SIN DATO ', 'SIN DATO', 'WIN 10', 'Sí', '4750', '-NO INICIA SISTEMA\r\n- BIOS SE REINICIA', '', '', '', 0, 1, '2024-02-17', '2024-02-10', NULL),
(427, 10398, 'Orlando Valadez', '4771156421', 65, 'LAPTOP', 'HP', 'CORE I3', '4', 'SIN DATO ', 'SIN DATO', 'WIN 10', 'Sí', '4750', '-NO INICIA SISTEMA\r\n- BIOS SE REINICIA', '- Instalacion de disco solido ssd M.2 $1,090\r\n- Sistema Operativo + instalacion del disco $490', '', '', 1540, 6, '2024-02-17', '2024-02-10', NULL),
(428, 10399, 'Juan Pablo Barajas', '4773933642', 65, 'Laptop', 'Dell', 'Core i5', '16', 'Sin Dato', '512', 'W10', 'No', 'red', '-No inicia sistema\r\n-Prende no da video', 'Reacomodo y revisión de memorias RAM, Mantenimiento Completo ', '', '', 500, 6, '2024-02-13', '2024-02-13', NULL),
(429, 10400, 'AMADO PEÑALOZA', '4774493902', 64, 'LAPTOP', 'HP', 'CORE I5', '4', 'SIN DATO', 'SIN DATO', 'W10', 'Sí', 'SIN DATO', '- DAÑO EN SISTEMA, TESTEAR DISCO DUO\r\n-OCUPA RESPALDO DE INFORMACION\r\n- COTIZAR BATERIAS', 'Formato con Respaldo', '- GOMA DE TOUCH PAD DESGASTADA\r\n- BATERIA APARTE', '', 500, 6, '2024-02-22', '2024-02-14', NULL),
(430, 10401, 'General Operador Logistico (Miriam)', '4777507474', 64, 'LAPTOP', 'LENOVO', 'INTEL CORE I7', '16', 'SIN DATO', '256', 'WIN10', 'Sí', '12345678', '- Equipo no prende (cuando se recibió el equipo si prendió)\r\n- Revisar falla de ventilador (comentan que a veces se detiene)\r\n- Revisar Batería si falla Cotizar.', '', 'Teclas desgastadas ', '', 0, 1, '0000-00-00', '2024-02-16', NULL),
(431, 10402, 'Antonio Torres', '4771754572', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO ', 'W10', 'Sí', 'SIN CONTRASEÑA', 'cotizar Batería ( se cotizo en $1,100 pendiente de confirmar)', '- BATERIA REMPLAZADA', '', '', 1100, 6, '2024-02-26', '2024-02-17', NULL),
(432, 10403, 'Sr. Liliana Conde', '4772613614', 60, 'CPU', 'HP', 'CORE I5', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- CAMBIO DE DISCO SSD  IGUAL QUE EL ANTERIOR\r\n- SOPLETEADA', '', '- CON MUCHO POLVO NO SE ENCENDIO', '', 0, 1, '2024-02-26', '2024-02-19', NULL),
(433, 10404, 'LETICIA GARCIA', '4771756248', 64, 'LAPTOP', 'TOSHIBA', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-ENCIENDE PERO NO DA IMAGEN', '- MEMORIA RAM DE  4 GB $490\r\n- LIMPIEZA Y RETIRADO EN SLOT $200', '-NO TRAE BATERIA, FALTA DOS TORNILLOS, CABLE DE CARGADOR NO TRAE, MOUSE DESGASTADO, MARCO DE LA PANTALLA VIENE SUELTO, TORNILLO DE LADO DERECHO VIENE VARIDO CON EL MARCO, DESGASTE EN DESCANZABRASOS, RASPADAS EN TAPA SUPERIOR.', '', 690, 6, '2024-02-29', '2024-02-19', NULL),
(434, 10405, 'MARIA URTAZA', '4777082253', 65, 'LAPTOP', 'SONY', 'SIN DATO', '6', '500', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- NO INICIA SISTEMA, PANTALLAS AZULES, CLIENTE INDICA QUE APAGO EL EQUIPO REPENTINAMENTE', 'Cambio SSD 480 $590, Formato a WIN11 a peticion con Resplado $500 ', '-BATERIA NO RETIENE', '', 1090, 6, '2024-02-20', '2024-02-20', NULL),
(435, 10406, 'Daniel Rangel', '4774750903', 64, 'LAPTOP', 'HP', 'Ryzen 3', '4', '', '256', 'WIN 11', 'Sí', 'galindo', 'Revisar Bateria, No Carga', '- Se pidió batería nueva genérica $1,500', 'Sin gomas y desgaste en tapa Inferior', '', 1500, 6, '2024-02-21', '2024-02-21', NULL),
(436, 10407, 'JULIO CESAR DOMINGUEZ', '4777005823', 64, 'LAPTOP', 'DELL', 'CORE I7', '4', '640', 'SIN DATO', 'WIND 8', 'Sí', 'SIN CONTRASEÑA', '- CAMBIO A DISCO SOLIDO DE 480 GB SSD $590\r\n- AUMENTO DE MEMORIA RAM 4 GB MAS $490\r\n- SISTEMA OPERATIVO SIN RESPALDO $350\r\n- COTZAR BATERIA', '- CAMBIO A DISCO SOLIDO DE 480 GB SSD $590\r\n- AUMENTO DE MEMORIA RAM 4 GB MAS $490\r\n- SISTEMA OPERATIVO SIN RESPALDO $350\r\n- PAGADO CON TRANSFERENCIA A PAULA AZU', '- SE COTIZO BATERIA EN 1000\r\n- PANTALLA EN 1,550 PENDIENTE DE CONFIRMAR', '', 1430, 6, '2024-02-21', '2024-02-21', NULL),
(437, 10408, 'Mariana Rangel', '4771081205', 65, 'Laptop', 'Lenovo', 'Core i5', '16', '', '512', 'Win 11', 'No', '1992', 'Actualizacion y Desinstalacion Antivirus', '- OFFICE INSTALDO', '', '', 350, 6, '2024-02-26', '2024-02-24', NULL),
(438, 10409, 'ROSA ELENA REYES GONZALEZ', '4775898352', 64, 'ALL IN ONE', 'LENOVO', 'CORE I3', '8', '1 TB', '256', 'Win 11', 'Sí', 'SIN DATO', '- ACTUALIZACION DE SISTEMA', '', '', '', 350, 6, '2024-02-26', '2024-02-26', NULL),
(439, 10410, 'JOAQUIN SUAREZ', '4778585502', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '16', 'SIN DATO', '256', 'WIND 11', 'Sí', '9015', '- REPARACION DE BISAGRAS', '- REPARACION DE BISAGRAS', '- BISAGRAS VIENEN DESPRENDIDAS DE LAS TAPAS', '', 1600, 6, '2024-03-06', '2024-02-28', NULL),
(440, 10411, 'MERMUDEZ RODRIGUEZ IVAN DANIEL DE JESUS', '4772063278', 64, 'LAPTOP', 'DELL', 'AMD RYZEN 5', '16', '960', '256', 'SIN DATO', 'No', '051216', '-SISTEMA OPERATIVO ESTA DAÑADO\r\n- INSTALACION DE SISTEMA CON RESPALDO DE INFORMACION', 'Configuración de inicio de disco en la bios. ', 'No fue necesario formateo.', '', 200, 6, '2024-03-07', '2024-02-29', NULL),
(441, 10412, 'Arturo Hernandez Aviles', '4777043753', 65, 'ALL IN ONE', 'DELL', 'Pentium', '4', '160', 'Sin Dato', 'Win 11', 'Sí', 'SIN DATO', 'No conecta a redes Wifi', 'Actualización de controlador', 'Pantalla Touch,', '', 150, 6, '0000-00-00', '2024-03-04', NULL),
(442, 10413, 'Luis Estrada Rico', '3312332906', 65, 'LAPTOP', 'LENOVO,DELL', 'i5,i7', '16,16', 'SIN DATO', '240,512', 'WIN10,WIN11', 'No', 'MaryPily2121,SIN DATO', '-Mantenimiento , Revisar Antivirus \r\n-Instalacion PDF PRO', '1 EQUIPO DELL\r\n- INSTALACION DE PDF PRO $350\r\n2 EQUIPO LENOVO\r\n- CARGA DE SISTEMA CON RESPALDO $500\r\n- MANTENIMIENTO INTERNO $350\r\n- PDF PRO $350\r\n- RESPALDO SE PASO A  UNA MEMORIA DE USB 64 GB $79\r\n- TOTAL $1,629', 'Lenovo: TouchPad Desgastado, sin Lector de CD\r\n', '', 1629, 6, '2024-03-08', '2024-03-05', NULL),
(443, 10414, 'Carlos Alberto Lopez', '4771848148', 65, 'LAPTOP', 'DELL', 'CORE I5', '8', '1 TB', '240', 'Win 11', 'Sí', 'SIN DATO', '-ACTUALIZACION  OFFICE Y DESISNTALACION DE ANTIVIRUS', '-ACTUALIZACION  OFFICE Y DESISNTALACION DE ANTIVIRUS', '', '', 350, 6, '2024-03-06', '2024-03-05', NULL),
(444, 10415, 'Humberto Martinez', '4773673695', 65, 'LAPTOP', 'DELL ', 'CORE I5', '16', 'SIN DATO', '512', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '- ACTUALIZACION DE OFFICE\r\n- CONFIGURACION DE INICIO DE BUTEO', '- OFFICE $350\r\n- CONFIGURACION DE BIOS $250\r\n- TOTAL $550', '', '', 550, 6, '2024-03-08', '2024-03-05', NULL),
(445, 10416, 'MARIA DOLORES ROMERO', '4777863888', 65, 'LAPTOP', 'LENOVO', 'AMD A 6', '4', 'SIN DATO', '60', 'WIN 10', 'Sí', '190908', '-REVISAR LENTITUD DEL EQUIPO\r\n- COTIZAR BATERIA\r\n- REVIAR CARGADOR SE DESCONECTA', '-CARGADOR $890\r\n- FORMATEO CON RESPALDO $500\r\n- TOTAL $1,390', 'FALTA TECLA DE FN', '', 1390, 6, '2024-03-12', '2024-03-05', NULL),
(446, 10417, 'NOE VASQUEZ', '4772247489', 65, 'LAPTOP', 'DELL ', 'CORE I5', '8', 'SIN DATO', '256', 'WIN 11', 'Sí', '951009', '-Equipo solicita credenciales de inicio, se puede ingresar con PIN\r\n-Desenlazar cuenta Microsoft a cuenta en el equipo o formateo con respaldo', '-Formato con respaldo $500', 'Requiere mouse externo', '', 500, 6, '2024-03-08', '2024-03-07', NULL),
(447, 10418, 'Jesús Aguilar', '4773069864', 65, 'LAPTOP', 'HP', 'Ryzen 3', '8', 'SIN DATO', '256', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', 'Permisos bloqueados en sistema, Sistema Corrupto\r\nFormato con Respaldo\r\nActualización de Programas', '-FORMATO SIN RESPALDO\r\n- INSTALACION DE ILUSTRAITOR Y PHOTOSHOP\r\n- TOTAL $1,050+IVA', '', '', 1218, 6, '2024-03-08', '2024-03-07', NULL),
(448, 10419, 'Diana Gomez', '4771175201', 65, 'LAPTOP', 'LENOVO', 'CORE I5', '8', '2TB', 'SIN DATO', 'WIN 11', 'Sí', '326920', 'Lentitud de sistema', '-Formato Con Respaldo $500\r\n-Actualización de aplicaciones $700', '3 tornillos inferiores faltantes\r\nSemigro de Win 10 a Win 11', '', 1200, 6, '2024-03-15', '2024-03-08', NULL),
(449, 10420, 'DANIEL TORRES', '4776924378', 65, 'CPU', 'HP', 'CORE I5', '4', 'SIN DATOS', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO INICIA SISTEMA, PANTALLA AZUL BAD SYSTEMS INFO', 'Se instalo SSD 480 GB $590\r\nS.O sin respaldo $350', '-BOTON DE ENCENDIDO NO SE PRECIONA BIEN', '', 940, 6, '2024-03-15', '2024-03-08', NULL),
(450, 10421, 'LETICIA GONZALEZ', '4771425467', 65, 'CPU', 'DELL', 'CORE I3', '4', '250', 'SIN DATO', 'WIND 10', 'No', 'SIN CONTRASEÑA', '- PANTALLA AZUL AL INICAR SISTEMA', 'Se reviso el equipo: el disco duro tenia sectores dañados, puede ser debido a falta de mantenimiento (tenia demasiado polvo).\r\nNO SE REALIZO LA REPARACIÓN.', '', '', 100, 6, '2024-03-16', '2024-03-09', NULL),
(451, 10422, 'Israel Tellez', '4613484809', 64, 'Laptop', 'HP', 'CORE I5', '4', '320', '0', 'WIND 10', 'No', '693611', '-CAMBIO DE DISCO A SOLIDO DE 480 GB $590\r\n-FORMATEO CON RESPALDO $500\r\n-AGREGAR 4 GB MAS DE MEMORIA RAM $490', '-CAMBIO DE DISCO A SOLIDO DE 480 GB $590\r\n-FORMATEO CON RESPALDO $500\r\n-AGREGAR 4 GB MAS DE MEMORIA RAM $490', '-Marcas de uso\r\n-raspón en parte izquierda en esquina', '', 1580, 6, '0000-00-00', '2024-03-09', NULL),
(452, 10423, 'ARTURO DANIEL MEJIA', '4774810929', 64, 'LAPTOP', 'HP', 'CORE I5', '4', 'SIN DATO', '120', 'WIND 10', 'No', 'SIN CONTRASEÑA', '-MANTENIMIENTI INTERNO $350\r\n- AUMENTO DE MEMORIA RAM 8 GB MAS $790\r\n- COTIZAR TECLADO', '-MANTENIMIENTI INTERNO $350\r\n- AUMENTO DE MEMORIA RAM 8 GB MAS $790\r\n- REMPLAZO DE TECLADO $600\r\n- ACTUALZIACION SOLICITADO POR EL CLIENTE $50\r\n- TOTAL $1,790', 'NO FUNCIONAS UNAS TECLAS', '', 1790, 6, '2024-03-19', '2024-03-09', NULL),
(453, 10424, 'ANDRES GUERRERO', '4776726778', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '8', 'SIN DATO', '240', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '- INSTALACION DE ACTUALIZACIONES', '', '', '', 350, 6, '2024-03-13', '2024-03-11', NULL),
(454, 10425, 'ISMAEL QUINTERO BAEZ', '4775527130', 65, 'CPU', 'ARMADO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '-NO ENCIENDE', '- FUENTE DE PODER DE $350\r\n- SOPLETEO $100\r\n- PILA BIOS $50\r\n- SE FACTURA PRECIO MAS IVA $580', '', '', 580, 6, '2024-03-13', '2024-03-13', NULL),
(455, 10426, 'KARLA FRAUSTRO', '922337203685', 64, 'CPU/LAPTOP', 'HP/BENQ', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO INICIA EL SISTEMA OPERATIVO FORMATEO CON RESPALDO WINDOWS 7\r\n- COTIZAR CARGADOR DE LAPTOP BENQ ', '- AUMENTO RAM 2 GB MAS $250\r\n-SSD 120 GB $390\r\nS.O + RESPLADO $500', '-LAPTOP QUEBARADA PLASTICO DE BISABRAS\r\n-TAPA DE AFUERA DE LA PANTALLA', '', 1140, 6, '2024-03-27', '2024-03-13', NULL),
(456, 10427, 'Jose Luis Bosco Gomez', '477860856', 64, 'CPU', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- FUENTE DE PODER DAÑADA.', '- CAMBIO DE FUENTE DE PODER', '- SIN FUENTE \r\n- SIN DISCO DURO', '', 700, 6, '2024-03-13', '2024-03-13', NULL),
(457, 10428, 'LUIS GALLARDO', '4741267026', 64, 'LAPTOP', 'DELL', 'CORE I5', '8 RAM', '1 TB', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '- FORMATEO CON RESPALDO $500\r\n-MANTENIMIENTO INTERNO $350\r\n- BISAGRA SE PEGARON $50', '', 'BISAGRA DE LADO IZQUIERDO SE SIENTE FLOJA', '', 900, 6, '2024-03-20', '2024-03-18', NULL),
(458, 10429, 'SANDRA GODINEZ', '4771291761', 64, 'LAPTOP', 'DELL', 'PENTIUM', '4', '500', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-SISTEMA NO INICIA\r\n-FORMATEO SIN RESPALDO DISO SSD 480 + 4 GB MAS DE RAM $350+590+490 =1,430', '', '- BISABRA LADO DERECHO ROTO PLASTICO, NO TRAE PROTECTOR', '', 1430, 6, '2024-03-19', '2024-03-16', NULL),
(459, 10430, 'Carlos Martinez', '4773388013', 65, 'CPU', 'LENOVO', 'Phenom', '8', '500', 'SIN DATO', 'Win 10', 'No', 'SIN CONTRASEÑA', 'Error en sistema, Pantalla de colores, no in iniciaba sistema en local inicio despues de actualizaciones, Mantenimiento pendiente', '- Mantenimiento Fisico $350\r\n- pago con tarjeta + la comision', '', '', 365.26, 6, '2024-03-22', '2024-03-17', NULL),
(461, 10431, 'ENRIQUE BARAJAS', '4776192499', 64, 'CPU', 'DELL', 'CORE I5', '8', 'SIN DATO', '120', 'WIND 10', 'No', '2410', '-MANTENIMIENTO INTERNO', '-MANTENIMIENTO INTERNO $350+iva= $406', '', '', 406, 6, '2024-03-19', '2024-03-19', NULL),
(462, 10432, 'CRISTIAN AGUILAR', '4777866785', 64, 'CPU/CPU MINI', 'LENOVO/LENOVO', ' SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'CPU LENOVO\r\n- FORMATEO CON RESPALDO\r\n\r\nCPU MINI\r\n- ENCIENDE PERO NO DA VIDEO', '- SISTEMA OPERATIVO MAS RESPALDO $500\r\n- MANTENIMIENTO INTERNO $350\r\n- REVISION $100\r\n-TOTAL $950', '', '', 950, 6, '2024-03-20', '2024-03-19', NULL),
(463, 10433, 'ADRIAN RODRIGUEZ', '4777955696', 64, 'CPU', 'HP', 'CORE I5', '4', '160', 'SIN DATO', 'WIND 10', 'No', 'mimis.123', '- EQUIPO LENTO REVISAR', '-MANTENIMIENTO INTERNO $350\r\n- FORMATEO CON RESPALDO $500\r\n- SSD DE 480 GB  $590\r\n- 4 GB DE RAM MAS $490\r\n- TOTAL $1,930', '', '', 1930, 6, '2024-03-21', '2024-03-19', NULL),
(464, 10434, 'ANDRES GUERRERO', '4776726778', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '8', 'SIN DATO', '240', 'WIN 11', 'No', 'SIN CONTRASEÑA', '- ACTUALIZACIONES SOLICITADAS POR EL CLIENTE  DE INDISIDE ID', '- ACTUALIZACIONES SOLICITADAS POR EL CLIENTE  DE INDISIDE ID', '', '', 350, 6, '2024-03-19', '2024-03-19', NULL),
(465, 10435, 'SATURNINO NEGRETE', '4791433221', 65, 'LAPTOP', 'ASUS', 'AMD A10', '12', 'SIN DATO', '240', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '-ACTUALIZACIONES SOLICITADAS POR EL CLIENTE', '-instalacion del civil car $350\r\nmouse $149 Xzeal', 'Cliente indica no retiene mucha bateria\r\n2 tornillos faltantes, tapa de Lector remplazada', '', 499, 6, '2024-03-22', '2024-03-22', NULL),
(466, 10436, 'Momba recolectora/karina', '4774093411', 65, 'LAPTOP', 'HP', 'AMD A9', '4', 'SIN DATO', 'SIN DATO', 'WIND 10', 'Sí', 'SIN CONTRASEÑA', '-No inicia S.O\r\n- cambio a disco solido (revisar con cliente)\r\n-instalación de s.o sin respaldo \r\n-cotizar batería (revisar y checar con cliente so ocupa cambio)', '', '', '', 1252.8, 6, '2024-03-27', '2024-03-23', NULL),
(467, 10437, 'Jose Luis Muñoz', '4774680879', 65, 'LAPTOP', 'VAIO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', 'NO detecta sistema operartivo\r\nRevisar Disco o Remplazar a 240 GB Solido\r\nNo requiere Respaldo, W10', '- CAMBIO A DISCO SOLIDO DE 240 GB SSD $490\r\n- SISTEMA  SIN RESPALDO WINDOWS 10  $350\r\n- TOTAL $840', 'Tecla L extraviada, Cámara Cubierta con Cinta\r\n', '', 840, 6, '2024-03-25', '2024-03-25', NULL),
(468, 10438, 'JESUS VILLANUEVA', '4771270831', 60, 'LAPTOP', 'APPLE', 'M1', '8', 'SIN DATO', '256', 'MAC OS SONOMA', 'No', '0987', '-ACTUALIZACION DE SISTEMA', '- CARGA DE OFFICE COMPLETO MAC', '', '', 590, 6, '2024-03-26', '2024-03-26', NULL),
(469, 10439, 'Geral operador Logistico/ Miriam Luna', '4777507474', 64, '3 CPU', '2 HP/ 1Acteck', 'SIN DATO/SIN DATO', 'SIN DATO/SIN DATO', 'SIN DATOS', 'SIN DATOS', 'SIN DATO/SIN DATO', 'No', 'SIN CONTRASEÑA', 'No prenden \r\n', '-2 mantenimientos $700+iva $812\r\n- cambio de ventilador con disipador a cpu acteck $750\r\n- se vendieron dos mouse pad \r\n-$812+1021', '', '', 1833, 6, '2024-04-11', '2024-03-27', NULL),
(470, 10440, 'Claudia Lizete Lozano', '4773940020', 0, 'CPU', 'HP', 'SIN DATO', '2', '320', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'Pitidos intermitentes e indicadores rojos  al encender equipo, Bateria Bios Cambiada', '-CAMBIO DE PILA BIOS \r\n- LIMPIEZA DE POLVO', 'Encendió una vez cuando cliente entrego\r\n-se puso una pila bios $50 (pendiente cobro)', '', 150, 6, '2024-04-09', '2024-03-27', NULL),
(471, 10441, 'Filemon Perez Galicia', '5574941672', 65, 'Laptop', 'LENOVO', 'Core i7', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'No da video , Indicador de encendido se apaga al poco de encender el equipo', '-REPACION DE CIRCUITO EN FUENTE ALWAYS $2100\r\n- ANTIVIRUS $350\r\n- TOTAL $2,450', 'no estaba conectado el equipo en el momento de la falla\r\n', '', 2450, 6, '2024-04-09', '2024-03-27', NULL),
(472, 10442, 'Leonardo Vazquez', '4721791944', 64, 'LAPTOP', 'LENOVO', 'CORE I5', '12', 'SIN DATO', '256', 'W11', 'Sí', '73039', '- No da Imagen en la pantalla.\r\n- No se desconecto batería para quitar la pantalla y se genero un corto', '', '- bisagras dañadas, plástico que cubre la pantalla suelto. \r\n- tapa inferior sin tornillos.\r\n- gomas de tapa inferior solo una\r\n', '', 0, 1, '0000-00-00', '2024-04-01', NULL),
(473, 10443, 'JAVIER MARTINEZ', '4778150203', 60, 'LAPTOP', 'ASUS', 'PENTIUM', 'SIN DATO', '500', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- EQUIPO LENTO', '- CAMBIO DE DISCO SOLIDO DE 240 GB $490\r\n- SISTEMA SIN RESPALDO $350\r\n- VOLVIO A VENIR HOY 12042024 SE ACTUALIZARON CONTROLADORES A WINDOW 10', '-RAYONE EN CARCASA', '', 840, 6, '2024-04-12', '2024-04-01', NULL),
(474, 10444, 'Saúl Miranda', '4777304395', 65, 'ALL IN ONE', 'HP', 'CORE I5', '8', 'SIN DATO', '256', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'Formato sin Respaldo', '-FORMATEO SIN RESPALDO $350+IVA=$406\r\nTRASNFERENCIA CON FACTURA', '', '', 406, 6, '2024-04-03', '2024-04-02', NULL),
(475, 10445, 'LUIS ROBERTO PEDROZA', '4775572914', 64, 'CPU', 'DELL', 'CORE I5', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- CAMBIO A DISO SOLIDO DE 240 GB $490\r\n- SISTEMA OPERATIVO $350', '- CAMBIO A DISO SOLIDO DE 240 GB $490\r\n- SISTEMA OPERATIVO $350\r\n-$840+4.36%= $876.62', '', '', 876.62, 6, '2024-04-04', '2024-04-02', NULL),
(476, 10446, 'GORETY JUAREZ DELGADO', '4772892171', 64, 'LAPTOP', 'GTO', 'CORE I3', '8', 'SIN DATO', '128', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- FORMATEO CON RESPALDO $500', '- FORMATEO CON RESPALDO $500', '', '', 500, 6, '2024-04-05', '2024-04-02', NULL),
(477, 10447, 'Nazario Fernandez', '4772407162', 65, 'LAPTOP', 'LENOVO', 'AMD A8', '4', '500', 'SIN DATO', 'WIN 10', 'Sí', 'NR290100 o RN290100', 'Lentitud en equipo, Cargador Dañado', 'Formato Con Respaldo $500, SSD 480 GB $590, Memoria RAM de 8GB $790,  Remplazo de Cargador $490 \r\n\r\nENTREGADO PAGADO ANGELES $2,370', '1 Slot en RAM se Remplazara', '', 2370, 6, '2024-04-06', '2024-04-02', NULL),
(478, 10448, 'Gabriela Gómez González', '4773670578', 64, 'LAPTOP', 'TOSHIBA', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- EQUIPO PRENDE NO MUESTRA VIDEO. ', '', '', '', 0, 1, '0000-00-00', '2024-04-02', NULL),
(479, 10449, 'Gabriel Mendoza', '4773675609', 65, 'CPU', 'LENOVO', 'Core i7', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'MENCER20', 'Cliente Indica Lentitud en equipo, y sistema abre ventanas regularmente', 'Mantenimiento Físico $350, Formato Con Respaldo $500\r\nTOTAL $850', 'Disco Mecánico Sano', '', 850, 6, '2024-04-06', '2024-04-03', NULL),
(480, 10450, 'URIEL PACHECO', '4793322006', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', '256', 'SIN DATO', 'Sí', '12200000', '-NO ENCIENDE', '', '-FALTAN TORNILLO\r\n- TAPA SUELTAS\r\n-FALTAN TORNILLOS PARA EL DISCO SOLIDO, VENTILADORES\r\n- FALTA BATERIA', '', 0, 1, '2024-04-13', '2024-04-06', NULL),
(481, 10451, 'EMMANUEL ALVARADO', '4774146515', 64, 'LAPTOP', 'APPLE', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'S', 'MONTERREY', 'Sí', 'SIN CONTRASEÑA', '- ACTUALIZACIONES DE SISTEMA 3', '', '', '', 1050, 1, '2024-04-08', '2024-04-08', NULL),
(482, 10452, 'IGNACIO VAZQUEZ', '4771610527', 64, 'LAPTOP', 'ACER', 'INTEL PENTIUM', '4', '500', '', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '- EQUIPO LENTO', '-INSTALACIÓN DE SSD 240 GB $490\r\n- MEMORIA RAM 4 GB $490\r\n-S.O $350', '', '', 1330, 1, '2024-04-08', '2024-04-08', NULL),
(483, 10453, 'IGNACIO VAZQUEZ', '4771610527', 64, 'CPU/ALL IN ONE', 'HP/ ACTECK/DELL', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- MANTENIMIENTOS PREVENTIVOS', '- MANTENIMIENTOS PREVENTIVOS A 11 EQUIPOS DE COMPUTO (2 ALL IN ONE Y 9 CPU) $3,850\r\n- ACTUALIZACION P A 4 EQUIPOS $1,400\r\n- SOPORTE A S.O 3 EQUIPOS $450\r\n- SERVICIO A DOMICILIO $500', ' SERVICIO A DOMICILIO', '', 6200, 6, '0000-00-00', '2024-04-08', NULL),
(484, 10454, 'BERNARDO NERY', '4773559690', 65, 'LAPTOP', 'ASUS/HP', 'CELERON/CELERON', '4/4', '500/500', 'SIN DATO', 'WIN 10/ WIN 10', 'Sí', 'HP 0102', '- FORMATO SIN RESPALDO MISMO SISTEMA \r\n- HP COTIZAR BATERIA', '-FORMATEO SIN RESPALDO $700\r\n', '- HP DESGASTE EN TOUCHPAD\r\n- ASUS  MARCAS DE USO', '', 700, 6, '2024-04-12', '2024-04-08', NULL);
INSERT INTO `servicios` (`id`, `folio`, `cliente`, `telefono`, `id_empleado`, `equipo`, `marca`, `procesador`, `ram`, `dd`, `ssd`, `so`, `cargador`, `contrasena`, `falla`, `solucion`, `obs`, `tipo_servicio`, `total`, `estatus`, `fecha_entrega`, `fecha_llegada`, `id_caja`) VALUES
(485, 10455, 'MARIBEL MOLINA', '4778800993', 64, 'LAPTOP', 'HP', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '1701', '- NO ENCIENDE', '', 'MARCAS DE USO', '', 0, 1, '2024-04-16', '2024-04-09', NULL),
(486, 10455, 'MARIBEL MOLINA', '4778800993', 64, 'LAPTOP', 'HP', 'SIN DATO ', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '1701', '- NO ENCIENDE', '', 'MARCAS DE USO', '', 0, 1, '2024-04-16', '2024-04-09', NULL),
(487, 10456, 'ROBERTO PEREZ', '4771612628', 64, 'CPU', 'COMPAQ', 'SIN DATO', 'SIN DATO', '', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- ENCIENDE PERO NO MUESTRA INICIA\r\n- CLIENTE INDICA QUE HAY VECES QUE INICIA EL SISTEMA Y HAY VECES QUE NO ', '-MANTENIMIENTO INTERNO $350\r\n- FUENTE DE PODER INSTALADA $400\r\n- TOTAL $750', '-FALTA MANTENIMIENTO CON MUCHO POLVO', '', 750, 6, '2024-04-16', '2024-04-10', NULL),
(488, 10457, 'LUIS ANGEL CALDERON', '4792641010', 64, 'LAPTOP', 'DELL', 'CORE I5', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'Luis105', '-FORMATEO CON RESPALDO $500 + Actualización de BIOS $150', '', '', '', 650, 6, '2024-04-19', '2024-04-10', NULL),
(489, 10458, 'Filemon Perez Galicia', '5574941672', 65, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN DATO', 'Equipo saco humo después de un servicio en HP, se mando a otro sitio donde es posible quitaran el tornillo que realizo el corto', '-NO TUVO SOLUCION COMPONENTES EN PLACAS MADRE DAÑADO', '', '', 100, 6, '2024-04-12', '2024-04-10', NULL),
(490, 10459, 'MIGUEL ANGEL', '4772862344', 64, 'CPU', 'DELL', 'CORE I5', '8', '160', 'SIN DATO', 'WIN 10', 'No', 'SIN CONTRASEÑA', '- PANTALLA AZUL SISTEMA OPERATIVO NO INICIA', '-350 FORMATEO', '', '', 350, 6, '2024-04-12', '2024-04-10', NULL),
(491, 10460, 'Jose Luis Rangel', '5542146197', 60, 'LAPTOP', 'DELL', 'CORE I7', '8', '500', 'SIN DATO', 'WIN 10', 'No', 'PutaMadre97', '-MANTENIMIENTO INTERNO $590\r\n- procesador y grafica', '-MANTENIMIENTO INTERNO', 'plástico de pantalla salido, detalles de uso', '', 590, 6, '2024-04-13', '2024-04-12', NULL),
(492, 10461, 'Edgar Flores Hernandez', '4771551363', 65, 'LAPTOP', 'HP', 'CORE I5', '8', 'SIN DATO', '480', 'WIN 11', 'Sí', 'flores2024', 'Actualizacion', '-COREL ', '', '', 350, 6, '2024-04-13', '2024-04-13', NULL),
(493, 10462, 'Edgar Flores Hernandez', '4771551363', 65, 'LAPTOP', 'HP', 'AMD A8', '16', 'SIN DATO', '480', 'WIN 10', 'Sí', 'Preciosa1P', 'Formato a WIN 11 y Respaldar Carpeta \"Respaldo Global\" dentro del disco local', '-FORMATEO CON RESPALDO $500', 'Sin Gomas en visagras Tapa inferior , Touchpad desgastado', '', 500, 6, '2024-04-17', '2024-04-13', NULL),
(494, 10463, 'Edgar Flores Hernandez', '4771551363', 65, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'Revisar Equipo, Opciones de mejora. Ventilador Funciona Intermitentemente', '- SE ENTREGO SIN SOLUCION NO SE COBRO', '3 tornillos faltantes en tapa inferior ', '', 0, 6, '2024-04-17', '2024-04-13', NULL),
(495, 10464, 'MANUEL ESCAMILLA', '4777054153', 60, 'LPATOP', 'DELL', 'CORE I3', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', '- NO INICIA SISTEMA, POSIBLE MENSAJE DE DAÑO DE DISCO REVISARA', 'INSTALACIÓN DE SSD 480 GB $590\r\nS.O $350', '', '', 940, 6, '2024-04-22', '2024-04-15', NULL),
(496, 10465, 'Rafael Sanchez', '4771410956', 64, 'LAPTOP', 'HP', 'AMD A8', '8', '750', 'SIN DATO', 'W8', 'Sí', 'SIN CONTRASEÑA', '-FORMATEO SIN RESPALDO W10', '-FORMATEO SIN RESPALDO W10', '', '', 350, 6, '2024-04-19', '2024-04-16', NULL),
(497, 10466, 'ARTURO MORALES', '4773787796', 64, 'CPU', 'ARMADO', 'CELERON', '8', 'SIN DATO', '240', 'WIN 11', 'No', 'SIN CONTRASEÑA', '- LENTITUD', '- SE  CAMBIO A DISCO SOLIDO SSD 240 GB SSD\r\n- SISTEMA OPERATIVO SIN RESPALDO', '', '', 840, 6, '2024-04-17', '2024-04-17', NULL),
(498, 10467, 'LUIS  ANGEL CALDERON', '4792641010', 65, 'Laptop', 'HP', 'Core i3', '8', '1TB', 'Sin Dato', 'WIN 10', 'Sí', 'SIn Contraseña', 'Mantenimiento , Formato Sin Respaldo a WIN 11', '- Mantenimiento $350\r\n- Formato Sin Respaldo a WIN 11 $350', 'bisagra izquierda con posible daño, touchpad con desgaste', '', 700, 6, '0000-00-00', '2024-04-19', NULL),
(499, 10468, 'Antonio Escareño', '4777934275', 65, 'Laptop', 'ACER', 'Ryzen 5', '8', 'SIN DATO', '960', 'WIN 10', 'Sí', '0211', 'Actualizaciones', '', '1 Tornillo y Gomas Inferiores Faltantes', '', 350, 6, '0000-00-00', '2024-04-19', NULL),
(500, 10469, 'Michell Aguilar', '4778034382', 65, 'LAPTOP', 'HP', 'CORE I3', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIn Contraseña', 'EQUIPO MOJADO', '-Mantenimiento ', '', '', 550, 6, '2024-04-19', '2024-04-19', NULL),
(501, 10470, 'Marco Antonio Vidales', '4431935109', 0, 'LAPTOP', 'APPLE MACBOOK  2011', 'CORE I5', '8', '', '240', 'HIGH SIERRA', 'Sí', '1512', '- FALLA DE TECLADO \r\n- PUERTO USB LADO IZQUIERDO  A UN LADO DEL MINI DISPLAY PORT \r\n', '-Teclado $900\r\n- mantenimiento preventivo $590', '- golpe en esquina derecha \r\n- no tiene 4 gomas de abajo\r\n-desgaste en tapa inferior ', '', 1490, 6, '0000-00-00', '2024-04-19', NULL),
(502, 10471, 'Jorge Torres', '4771343835', 65, 'Laptop', 'DELL', 'CORE I7', '16', '1 TB ', '512', 'W11', 'No', '1901', '- Revisar puertos auxiliar audifonos \r\n-Mantenimiento preventivo $550', '-MANTENIMIENTO INTERNO $350\r\n- SE INSTALO CONTROLADOR DE AUDIO $200', 'puerto auxiliar falla', '', 550, 6, '2024-04-26', '2024-04-22', NULL),
(503, 10472, 'Leonardo Hernández', '4792623295', 64, 'laptop/cpu', 'acer/hp', 'core i5/core i7', '8/6', '2 tb/1 tb ', 'sin dato', 'w10/w11', 'Sí', '200694', '- Lentitud en la laptop \r\n- cpu se pasma deja mover mouse pero no deja trabajar no escribe ni deja seleccionar nada.', '-ACTUALIZACION DEL CPU $100\r\n- SOLIDO DE 1 TERA $1,090\r\n- RAM DE 4 GB  MEMORIA $490\r\n-  FORMATEO CON RESPALDO $500\r\n- MANTENIMIENTI OINTERNO $350\r\n- TOTAL $2,630', '', '', 2630, 6, '2024-05-06', '2024-04-24', NULL),
(504, 10473, 'Liliana saavedra', '4771148640', 65, 'Laptop', 'ASUS', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '339405', 'Equipo no enciende, No encienden led indicadores y cargador no es de la marca del equipo', '- EQUIPO SIN SOLUCION \r\nAMBOS SERVICIOS SE PAGARON CON TARJETA', 'Equipo sin tornillos en tapa inferior', '', 100, 6, '2024-05-04', '2024-04-25', NULL),
(505, 10474, 'ALIZERPA SA DE CV', '4776462972', 64, 'ALL IN ONE', 'IMAC APPLE 2012', 'CORE I5', '8', '1 TB', 'SIN DATO', 'CATALINA', 'No', '1234', '-CAMBIO DE DISCO SOLIDO CLIENTE TRAE EL DISCO SOLIDO SAMSUN 1 TB\r\n- APERTURA DE EQUIPO CON HERRAMIENTA $990\r\n- ACTUALIZACION SISTEMA $590\r\n- MAS IVA PARA FACTURA $1,580+IVA= $1,832.80', '-CAMBIO DE DISCO SOLIDO CLIENTE TRAE EL DISCO SOLIDO SAMSUN 1 TB\r\n- APERTURA DE EQUIPO CON HERRAMIENTA $990\r\n- ACTUALIZACION SISTEMA $590', '- El equipo contaba con una fisura muy pequeña se noto cuando se iba abrir, se notifico al cliente antes de abrirla para hacerle saber que se podía correr, y  se corrió aproximadamente 10 cm al fin del proceso. ', '', 1832, 6, '2024-05-02', '2024-04-25', NULL),
(506, 10475, 'JOSE REFUJIO LOZANO', '4771154980', 65, 'CPU', 'HP', 'AMD GX415', '8', 'SIN DATO', '120', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'MANTENIMIENTO INTERNO , CLIENTE INDICA EQUIPO SE APAGA AL CALENTARSE EN TRABAJO REGULAR', '', '', '', 0, 1, '0000-00-00', '2024-04-26', NULL),
(507, 10476, 'Paloma Balbuena', '4774951133', 64, 'CPU', 'HP/LENOVO ', 'CORE I5/ RYZEN 7', '8/8', '2 TB HP', '1', 'W11', 'Sí', '1953', 'HP: FORMATEO CON RESPALDO DE INFO (EQUIPO LENTO)\r\nLENOVO: CAMBIO A SSD 1 TB (PENDIENTE MANDAR COSTO DE DISCO/ EQUIPO LENTO)', '2 formateos con respaldo ', '', '', 1000, 6, '0000-00-00', '2024-04-26', NULL),
(508, 10477, 'Amalia Valdivia', '4773998989', 65, 'Laptop', 'Toshiba', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'WIN 10', 'Sí', 'SIN DATO', 'Cambio a Disco SSD 2 TB y Revisar incremento de RAM\r\nFORMATO A WINDOWS 10\r\nNO SE PUEDE INGRESAR EN SISTEMA', '- DISCO SOLIDO 2 TB SSD $3,600\r\n- 2 MEMORIA RAM 8 GB  $1,580\r\n- FORMATEO SIN RESPALDO $350\r\n- MANTENIMIENTO INTERNO $350\r\n- PORTAFOLIO HP $250\r\n- DISCO EXTERNO 2 TERAS $1,499\r\n- TOTAL $ 7,629 EFECTIVO COBRO ISSAC', 'TORNILLOS FALTANTES EN TAPA INFERIOR', '', 7629, 6, '2024-05-20', '2024-04-28', NULL),
(509, 10478, 'LILIANA SAAVEDRA', '4771148640', 65, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '-NO INICIA SISTEMA', '- CAMBIO A DISCO SSD 480 GB\r\n- SISTEMA OPERATIVO SIN RESPALDO $350\r\n$940', 'BISAGRA ESTA ROTA, DOS TORNILLOS FALTANTES EN LA PARTE BAJA Y NO CUENTA CON GOMAS. PROBLEMAS CON EL TOUCHPAD, UERTOS USB Y BLUETHOOTH.', '', 940, 6, '2024-05-04', '2024-04-29', NULL),
(510, 10479, 'Alfonso Vazquez', '4772982613', 65, 'CPU', 'DELL', 'Pentium', '1', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'No', 'SIN CONTRASEÑA', 'No inicia sistema ', '- INSTALACION DE WINDOWS 2000', 'Cliente indica El equipo daba mensajes de error y reiniciaba el equipo, No requiere Respaldo en caso de Formato', '', 450, 6, '2024-05-14', '2024-05-02', NULL),
(511, 10480, 'ANDREA ACEVES', '4775762333', 64, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '2909', 'NO ENCIENDE', '', 'RASPONES EN LA TAPA SUPERIOR\r\nCARGADOR TIENE CINTA\r\nTRABAJO CON ELLA UN AÑO ', '', 0, 1, '2024-05-09', '2024-05-02', NULL),
(512, 10481, 'María Guadalupe Aguirre', '4774118835', 64, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN', '- COTIZAR PANTALLA', '-Cambio de Pantalla $1,700', '-PANTALLA ESTRELLADA', '', 1700, 6, '2024-05-09', '2024-05-03', NULL),
(513, 10482, 'HECTOR RIVERA', '4777253536', 64, 'LAPTOP', 'DELL', 'CORE I7', '24', '650', '256', 'WIN 11', 'Sí', 'SIN CONTRASEÑA', '-INSTALAR DISCO DE 1 TERA QUE YA ESTA PAGADO\r\n- CARGAR SISTEMA OPERATIVO $350', '-INSTALAR DISCO DE 1 TERA QUE YA ESTA PAGADO\r\n- CARGAR SISTEMA OPERATIVO $350\r\n- MOUSE LOGITECH $110', '', '', 460, 6, '2024-05-03', '2024-05-03', NULL),
(514, 10483, 'Jaime Orta', '4771398363', 64, 'LAPTOP', 'asus', 'Intel core i7', '8', '1 tb ', 'sin dato', 'w11', 'Sí', 'sin contraseña', '- Equipo Lento', '- SSD 480 GB \r\n- S.O + actualización pro $700\r\n-case para disco ADATA $239', 'Entregado a Mujer ', '', 1529, 6, '2024-05-09', '2024-05-06', NULL),
(515, 10484, 'RECOLECTORA MOMBA (KARINA LOPEZ)', '4774093411', 64, 'LAPTOP', 'HP', 'PENTIUM', '4', '1 TB', 'SIN DATO', 'WIN 10', 'No', 'sin contraseña', 'EQUIPO POR LENTITUD\r\n- CAMBIO DE DISO SOLIDO DE 480 GB $590\r\n- SISTEMA OPERATIVO CON RESPALDO $500\r\n- BATERIA $850 PENDIENTE DE CONFIRMAR\r\n- AUMENTO A MEMORIA RAM DE 8 GB  PENDIENTE DE MODULSO DISPONIBLES', '', '- QUEBRADA LA ESQUINA IZQUIERDA\r\n- 4 TORNILLOS\r\n- TECLA SUELTA ALADO DEL UNO', '', 0, 1, '2024-05-14', '2024-05-07', NULL),
(516, 10485, 'JUAN PABLO HERANDEZ VARGAS', '4772749445', 64, 'LAPTOP', 'ACER', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'sin contraseña', '-NO ENCIENDE\r\n- OTRO TECNICO LE DIAGNOSTICO FALLA EN EL CENTRO DE CARGA', '-REPARACION DE CIRCUITOS DE CARGA $1,900', '', '', 1900, 6, '2024-05-21', '2024-05-10', NULL),
(517, 10486, 'Luz', '4771111111', 64, 'ALL IN ONE', 'HP', 'RYZEN 3', '12', 'SIN DATO', '500', 'W11', 'Sí', 'sin contraseña', '- ACTUALIZACIÓN PRO.', '', '', '', 350, 6, '2024-05-11', '2024-05-11', NULL),
(518, 10487, 'HECTOR HUGO ROBLES', '4778801827', 60, 'LAPTOP', 'GTO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'Ema152000', '- NO ENCIENDE EL EQUIPO\r\nDEJO DE ENCENDER SOSPECHA QUE ES DEL BOTON DE ENCENDIDO', 'CARGADOR NUEVO -$490', 'faltan gomas en la parte de abajo y bisagra se siente floja', '', 490, 6, '2024-05-21', '2024-05-14', NULL),
(519, 10488, 'ARMANDO TORRES', '4181136597', 0, 'LAPTOP', 'HP', 'Core i5', '3', '500', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', 'PANTALLA AZUL ESPONTANEA, FAULT IN NON PAGED AREA\r\nTECLADO FALLA EN ALGUNAS TECLAS , LIMPIAR PARA REALIZAR PRUEBA\r\nCOTIZAR TAPA DEL EQUIPO Y TECLADO SI LA LIMPIEZA NO LO ARREGLA', '- Cambio de Teclado $750\r\n- Actualización de sistema.\r\n', 'CINTA EN TAPA DE TECLADO , GOMA INFERIOR FALTANTE , BISAGRA FRAGIL O DAÑADA', '', 950, 6, '0000-00-00', '2024-05-15', NULL),
(520, 10489, 'LEONARDO LOPEZ', '4772336875', 0, 'LAPTOP', 'HP', 'XEON', '16', 'SIN DATO', '512', 'WIN 11', 'Sí', '260905', 'TECLAS FALLAN', 'cambio de teclado', '', '', 1500, 6, '2024-05-22', '2024-05-15', NULL),
(521, 10490, 'Miriam', '4777507474', 64, 'LAPTOP', 'LENOVO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', '12223', '- NO ENCIENDE', '- SOLO REVISION', '- QUEBRADA DE LADO IZQUIERDO EN LA PARTE INFERIOR', '', 100, 6, '2024-05-16', '2024-05-15', NULL),
(522, 10491, 'CUDIMEX', '4775789559', 64, 'LAPTOP', 'DELL', 'CORE I7', 'SIN DATO', 'S', 'SIN DATO', 'WIN 11', 'No', 'SIN CONTRASEÑA', '- ACTUALIZACION DE SISTEMA ', '', '', '', 100, 6, '2024-05-17', '2024-05-17', NULL),
(523, 10492, 'GENERAL MIRIAM LUNA', '4777507474', 64, 'CPU', 'APPLE MINI', 'M1', '8 ', 'SIN DATO', '245', 'SONOMA', 'Sí', 'SIN CONTRASEÑA', '- MANTENIMIENTO INTERNO\r\n- ELIMINAR USUARIOS', '- MANTENIMIENTO INTERNO + iva  $684', '', '', 684, 6, '2024-05-21', '2024-05-17', NULL),
(524, 10493, 'Erik Foseca', '4778939891', 64, 'LAPTOP', 'APPLE', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- Formateo ', '', '', '', 590, 1, '0000-00-00', '2024-05-17', NULL),
(525, 10494, 'Pedro Miranda', '4771379041', 65, 'CPU', 'HP/GUIA', 'PENTIUM/ATOM', '2/3', '250/160', '', 'WIN 7', 'No', 'SIN CONTRASEÑA', '- SE CONGELAN, DEJAN DE RESPONDER AMBOS', '', '-MARCAS DE USO Y POLVO', '', 0, 1, '2024-05-19', '2024-05-19', NULL),
(526, 10495, 'OMAR TORRES', '4777305715', 65, 'LAPTOP', 'HP', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', 'EQUIPO NO ENCIENDE , LEDS INDICADORES AL CONECTAR', '- Cambio de memoria ram 4 gb $490\r\n- Actualización de sistema $100', 'CLIENTE INDICA SE MANTUVO EN AMBIENTE HUMEDO, A REGULADOR Y DE VEZ EN CUANDO SE DEJO CONECTADO', '', 590, 6, '2024-05-27', '2024-05-21', NULL),
(527, 10496, 'ALEXIS MURILLO', '4779133968', 65, 'LAPTOP', 'DELL', 'I5', '16', 'SIN DATO', 'SIN DATO', 'WIN 10', 'Sí', '200417', 'Pila BIOS desgastada o falla, equipo bloqueado', 'FORMATEO CON RESPALDO $500\r\nBATERIA BIOS $100', 'Equipo no enciende sin el cargador, indicado por cliente', '', 600, 6, '0000-00-00', '2024-05-23', NULL),
(528, 10497, 'LORENZO PRADO BUENO', '4774249231', 64, 'LAPTOP', 'TOSHIBA', 'SIN DATO', '', '', 'SIN DATO', 'SIN DATO', 'Sí', 'SIN CONTRASEÑA', '- ENCIENDE Y NO DA VIDEO', 'SIN SOLUCIÓN', '', '', 100, 6, '2024-05-30', '2024-05-23', NULL),
(529, 10498, 'Sindicato de Harineros', '4771796439', 65, 'LAPTOP', 'DELL', 'CORE I5', '8', 'SIN DATO', '128', 'WIN 10', 'No', 'bimbo1995', '- NO CONECTA REDES  \r\n- PANTALLA AZUL', 'Actualización de Controladores', '', '', 150, 6, '2024-05-25', '2024-05-23', NULL),
(530, 10499, 'RAFAEL GUTIERREZ', '4775817699', 64, 'LAPTOP', 'DELL', 'AMD A12', '8', '1 TB', 'SIN DATO', 'WIN 10', 'Sí', 'SIN CONTRASEÑA', '-LENTITUD EN EL EQUIPO\r\n- FORMATEO CON RESPALDO\r\n- DISCO SOLIDO SSD 960 GB \r\n- COTIZAR BATERIA', '', 'MOUSEPAD LEVANTADO POR BATERIA INFLADA', '', 0, 1, '2024-05-31', '2024-05-24', NULL),
(532, 10500, 'PATRICIA GOMEZ GONZALES', '4774114631', 65, 'LAPTOP', 'GTO', 'CELERON', '8', 'SIN DATO', '128/32', 'WIN 11', 'No', 'andres2103', 'BISAGRA ROTA', '- TORNILLOS INSTALACION', 'faltan 5 tornillos , gomas inferiores y  frontales', '', 150, 6, '2024-05-28', '2024-05-25', NULL),
(533, 10501, 'Christian Aguilar', '4777866785', 64, 'CPU', 'LENOVO', 'AMD A6', 'GB ', '500', '', 'W11', 'Sí', 'SIN CONTRASEÑA', 'CREA USUARIOS TEMPORALES ', 'FORMATEO CON RESPALDO', '', '', 500, 1, '0000-00-00', '2024-05-25', NULL),
(534, 10502, 'ALEJANDRO FRAUSTRO', '4772164057', 65, 'LAPTOP', 'HP', 'AMD A9', '4', '1 TB', 'SIN DATO', 'WIN 10', 'Sí', '1928', '- LENTITUD EN EL EQUIPO', '- TECLADO PEGAJOSO', '', '', 0, 1, '2024-06-03', '2024-05-27', NULL),
(535, 10503, 'SANDRA RODRIGUEZ CENTENO', '4271496413', 64, 'LAPTOP', 'MACBOOK PRO', 'CORE I7', '16', 'SIN DATO', '500', 'SONOMA', 'No', 'SIN CONTRASEÑA', '- ACTUALIZACIONES DE SISTEMA', '', '', '', 550, 6, '2024-06-04', '2024-05-28', NULL),
(536, 10503, 'SANDRA RODRIGUEZ CENTENO', '4271496413', 64, 'LAPTOP', 'MACBOOK PRO', 'CORE I7', '16', 'SIN DATO', '500', 'SONOMA', 'No', 'SIN CONTRASEÑA', '- ACTUALIZACIONES DE SISTEMA', '', '', '', 550, 6, '2024-06-04', '2024-05-28', NULL),
(537, 10504, 'Benjamín meza (GENERAL FORWARDING)', '4772892283', 64, 'LAPTOP/ALL IN ONE', 'HP/DELL', 'SIN DATO/ CORE I7', 'SIN DATO/12', 'SIN DATO/1 TB ', 'SIN DATO', 'WIN 10', 'Sí', '19660221', 'LAPTOP: NO INICIA SISTEMA OPERATIVO CLIENTE COMENTA QUE TIENE 2 DISCOS UNO SOLIDO Y UN DISCO DURO (INFORMACIÓN A RESPALDAR)\r\nALL IN ONE: CAMBIO A DISCO SOLIDO PENDIENTE CONFIRMAR COSTOS (INSTALAR DISCO DURO EN CASE)', '', '', '', 0, 1, '0000-00-00', '2024-05-28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `usuario` text NOT NULL,
  `password` text NOT NULL,
  `perfil` text NOT NULL,
  `foto` text NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(60, 'Alfonso Martinez Lopez', 'admin', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Administrador', '', 1, '2024-05-06 21:12:45', '2024-05-07 02:12:45'),
(61, 'VendedorTest', 'vendedor', '$2a$07$asxx54ahjppf45sd87a5aumawKBqkKu/t5yVn5oVpbu8.I0unXqba', 'Vendedor', '', 1, '2022-04-27 10:56:19', '2022-04-27 10:56:19'),
(62, 'Marco Aguilar Olmedo', 'admonOlmedo', '$2a$07$asxx54ahjppf45sd87a5au/abPXybswG6vdC.wdokIDCeUtlEpUoG', 'Administrador', 'vistas/img/usuarios/admonOlmedo/256.jpg', 1, '2024-05-28 12:02:54', '2024-05-28 17:02:54'),
(64, 'Maria Rangel C', 'maria', '$2a$07$asxx54ahjppf45sd87a5auJnyEWu2I/LGrsdLfMawEZGMwUWnuJ6a', 'Administrador', '', 1, '0000-00-00 00:00:00', '2023-10-12 17:56:44'),
(65, 'Isaac Delgado Alvizo', 'Isaac', '$2a$07$asxx54ahjppf45sd87a5auzusjT6DPKSvgv1Z//wNSPVDHW/zG6NK', 'Vendedor', '', 1, '2024-05-25 11:51:30', '2024-05-25 16:51:30'),
(70, 'Lolita', 'Lola', '$2a$07$asxx54ahjppf45sd87a5auRajNP0zeqOkB9Qda.dSiTb2/n.wAC/2', 'Especial', '', 1, '2024-02-12 15:43:42', '2024-02-12 20:47:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `descuento` float DEFAULT NULL,
  `metodo_pago` text NOT NULL,
  `esClienteF` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_caja` int(11) DEFAULT NULL,
  `apartado` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `descuento`, `metodo_pago`, `esClienteF`, `fecha`, `id_caja`, `apartado`) VALUES
(109, 10007, 23, 60, '[{\"id\":\"31\",\"descripcion\":\"CABLE USB DE 2 MTS. COLOR NEGRO\",\"cantidad\":\"1\",\"stock\":\"48\",\"precio\":\"120\",\"subTotal\":\"120\",\"impuestoFinal\":\"0.00\",\"totalNeto\":120,\"impuesto\":\"0\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"96321548\"},{\"id\":\"30\",\"descripcion\":\"PASTA TERMICA PARA PROCESADOR\",\"cantidad\":\"1\",\"stock\":\"48\",\"precio\":\"210\",\"subTotal\":\"210\",\"impuestoFinal\":\"16.80\",\"totalNeto\":226.8,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"21365476\"},{\"id\":\"29\",\"descripcion\":\"LIMPIADOR DE PANTALLAS MARCA PATO\",\"cantidad\":\"1\",\"stock\":\"49\",\"precio\":\"110\",\"subTotal\":\"110\",\"impuestoFinal\":\"0.00\",\"totalNeto\":110,\"impuesto\":\"0\",\"taxObj\":\"01\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"74563218\"}]', 16.8, 423.6, 406.8, 50, 'Efectivo', '1', '2023-10-16 15:43:04', 8, '0'),
(123, 10008, 23, 60, '[{\"id\":\"32\",\"descripcion\":\"CAMARA FOTOGROFICA PROFESIONAL\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"10200\",\"subTotal\":\"10200\",\"impuestoFinal\":\"816.00\",\"totalNeto\":11016,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"85213647\"}]', 816, 11016, 10200, 0, 'TC-7887879897', '1', '2023-10-16 15:46:12', NULL, '1'),
(124, 10009, 23, 60, '[{\"id\":\"31\",\"descripcion\":\"CABLE USB DE 2 MTS. COLOR NEGRO\",\"cantidad\":\"1\",\"stock\":\"40\",\"precio\":\"120\",\"subTotal\":\"120\",\"impuestoFinal\":\"0.00\",\"totalNeto\":120,\"impuesto\":\"0\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"96321548\"},{\"id\":\"30\",\"descripcion\":\"PASTA TERMICA PARA PROCESADOR\",\"cantidad\":\"1\",\"stock\":\"42\",\"precio\":\"210\",\"subTotal\":\"210\",\"impuestoFinal\":\"16.80\",\"totalNeto\":226.8,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"21365476\"}]', 16.8, 346.8, 330, 0, 'TD-8520000', '1', '2023-10-16 15:46:47', NULL, '0'),
(125, 10010, 23, 60, '[{\"id\":\"28\",\"descripcion\":\"CABLDE RED COLO ROJO DE 10 MTS.\",\"cantidad\":\"1\",\"stock\":\"45\",\"precio\":\"85\",\"subTotal\":\"85\",\"impuestoFinal\":\"6.80\",\"totalNeto\":91.8,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"12345676\"},{\"id\":\"26\",\"descripcion\":\"HUB DE USB MARCA MOCH CON 6 ENTRADAS \",\"cantidad\":\"1\",\"stock\":\"42\",\"precio\":\"320\",\"subTotal\":\"320\",\"impuestoFinal\":\"25.60\",\"totalNeto\":345.6,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"74185263\"}]', 32.4, 437.4, 405, 0, 'TC-1223123123', '1', '2023-11-10 05:08:18', NULL, '0'),
(126, 10011, 21, 60, '[{\"id\":\"31\",\"descripcion\":\"CABLE USB DE 2 MTS. COLOR NEGRO\",\"cantidad\":\"1\",\"stock\":\"39\",\"precio\":\"160\",\"subTotal\":\"160\",\"impuestoFinal\":\"0.00\",\"totalNeto\":160,\"impuesto\":\"0\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"96321548\"}]', 0, 160, 160, 0, 'TC-8978979', '2', '2023-11-10 05:11:34', NULL, '0'),
(127, 10012, 22, 62, '[{\"id\":\"33\",\"descripcion\":\"TELÉFONO INHALAMBRICO CON 30 MTS DE ALCANCE \",\"cantidad\":\"1\",\"stock\":\"6\",\"precio\":\"210\",\"subTotal\":\"210\",\"impuestoFinal\":\"16.80\",\"totalNeto\":226.8,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"753159\"}]', 16.8, 226.8, 210, 0, 'TC-500', '1', '2024-04-20 20:41:03', NULL, '0'),
(128, 10013, 22, 62, '[{\"id\":\"34\",\"descripcion\":\"Kit de limpieza de pantallas de LCD\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"99\",\"subTotal\":\"99\",\"impuestoFinal\":\"7.92\",\"totalNeto\":106.92,\"impuesto\":\".08\",\"taxObj\":\"02\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"9757929671\"}]', 7.92, 106.92, 99, 0, 'Efectivo', '1', '2024-04-20 20:45:51', NULL, '0'),
(129, 10014, 21, 62, '[{\"id\":\"35\",\"descripcion\":\"COMPUTADORA DE ESCRITORIO CON TECLADO Y RATON INCLUIDO\",\"cantidad\":\"1\",\"stock\":\"9\",\"precio\":\"6500\",\"subTotal\":\"6500\",\"impuestoFinal\":\"1040.00\",\"totalNeto\":7540,\"impuesto\":\".16\",\"taxObj\":\"01\",\"unitCode\":\"43211805\",\"unit\":\"H87\",\"identificationNumber\":\"KJSKJ389213\"}]', 1040, 7540, 6500, 0, 'TC-151515151511', '2', '2024-04-20 20:49:26', NULL, '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodega`
--
ALTER TABLE `bodega`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogocfdi`
--
ALTER TABLE `catalogocfdi`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogoclavessat`
--
ALTER TABLE `catalogoclavessat`
  ADD PRIMARY KEY (`id_claves`);

--
-- Indices de la tabla `catalogoestados`
--
ALTER TABLE `catalogoestados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `catalogoregimen`
--
ALTER TABLE `catalogoregimen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogounidaessat`
--
ALTER TABLE `catalogounidaessat`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes_mostrador`
--
ALTER TABLE `clientes_mostrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigos_productos`
--
ALTER TABLE `codigos_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_mov_bodega`
--
ALTER TABLE `historial_mov_bodega`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidospaqueteria`
--
ALTER TABLE `pedidospaqueteria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido_paqueteria_hmov`
--
ALTER TABLE `pedido_paqueteria_hmov`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productosfacturas`
--
ALTER TABLE `productosfacturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bodega`
--
ALTER TABLE `bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `catalogocfdi`
--
ALTER TABLE `catalogocfdi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `catalogoclavessat`
--
ALTER TABLE `catalogoclavessat`
  MODIFY `id_claves` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogoestados`
--
ALTER TABLE `catalogoestados`
  MODIFY `id_estado` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `catalogoregimen`
--
ALTER TABLE `catalogoregimen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `catalogounidaessat`
--
ALTER TABLE `catalogounidaessat`
  MODIFY `id_unidad` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `clientes_mostrador`
--
ALTER TABLE `clientes_mostrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `codigos_productos`
--
ALTER TABLE `codigos_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `historial_mov_bodega`
--
ALTER TABLE `historial_mov_bodega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `pedidospaqueteria`
--
ALTER TABLE `pedidospaqueteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `pedido_paqueteria_hmov`
--
ALTER TABLE `pedido_paqueteria_hmov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `productosfacturas`
--
ALTER TABLE `productosfacturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=538;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
