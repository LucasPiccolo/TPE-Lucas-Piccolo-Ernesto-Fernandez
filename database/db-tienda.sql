-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2023 at 11:44 PM
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
-- Table structure for table `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fechaLanzamiento` date NOT NULL,
  `desarrollador` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `juegos`
--

INSERT INTO `juegos` (`id`, `nombre`, `fechaLanzamiento`, `desarrollador`, `edad`, `imagen`) VALUES
(2, 'The Last Of Us', '2012-12-12', 1, 18, 'https://img.asmedia.epimg.net/resizer/xjK55qhcyoGe3KW7IvBmm76g_Z8=/736x414/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/4R5II3XXYZL3VJZUJWE4JUPNTI.jpg'),
(7, 'Otro juego', '2018-01-05', 1, 18, 'https://img.asmedia.epimg.net/resizer/xjK55qhcyoGe3KW7IvBmm76g_Z8=/736x414/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/4R5II3XXYZL3VJZUJWE4JUPNTI.jpg'),
(8, 'Outlast', '0000-00-00', 1, 18, ''),
(9, 'FIFA', '2024-07-27', 2, 5, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desarrollador` (`desarrollador`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`desarrollador`) REFERENCES `desarrolladores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
