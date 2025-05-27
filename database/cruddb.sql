-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2025 a las 05:46:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cruddb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `Codigo` int(11) NOT NULL,
  `Localizacion` varchar(100) DEFAULT NULL,
  `LibroCodigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escribe`
--

CREATE TABLE `escribe` (
  `AutorCodigo` int(11) NOT NULL,
  `LibroCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `Codigo` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Editorial` varchar(100) DEFAULT NULL,
  `Paginas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saca`
--

CREATE TABLE `saca` (
  `UsuarioCodigo` int(11) NOT NULL,
  `EjemplarCodigo` int(11) NOT NULL,
  `FechaPrest` date NOT NULL,
  `FechaDev` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `LibroCodigo` (`LibroCodigo`);

--
-- Indices de la tabla `escribe`
--
ALTER TABLE `escribe`
  ADD PRIMARY KEY (`AutorCodigo`,`LibroCodigo`),
  ADD KEY `LibroCodigo` (`LibroCodigo`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `saca`
--
ALTER TABLE `saca`
  ADD PRIMARY KEY (`UsuarioCodigo`,`EjemplarCodigo`,`FechaPrest`),
  ADD KEY `EjemplarCodigo` (`EjemplarCodigo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`LibroCodigo`) REFERENCES `libro` (`Codigo`);

--
-- Filtros para la tabla `escribe`
--
ALTER TABLE `escribe`
  ADD CONSTRAINT `escribe_ibfk_1` FOREIGN KEY (`AutorCodigo`) REFERENCES `autor` (`Codigo`),
  ADD CONSTRAINT `escribe_ibfk_2` FOREIGN KEY (`LibroCodigo`) REFERENCES `libro` (`Codigo`);

--
-- Filtros para la tabla `saca`
--
ALTER TABLE `saca`
  ADD CONSTRAINT `saca_ibfk_1` FOREIGN KEY (`UsuarioCodigo`) REFERENCES `usuario` (`Codigo`),
  ADD CONSTRAINT `saca_ibfk_2` FOREIGN KEY (`EjemplarCodigo`) REFERENCES `ejemplar` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
