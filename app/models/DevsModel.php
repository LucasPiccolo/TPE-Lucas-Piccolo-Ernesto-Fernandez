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

    public function addDev() {
        $query = $this->db->prepare('INSERT INTO desarrolladores (nombreDesarrollador, fechaCreacion, origen) VALUES (?, ?, ?)');
        $query->execute([$_POST['nombreDesarrollador'], $_POST['fechaCreacion'], $_POST['origen']]);
    }

    public function deleteDev($id) {
        $query = $this->db->prepare('DELETE FROM desarrolladores WHERE id = ?');
        $query->execute([$id]);
    }
}