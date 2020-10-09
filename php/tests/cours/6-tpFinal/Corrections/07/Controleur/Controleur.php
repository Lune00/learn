<?php
require_once './Modele/Restaurant.class.php';
require_once './Modele/Avis.class.php';

function accueil() {
    $rest = new Restaurant();
    $restaurants = $rest->getRestaurants();
    require './Vue/vueAccueil.php';
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

    require './Vue/vueRestaurant.php';
}
