<?php
// Hacemos un require_once de los controllers que usamos

// Definimos la constante "BASE_URL"
define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'home'; // Accion por defecto
// Verificamos que la acción exista
if (!empty( $_GET['action'])) {
    $action = $_GET['action'];
}

// TABLA DE RUTEO:
// example    ->         exampleController->showSomething();


// parseamos la accion para separar accion real de parametros
$params = explode('/', $action);

switch ($params[0]) {
    case 'home':
        $controller = new TaskController();
        $controller->showTasks();
        break;
    default: 
        echo "404 Page Not Found";
        break;
}