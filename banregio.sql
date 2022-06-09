-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-06-2022 a las 16:26:21
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banregio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `id_cuenta` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_cuenta` bigint(20) NOT NULL,
  `saldo` double NOT NULL,
  `fecha_apertura` date NOT NULL,
  PRIMARY KEY (`id_cuenta`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `numero_cuenta`, `saldo`, `fecha_apertura`) VALUES
(1, 1234567890, 10000, '2022-06-08'),
(2, 8539745263, 800000, '2022-05-04'),
(4, 3420684106, 180000, '2022-06-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` bigint(20) NOT NULL,
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_prestamo`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `cliente`, `id`, `fecha`, `monto`, `estado`) VALUES
(1, 103228, 1, '2021-01-10', 37500, 'Pendiente'),
(2, 103228, 2, '2021-01-19', 725.18, 'Pendiente'),
(3, 103228, 3, '2021-01-31', 1578.22, 'Pendiente'),
(4, 103228, 4, '2021-02-04', 380, 'Pendiente'),
(5, 70099925, 1, '2021-01-07', 2175.25, 'Pagado'),
(6, 70099925, 2, '2021-01-13', 499.99, 'Pagado'),
(7, 70099925, 3, '2021-01-24', 5725.18, 'Pendiente'),
(8, 70099925, 4, '2021-02-07', 876.13, 'Pendiente'),
(9, 298185, 1, '2021-02-04', 545.55, 'Pendiente'),
(10, 15000125, 1, '2020-12-31', 15220, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasas`
--

DROP TABLE IF EXISTS `tasas`;
CREATE TABLE IF NOT EXISTS `tasas` (
  `id_tasa` int(11) NOT NULL AUTO_INCREMENT,
  `plazo_min` int(11) NOT NULL,
  `plazo_max` int(11) NOT NULL,
  `tasa_interes` double NOT NULL,
  PRIMARY KEY (`id_tasa`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `tasas`
--

INSERT INTO `tasas` (`id_tasa`, `plazo_min`, `plazo_max`, `tasa_interes`) VALUES
(1, 1, 1, 7),
(2, 2, 7, 6.5),
(3, 8, 15, 6),
(4, 16, 30, 5.5),
(5, 31, 360, 5),
(6, 1, 1, 1),
(7, 1, 1, 1),
(8, 9, 99, 999),
(9, 9, 99, 999),
(10, 9, 99, 999);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
