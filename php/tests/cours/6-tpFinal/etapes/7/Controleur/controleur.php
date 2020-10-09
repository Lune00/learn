<?php
require_once './Modele/modeleRestaurant.php';

function restaurant($idR) {
    if (!$idR)
        throw new Exception('L\'identifiant d\'un restaurant doit être un nombre entier');
    $r = getRestaurant($idR);
    if (!$r)
        throw new Exception('Identifiant de restaurant inexistant');
    require 'Vue/vueRestaurant.php';
}

function accueil() {
    $restaurants = getRestaurants();
    require 'Vue/vueAccueil.php';
}
