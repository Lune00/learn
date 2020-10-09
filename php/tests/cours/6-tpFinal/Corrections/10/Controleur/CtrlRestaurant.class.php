<?php

namespace Controleur;

class CtrlRestaurant extends Controleur {

    public function index() {
        $idRestaurant = filter_input(INPUT_GET, 'idRestaurant', FILTER_SANITIZE_NUMBER_INT);
        if (!$idRestaurant) {
            throw new Exception('L\'identifiant du restaurant doit être un nombre');
        }
        $rest = new \Modele\Restaurant();
        $r = $rest->getRestaurant($idRestaurant);
        $av = new \Modele\Avis();
        $avis = $av->getAvis($idRestaurant);

        return(['r' => $r, 'avis' => $avis]);
    }

}
