<?php

class GamesModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
    }

    public function getGames() {
        $query = $this->db->prepare('SELECT juegos.*, desarrolladores.nombreDesarrollador FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.id');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getGamesByDevId($devId) {
        $query = $this->db->prepare('SELECT juegos.*, desarrolladores.nombreDesarrollador FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.id WHERE desarrolladores.id = ?');
        $query->execute([$devId]);
        return $query->fetchAll(PDO::FETCH_OBJ);
        
    }

    public function getGameById($id) {
        $query = $this->db->prepare('SELECT * FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.id WHERE juegos.id = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function addGame() {
        $query = $this->db->prepare('INSERT INTO juegos (nombreJuego, fechaLanzamiento, desarrolladorId, descripcionJuego, edad, imagen) VALUES (?, ?, ?, ?, ?, ?)');
        $query->execute([$_POST['nombreJuego'], $_POST['fechaLanzamiento'], $_POST['desarrolladorId'], $_POST['descripcionJuego'], $_POST['edad'], $_POST['imagen']]);
    }
}