-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-08-2023 a las 17:22:15
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `folio` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `nombre`, `domicilio`, `ciudad`, `telefono`, `folio`) VALUES
(1, 'Pepe', 'su kasita', 'hpo', '34434', '43'),
(2, 'Pepe', 'su kasita', 'hpo', '34434', '43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientesxcuenta`
--

CREATE TABLE `clientesxcuenta` (
  `idCliente` int(11) NOT NULL,
  `numCuenta` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `numCuenta` varchar(17) NOT NULL DEFAULT '0000000000000000',
  `saldo` float NOT NULL DEFAULT 0,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`numCuenta`, `saldo`, `fecha`) VALUES
('0000000000000001', 100, '2023-08-16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `clientesxcuenta`
--
ALTER TABLE `clientesxcuenta`
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `numCuenta` (`numCuenta`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`numCuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientesxcuenta`
--
ALTER TABLE `clientesxcuenta`
  ADD CONSTRAINT `clientesxcuenta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`IdCliente`),
  ADD CONSTRAINT `clientesxcuenta_ibfk_2` FOREIGN KEY (`numCuenta`) REFERENCES `cuenta` (`numCuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
