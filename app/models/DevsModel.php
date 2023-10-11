<?php

class DevsModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
    }

    public function getDevs() {
        $query = $this->db->prepare('SELECT * FROM desarrolladores');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}