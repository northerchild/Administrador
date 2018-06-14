-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2018 a las 20:28:58
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurantes`
--

CREATE TABLE `restaurantes` (
  `id` int(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` text,
  `descripcion` text,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `restaurantes`
--

INSERT INTO `restaurantes` (`id`, `nombre`, `direccion`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'Grecia De Andrei', 'Calle 118 #05-63', ' rica gastronomia griega', '1', '50000'),
(2, 'Donde Canta la Rana', '24H # 20-10', 'Comida tipica Colombiana.', '1', '30000'),
(3, 'Las Margaritas', 'Cra. 23c #31 B', 'La Mejor comida llanera.', '1', '50000'),
(4, 'Brillante Restaurante', 'Ac. 3 #23A-09', 'El mejor lugar para almozar.', '1', '15000'),
(5, 'Restaurante Llanero Bogota', 'Cra. 21 #853', 'El mejor restaurante llanero.', '1', '25000'),
(6, 'El Viejo Rancho', 'Cl. 11-09', 'Excelente comida para toda la familia.', '1', '40000'),
(7, 'Restaurante Donde Manuel', 'Crr 69b 29 -59', 'El Mejor restaurante familiar.', '1', '30000'),
(8, 'Restaurante Don Roque', 'Cl. 2 #8-10', 'La mejor comida de antoquia.', '1', '40000'),
(9, 'Restaurante moros y cristianos', 'Cl. 7 #5-30', 'Un restaurante para todos', '1', '35000'),
(10, 'RESTAURANTE EL ARCA', 'Cl. 9 #45-30', 'Comida para todos', '1', '48000'),
(11, 'Restaurante Darius', 'Las Americas # 43A-44', 'Comida a un excelente precio.', '1', '60000'),
(12, 'Restaurante Nuevo Occidente', 'Segundo Piso, Diagonal 13 #53', 'El mejor corrientazo de bogota.', '1', '18000'),
(13, 'Restaurante El Mirador', 'Calle 10 # 5-72', 'Uno de los mejores restaurantes de Bogota.', '1', '48000'),
(14, 'La Puerta Falsa', 'Cl. 11 #6-50', 'Comida peruana para todos.', '1', '45000'),
(15, 'Restaurante Mi Viejo', 'Cl. 11 #5-41', 'La mejor comida del mediterranio.', '1', '60000'),
(16, 'El Son de los Grillos', 'Cl. 10 #3-60', 'La mejor comida gourmet', '1', '80000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restaurantes`
--
ALTER TABLE `restaurantes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
