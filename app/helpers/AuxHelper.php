<?php

require_once './config.php';

class AuxHelper {
    public static function reformatDate($date) {
        $params = explode('-', $date);
        $date = "$params[2]/$params[1]/$params[0]";
        return $date;
    }

    public static function deployDB() {
        $db = new PDO('mysql:host=' . MYSQL_HOST, MYSQL_USER, MYSQL_PASS);
        $sql =<<<END
            SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
            START TRANSACTION;
            SET time_zone = "+00:00";
        
            CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
            USE `tienda`;

            CREATE TABLE `desarrolladores` (
                `desarrolladorId` int(11) NOT NULL,
            `fechaCreacion` date NOT NULL,
            `origen` varchar(45) NOT NULL,
            `nombreDesarrollador` varchar(45) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
            
            INSERT INTO `desarrolladores` (`desarrolladorId`, `fechaCreacion`, `origen`, `nombreDesarrollador`) VALUES
            (4, '2006-06-12', 'EEUU', 'PopCap Games'),
            (5, '2009-09-12', 'Noruega', 'Mojang'),
            (7, '1992-04-25', 'EEUU', 'Blizzard');
            
            CREATE TABLE `juegos` (
                `juegoId` int(11) NOT NULL,
                `nombreJuego` varchar(45) NOT NULL,
                `fechaLanzamiento` date NOT NULL,
                `desarrolladorId` int(11) NOT NULL,
                `descripcionJuego` text NOT NULL,
                `edad` int(11) NOT NULL,
                `imagen` varchar(200) NOT NULL
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
                
                INSERT INTO `juegos` (`juegoId`, `nombreJuego`, `fechaLanzamiento`, `desarrolladorId`, `descripcionJuego`, `edad`, `imagen`) VALUES
                (12, 'Plantas vs Zombies', '2008-09-10', 4, 'Plantas que pelean contra zombis', 3, 'Sin imagen todavía'),
                (13, 'Minecraft', '2009-07-08', 5, 'Juego de supervivencia libre', 8, 'Sin imagen todavía'),
                (16, 'Diablo 3', '2012-02-11', 7, 'ARPG muy buen juego', 13, 'https://oyster.ignimgs.com/mediawiki/apis.ign.com/diablo-3/6/60/Diablo-3-Reaper-of-Souls-Wallpaper-6.jpg?width=960');

            CREATE TABLE `usuarios` (
            `usuario` varchar(200) NOT NULL,
            `contra` varchar(200) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
            
            INSERT INTO `usuarios` (`usuario`, `contra`) VALUES
            ('webadmin', '$2y$10$5iX0BZS3E2qRR090rtKUqOfAc0XDL6XFpVFBpWODBWxIsw/t65DRq');
            
            ALTER TABLE `desarrolladores`
            ADD PRIMARY KEY (`desarrolladorId`);
            
            ALTER TABLE `juegos`
            ADD PRIMARY KEY (`juegoId`),
            ADD KEY `desarrollador` (`desarrolladorId`) USING BTREE;
            
            ALTER TABLE `usuarios`
            ADD PRIMARY KEY (`usuario`);
            
            ALTER TABLE `desarrolladores`
            MODIFY `desarrolladorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
            
            ALTER TABLE `juegos`
            MODIFY `juegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
            
            ALTER TABLE `juegos`
            ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`desarrolladorId`) REFERENCES `desarrolladores` (`desarrolladorId`);
            COMMIT;
        END;
        $db->query($sql);
    }
}