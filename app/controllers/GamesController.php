<?php
require_once "./app/models/GamesModel.php";
require_once "./app/views/GamesView.php";

class GamesController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new GamesModel();
        $this->view = new GamesView();
    }

    public function showGames() {
        $games = $this->model->getGames();
        $this->view->showGames($games);
    }
}