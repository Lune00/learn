<?php
require_once './Modele/Restaurant.class.php';
require_once './Modele/Avis.class.php';
require_once './Vue/Vue.class.php';

function accueil() {
    $rest = new Restaurant();
    $restaurants = $rest->getRestaurants();
    $vue = new Vue('Accueil');
    $vue->afficher(['restaurants' => $restaurants]);
}

function restaurant() {
    $idRestaurant = filter_input(INPUT_GET, 'idRestaurant',
            FILTER_SANITIZE_NUMBER_INT);
    if (!$idRestaurant) {
        throw new Exception('L\'identifiant du restaurant doit être un nombre');
    }
    $rest = new Restaurant();
    $r = $rest->getRestaurant($idRestaurant);
    $av = new Avis();
    $avis = $av->getAvis($idRestaurant);

    $vue = new Vue('Restaurant');
    $vue->afficher(['r' => $r, 'avis' => $avis]);
}
