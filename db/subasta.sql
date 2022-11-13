-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2022 a las 04:52:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `subasta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `descripcion`) VALUES
(1, 'Autos deportivos', 'Todos los autos de la gama de deportivos...'),
(2, 'Electronica', 'Todo sobre electronica.'),
(3, 'Linea Blanca', 'Todos los muebles que entran en la linea blanca.'),
(4, 'People', 'Vendo gente'),
(5, 'Ropa casual', 'Todo tipo de ropa casual'),
(6, 'Perfumeria', 'Todo tipo de perfumeria'),
(7, 'Cocina', 'productos de cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `id_cesta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_subasta` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cesta`
--

INSERT INTO `cesta` (`id_cesta`, `id_usuario`, `id_subasta`) VALUES
(1, 3, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_subasta` int(11) NOT NULL,
  `comprador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `oferta`, `estado`, `fecha`, `id_subasta`, `comprador`) VALUES
(3, 11, 0, '2022-11-12 04:03:09', 10, 3),
(4, 8, 0, '2022-11-12 04:07:59', 11, 3),
(5, 9, 0, '2022-11-12 04:09:03', 11, 4),
(6, 5, 1, '2022-11-12 04:11:54', 12, 3),
(7, 11, 0, '2022-11-12 04:26:32', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `imagen`, `id_categoria`) VALUES
(10, 'taza ', 'una taza como ejemplo', 't1.jpg', 3),
(11, 'taza 2', 'una taza 2 como ejemplo', 'default.jpg', 1),
(12, 'camisa', 'una camisa', 'd1.jpg', 5),
(13, 'camisa 3', 'esta es una camisa', 'default.jpg', 5),
(14, 'taza', 'esto es una taza', 'default.jpg', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subasta`
--

CREATE TABLE `subasta` (
  `id_subasta` int(11) NOT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `tiempo_ini` datetime NOT NULL,
  `tiempo_fin` datetime NOT NULL,
  `estado` int(11) NOT NULL,
  `comprador` int(11) DEFAULT NULL,
  `subastador` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `subasta`
--

INSERT INTO `subasta` (`id_subasta`, `min`, `max`, `tiempo_ini`, `tiempo_fin`, `estado`, `comprador`, `subastador`, `id_producto`) VALUES
(9, 10, 20, '2022-11-12 03:53:00', '2022-11-11 22:54:00', 1, NULL, 3, 10),
(10, 10, 25, '2022-11-12 03:57:37', '2022-11-18 08:00:00', 0, 3, 4, 11),
(11, 7, 15, '2022-11-12 04:06:07', '2022-11-18 12:05:00', 0, 1, 5, 12),
(12, 1, 5, '2022-11-12 04:11:05', '2022-11-23 22:10:00', 1, 3, 6, 13),
(13, 1, 20, '2022-11-12 04:16:06', '2022-11-12 09:16:00', 0, NULL, 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `paterno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `materno` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `foto` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `paterno`, `materno`, `edad`, `foto`, `correo`, `user`, `pass`) VALUES
(1, 'Alejandro', 'Zavala', 'Ortiz', '21', 'signup.png', 'zaoa95@gmail.com', '1330021', '1330021'),
(3, 'Angel Alejandro', 'Garcia', 'Rivera', '30', '', '1330469@upv.edu.mx', 'angel', 'angel'),
(4, 'Luis', 'Zavala', 'Ortiz', '70', 't3.jfif', 'luis@gmail.com', 'luis', 'luis'),
(5, 'Jose', 'Perales', 'Geronimo', '30', 'logo.png', 'pepe@gmail.com', 'pepe', 'pepe'),
(6, 'Christian', 'Hernandez', 'Hernandez', '21', 'ALEJANDROZAVALA - WIN_20140709_130308.JPG', 'pastor@gmail.com', 'pastor', 'pastor');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD PRIMARY KEY (`id_cesta`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `subasta`
--
ALTER TABLE `subasta`
  ADD PRIMARY KEY (`id_subasta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cesta`
--
ALTER TABLE `cesta`
  MODIFY `id_cesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `subasta`
--
ALTER TABLE `subasta`
  MODIFY `id_subasta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
