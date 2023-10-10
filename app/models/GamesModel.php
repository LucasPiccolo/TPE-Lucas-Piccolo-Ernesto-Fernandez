<?php

class GamesModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
    }

    public function getGames() {
        $query = $this->db->prepare('SELECT * FROM juegos');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}