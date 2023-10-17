-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 02:25 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `desarrolladores`
--

CREATE TABLE `desarrolladores` (
  `desarrolladorId` int(11) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `origen` varchar(45) NOT NULL,
  `nombreDesarrollador` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `desarrolladores`
--

INSERT INTO `desarrolladores` (`desarrolladorId`, `fechaCreacion`, `origen`, `nombreDesarrollador`) VALUES
(4, '2006-06-12', 'EEUU', 'PopCap Games'),
(5, '2009-09-12', 'Noruega', 'Mojang'),
(7, '1992-04-25', 'EEUU', 'Blizzard');

-- --------------------------------------------------------

--
-- Table structure for table `juegos`
--

CREATE TABLE `juegos` (
  `juegoId` int(11) NOT NULL,
  `nombreJuego` varchar(45) NOT NULL,
  `fechaLanzamiento` date NOT NULL,
  `desarrolladorId` int(11) NOT NULL,
  `descripcionJuego` text NOT NULL,
  `edad` int(11) NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`juegoId`, `nombreJuego`, `fechaLanzamiento`, `desarrolladorId`, `descripcionJuego`, `edad`, `imagen`) VALUES
(12, 'Plantas vs Zombies', '2008-09-10', 4, 'Plantas que pelean contra zombis', 3, 'Sin imagen todavía'),
(13, 'Minecraft', '2009-07-08', 5, 'Juego de supervivencia libre', 8, 'Sin imagen todavía'),
(16, 'Diablo 3', '2012-02-11', 7, 'ARPG muy buen juego', 13, 'https://oyster.ignimgs.com/mediawiki/apis.ign.com/diablo-3/6/60/Diablo-3-Reaper-of-Souls-Wallpaper-6.jpg?width=960');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(200) NOT NULL,
  `contra` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `contra`) VALUES
('webadmin', '$2y$10$qu9BcQILnTyPSlqFLs59qOgPW5Yc9.PXAgoF0jjqa6jk33A672d3q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `desarrolladores`
--
ALTER TABLE `desarrolladores`
  ADD PRIMARY KEY (`desarrolladorId`);

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`juegoId`),
  ADD KEY `desarrollador` (`desarrolladorId`) USING BTREE;

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `desarrolladores`
--
ALTER TABLE `desarrolladores`
  MODIFY `desarrolladorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `juegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`desarrolladorId`) REFERENCES `desarrolladores` (`desarrolladorId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
