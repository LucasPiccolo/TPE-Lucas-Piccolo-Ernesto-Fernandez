<?php

class GamesView {
    public function showGames($games) {
        echo '<ul>';
        foreach($games as $game) {
            echo "<li>$game->nombre</li>";
        }
        echo '</ul>';
    }
}