<?php

namespace Controleur;

class CtrlAccueil extends Controleur {

    public function index() {
        $rest = new \Modele\Restaurant();
        $restaurants = $rest->getRestaurants();
        return(['restaurants' => $restaurants]);
    }

}
