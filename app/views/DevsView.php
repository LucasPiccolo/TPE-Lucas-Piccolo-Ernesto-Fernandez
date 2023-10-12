<?php

class DevsView {
    public function showDevs($devs) {
        require './templates/devsList.phtml';
    }

    public function showAddDev() {
        require './templates/addDev.phtml';
    }
}