<?php
namespace Controleur;

class CtrlAccueil extends Controleur {

    public function index() {
        $resto = new \Modele\Restaurant();
        return ['restaurants' => $resto->getRestaurants()];
    }

}
