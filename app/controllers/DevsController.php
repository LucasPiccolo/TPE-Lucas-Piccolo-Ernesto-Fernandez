<?php
require_once './app/models/DevsModel.php';
require_once './app/views/DevsView.php';

class DevsController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new DevsModel();
        $this->view = new DevsView();
    }

    public function showDevs() {
        $devs = $this->model->getDevs();
        $this->view->showDevs($devs);
    }
}