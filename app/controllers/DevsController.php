<?php
require_once './app/models/DevsModel.php';
require_once './app/views/DevsView.php';
require_once "./app/helpers/AuthHelper.php";

class DevsController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new DevsModel();
        $this->view = new DevsView();
    }

    public function showDevs() {
        $devs = $this->model->getDevs();
        foreach($devs as $dev) {
            $dev->fechaCreacion = AuxHelper::reformatDate($dev->fechaCreacion);
        }
        $this->view->showDevs($devs);
    }

    public function showAddDev() {
        $this->view->showAddDev();
    }

    public function addNewDev() {
        if (empty($_POST['nombreDesarrollador']) || empty($_POST['fechaCreacion']) || empty($_POST['origen'])) {
            ErrorView::showError('No se pueden enviar datos vacíos!');
            die();
        }
        $this->model->addDev();
        header('Location: ' . BASE_URL . '/developers');
    }

    public function deleteDev($id) {
        $this->model->deleteDev($id);
        header('Location: ' . BASE_URL . '/developers');
    }
}