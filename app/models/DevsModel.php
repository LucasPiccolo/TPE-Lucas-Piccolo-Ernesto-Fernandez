<?php

require_once './app/helpers/AuxHelper.php';

class DevsModel {
    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;dbname=tienda;charset=utf8', 'root', '');
        AuxHelper::deployDB();
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

    public function getDev($id) {
        $query = $this->db->prepare('SELECT * FROM desarrolladores WHERE desarrolladorId = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    public function editDev($id) {
        $query = $this->db->prepare('UPDATE desarrolladores SET nombreDesarrollador = ?, origen = ?, fechaCreacion = ? WHERE desarrolladorId = ?');
        $query->execute([$_POST['nombreDesarrollador'], $_POST['origen'], $_POST['fechaCreacion'], $id]);
    }

    public function deleteDev($id) {
        $query = $this->db->prepare('DELETE FROM desarrolladores WHERE desarrolladorId = ?');
        $query->execute([$id]);
    }
}