<?php
require_once './Modele/Restaurant.class.php';
require_once './Modele/Avis.class.php';
require_once './Vue/Vue.class.php';
require_once './Controleur/Controleur.class.php';

class CtrlRestaurant extends Controleur {

    public function index() {
        $idRestaurant = filter_input(INPUT_GET, 'idRestaurant',
                FILTER_SANITIZE_NUMBER_INT);
        if (!$idRestaurant) {
            throw new Exception('L\'identifiant du restaurant doit être un '
                    . 'nombre');
        }
        $rest = new Restaurant();
        $r = $rest->getRestaurant($idRestaurant);
        $av = new Avis();
        $avis = $av->getAvis($idRestaurant);

        return(['r' => $r, 'avis' => $avis]);
    }

}
