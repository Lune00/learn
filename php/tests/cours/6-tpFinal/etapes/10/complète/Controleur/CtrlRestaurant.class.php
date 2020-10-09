<?php
require_once 'Vue/Vue.class.php';
require_once 'Modele/Restaurant.class.php';
require_once 'Modele/Avis.class.php';
require_once 'Controleur/Controleur.class.php';

class CtrlRestaurant extends Controleur {

    public function index() {
        $idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
        if (!$idR)
            throw new Exception('L\'identifiant d\'un restaurant doit être un nombre entier');
        $resto = new Restaurant();
        $r = $resto->getRestaurant($idR);
        if (!$r)
            throw new Exception('Identifiant de restaurant inexistant');
        $av = new Avis();
        $lesAvis = $av->getAvis($idR);
        return ['r' => $r, 'lesAvis' => $lesAvis];
    }

}
