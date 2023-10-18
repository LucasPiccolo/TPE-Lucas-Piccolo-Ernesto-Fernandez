-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 04:47 AM
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
(7, '1992-04-25', 'EEUU', 'Blizzard'),
(8, '1995-06-15', 'EEUU', 'Rockstar');

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
(12, 'Plantas vs Zombies', '2009-05-05', 4, 'El objetivo del juego es similar a otros juegos del tipo defensa de torres. Los zombis aparecen mientras aparece un aviso que le indica al jugador de que la partida comenzará. El jugador va disponiendo diferentes plantas mutantes con distintas características de ataque o defensa en tres lugares diferentes de la casa (jardín delantero, jardín trasero/piscina y tejado) para detener a la horda de zombis que intenta devorar los cerebros de los residentes. Los zombis presentan diferentes atributos y habilidades, como cavar por debajo de las plantas o saltar por encima de estas con la ayuda de pértigas, llevar diferentes objetos como casco o conos, escaleras, globos, que los hacen más difíciles de derrotar. También otra de las habilidades que poseen ciertos tipos de zombi son invocar a cuatro zombis extra para realizar una coreografía inspirada en \"Thriller\" en la que aparece un zombi caracterizado como Michael Jackson (que luego sería cambiado por un bailarín disco de los 70 y este cambio también se aplica en los zombis extra debido a problemas legales). También hay un zombi yeti (zombi secreto), que se encuentra cuando se llega al nivel 4-10 por segunda vez.', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Plantas_contra_Zombis.svg/375px-Plantas_contra_Zombis.svg.png'),
(13, 'Minecraft', '2011-11-18', 5, 'Minecraft es un juego de mundo abierto, y no tiene un fin claramente definido (aunque sí que tiene una dimensión llamada a sí misma \'The End\', o en español \'El Final\' en donde después de entrar y matar a la dragona aparecen los créditos del juego y un poema).31​ Esto permite una gran libertad en cuanto a la elección de su forma de jugar. A pesar de ello, el juego posee un sistema que otorga logros por completar ciertas acciones. La cámara es en primera persona, aunque los jugadores tienen la posibilidad de cambiarla a una perspectiva de tercera persona en cualquier momento.', 8, 'https://www.minecraft.net/content/dam/games/minecraft/key-art/SUPM_Game-Image_One-Vanilla_672x400.jpg'),
(16, 'Diablo 3', '2012-05-15', 7, 'Diablo III es un RPG de acción con un estilo similar a su predecesor, Diablo II , mientras que mantiene muy pocos elementos del Diablo original. Diablo III se enfoca en el juego cooperativo o en equipo. En el modo cooperativo multijugador las partidas tendrán una capacidad máxima de 4 jugadores, a diferencia que en Diablo II eran 8; Blizzard dio como explicación a esto que después de múltiples pruebas y debido a diversos factores concluyeron que 4 jugadores sería el número \"perfecto\" pues haría que el juego sea más eficiente y más claro. La compañía en un principio utilizó el motor Havok con el fin de obtener un mayor realismo, que más tarde confirmó que no usaría. Los desarrolladores están buscando que el juego corra en un amplio rango de sistemas, y han dicho que DirectX 10 no será necesario.5​ Se lanzó para Windows y Mac OS X.', 13, 'https://oyster.ignimgs.com/mediawiki/apis.ign.com/diablo-3/6/60/Diablo-3-Reaper-of-Souls-Wallpaper-6.jpg?width=960'),
(21, 'Hearthstone: Heroes of Warcraft', '2014-03-11', 7, 'Hearthstone es un juego de cartas coleccionables en línea que se basa en partidas por turnos entre dos oponentes, operado a través del Battle.net de Blizzard.4​ Los jugadores pueden escoger entre diferentes modos de juego que ofrecen diferentes experiencias.\r\n\r\nEl juego presenta once héroes, (en la última expansión se incluyó al nuevo héroe, Caballero de la Muerte) cada uno de ellos representando una clase distinta dentro del universo de Warcraft como Mago o Pícaro, exceptuando al Monje. Cada héroe presenta habilidades o los denominados poderes de héroe.', 7, 'https://d2q63o9r0h0ohi.cloudfront.net/_next/static/images/default-4fff3c606c794dc03a915b9071f562d3.jpg'),
(22, 'GTA V', '2013-09-17', 8, 'Grand Theft Auto V (abreviado como GTA V o GTA 5) es un videojuego de acción-aventura de mundo abierto en tercera persona desarrollado por el estudio escocés Rockstar North y distribuido por Rockstar Games. Este título revolucionario hizo su debut el 17 de septiembre de 2013 en las consolas Xbox 360 y PlayStation 3. Posteriormente, experimentó una reaparición el 18 de noviembre de 2014 en las consolas de nueva generación, Xbox One y PlayStation 4, con una perspectiva en primera persona. El juego luego amplió su alcance a Microsoft Windows el 14 de abril de 2015. El capítulo más reciente en su historia confirmó su llegada a Xbox Series X/S y PlayStation 5 en marzo de 2022, alardeando de impresionantes mejoras gráficas, incluido el soporte para una resolución de 8K y fluidos 120 FPS. Marca un hito significativo al ser la primera entrada importante en la serie Grand Theft Auto desde la presentación de Grand Theft Auto IV en 2008, marcando el comienzo de la \"era HD\" para la franquicia.', 18, 'https://image.api.playstation.com/cdn/UP1004/CUSA00419_00/bTNSe7ok8eFVGeQByA5qSzBQoKAAY32R.png');

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
('webadmin', '$2y$10$5iX0BZS3E2qRR090rtKUqOfAc0XDL6XFpVFBpWODBWxIsw/t65DRq');

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
  MODIFY `desarrolladorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `juegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
