<?php
namespace Controleur;

class CtrlRestaurant extends Controleur {

    public function index() {
        $idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
        if (!$idR)
            throw new \Exception('L\'identifiant d\'un restaurant doit être un nombre entier');
        $resto = new \Modele\Restaurant();
        $r = $resto->getRestaurant($idR);
        if (!$r)
            throw new \Exception('Identifiant de restaurant inexistant');
        $av = new \Modele\Avis();
        $lesAvis = $av->getAvis($idR);
        return ['r' => $r, 'lesAvis' => $lesAvis];
    }

}
