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

    public function getGamesByDev($dev) {
        $query = $this->db->prepare('SELECT juegos.*, desarrolladores.id, desarrolladores.nombreDesarrollador FROM juegos JOIN desarrolladores ON juegos.desarrolladorId = desarrolladores.id WHERE desarrolladores.nombreDesarrollador = ?');
        $query->execute([$dev]);
        $games = $query->fetchAll(PDO::FETCH_OBJ);
        return $games;
    }
}