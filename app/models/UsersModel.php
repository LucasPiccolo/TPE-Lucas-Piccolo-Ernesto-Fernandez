<?php

class UsersModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
    }

    public function getUser() {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE usuario = ?');
        $query->execute([$_POST['usuario']]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}