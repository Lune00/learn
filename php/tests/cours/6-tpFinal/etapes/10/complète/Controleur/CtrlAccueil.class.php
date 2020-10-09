<?php
require_once 'Vue/Vue.class.php';
require_once 'Modele/Restaurant.class.php';
require_once 'Controleur/Controleur.class.php';

class CtrlAccueil extends Controleur {

    public function index() {
        $resto = new Restaurant();
        return ['restaurants' => $resto->getRestaurants()];
    }

}
