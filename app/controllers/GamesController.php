<?php
require_once "./app/models/GamesModel.php";
require_once "./app/models/DevsModel.php";
require_once "./app/views/GamesView.php";
require_once "./app/helpers/AuxHelper.php";

class GamesController {
    private $gamesModel;
    private $devsModel;
    private $view;

    public function __construct() {
        $this->gamesModel = new GamesModel();
        $this->devsModel = new DevsModel();
        $this->view = new GamesView();
    }

    public function showGames($devId = -1) {
        if($devId == -1) {
            $games = $this->gamesModel->getGames();
        } else {
            $games = $this->gamesModel->getGamesByDevId($devId);
        }
        $devs = $this->devsModel->getDevs();
        foreach($games as $game) {
            $game->fechaLanzamiento = AuxHelper::reformatDate($game->fechaLanzamiento);
        }
        $this->view->showGames($games, $devs);
    }

    public function showGameById($id) {
        $game = $this->gamesModel->getGameById($id);
        if($game) {
            $this->view->showGame($game);
        } else {
            ErrorView::showError('404 - Not Found: El juego seleccionado no existe.');
        }
    }
}