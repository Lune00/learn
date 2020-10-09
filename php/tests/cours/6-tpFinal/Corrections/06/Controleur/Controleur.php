<?php

require_once './Modele/modeleRestaurant.php';

function accueil() {
    $restaurants = getRestaurants();
    require './Vue/vueAccueil.php';
}

function restaurant() {
    $idRestaurant = filter_input(INPUT_GET, 'idRestaurant',
            FILTER_SANITIZE_NUMBER_INT);
    if (!$idRestaurant) {
        throw new Exception('L\'identifiant du restaurant doit être un nombre');
    }
    $r = getRestaurant($idRestaurant);
    if (!$r) {
        throw new Exception('Ce restaurant n\'existe pas');
    }
    $avis = getAvis($idRestaurant);

    require './Vue/vueRestaurant.php';
}
