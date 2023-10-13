<?php

class GamesModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
    }

    public function getGames() {
        $query = $this->db->prepare('SELECT juegos.*, desarrolladores.nombreDesarrollador FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.desarrolladorId');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getGamesByDevId($devId) {
        $query = $this->db->prepare('SELECT juegos.*, desarrolladores.nombreDesarrollador FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.desarrolladorId WHERE desarrolladores.desarrolladorId = ?');
        $query->execute([$devId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
        
    }

    public function getGameById($id) {
        $query = $this->db->prepare('SELECT * FROM juegos INNER JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.desarrolladorId WHERE juegos.juegoId = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function addGame() {
        $query = $this->db->prepare('INSERT INTO juegos (nombreJuego, fechaLanzamiento, desarrolladorId, descripcionJuego, edad, imagen) VALUES (?, ?, ?, ?, ?, ?)');
        $query->execute([$_POST['nombreJuego'], $_POST['fechaLanzamiento'], $_POST['desarrolladorId'], $_POST['descripcionJuego'], $_POST['edad'], $_POST['imagen']]);
    }

    public function deleteGame($id) {
        $query = $this->db->prepare('DELETE FROM juegos WHERE juegoId = ?');
        $query->execute([$id]);
    }

    public function editGame($id) {
        $query = $this->db->prepare('UPDATE juegos SET nombreJuego = ?, fechaLanzamiento = ?, desarrolladorId = ?, descripcionJuego = ?, edad = ?, imagen = ? WHERE juegoId = ?');
        $query->execute([$_POST['nombreJuego'], $_POST['fechaLanzamiento'], $_POST['desarrolladorId'], $_POST['descripcionJuego'], $_POST['edad'], $_POST['imagen'], $id]);
    }
}