<?php
// Hacemos un require_once de los controllers que usamos
require_once './app/controllers/GamesController.php';
require_once './app/controllers/DevsController.php';
require_once './app/views/ErrorView.php';

// Definimos la constante "BASE_URL"
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'games'; // Accion por defecto
// Verificamos que la acción exista
if (!empty( $_GET['action'])) {
    $action = $_GET['action'];
}

// TABLA DE RUTEO:
// games    ->      gamesController->showGames();
// devs     ->      devsController->showDevs();


// parseamos la accion para separar accion real de parametros
$params = explode('/', $action);

switch ($params[0]) {
    case 'games':
        $controller = new GamesController();
        if(isset($params[1]) && $params[1] == 'developer') {
            $controller->showGames($params[2]);
        } else {
            $controller->showGames();
        }
        break;
    case 'game':
        $controller = new GamesController();
        $controller->showGameById($params[1]);
        break;
    case 'developers':
        $controller = new DevsController();
        $controller->showDevs();
        break;
    default: 
        ErrorView::showError('404 - Not Found');
        break;
}