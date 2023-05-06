-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-05-2023 a las 18:45:03
-- Versión del servidor: 10.5.16-MariaDB
-- Versión de PHP: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id20606553_petscrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pets2`
--

CREATE TABLE `pets2` (
  `id` int(11) NOT NULL,
  `foto` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `raza` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pets2`
--

INSERT INTO `pets2` (`id`, `foto`, `nombre`, `raza`, `iduser`) VALUES
(15, 'https://www.disane.es/wp-content/uploads/Gatos-Sphynx.jpg', 'Astas ', 'Egipcio', 2),
(16, 'https://www.fanaticosdelasmascotas.cl/wp-content/uploads/2022/06/perro_salchicha_caracteristicas_shedara_weinsberg_shutterstock_portada.jpg', 'ssasLarguito', 'Salchichassaaaa', 1),
(18, 'https://nfnatcane.es/blog/wp-content/uploads/2020/01/gran-dan%C3%A9s-posando.jpg', 'Max', 'Danés ', 1),
(22, 'https://static.dw.com/image/42290411_303.jpg', 'Suegra', 'Cascabel', 2),
(47, 'f', 'a', 'a', 9),
(48, 'b', 'b', 'b', 2),
(49, 'a', 'a', 'a', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pets2`
--
ALTER TABLE `pets2`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pets2`
--
ALTER TABLE `pets2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
