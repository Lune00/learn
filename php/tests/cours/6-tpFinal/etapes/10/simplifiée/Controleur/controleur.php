<?php
require_once './Modele/Restaurant.class.php';
require_once './Modele/Avis.class.php';
require_once './Vue/Vue.class.php';

function restaurant($idR) {
    if (!$idR)
        throw new Exception('L\'identifiant d\'un restaurant doit être un nombre entier');
    $resto = new Restaurant();
    $r = $resto->getRestaurant($idR);
    if (!$r)
        throw new Exception('Identifiant de restaurant inexistant');
    $av = new Avis();
    $lesAvis = $av->getAvis($idR);
    $v = new Vue('Restaurant');
    $v->afficher(['r'=>$r,'lesAvis'=>$lesAvis]);
    //require 'Vue/vueRestaurant.php';
}

function accueil() {
    $resto = new Restaurant();
    $v = new Vue('Accueil');
    $v->afficher(['restaurants'=>$resto->getRestaurants()]);
    //require 'Vue/vueAccueil.php';
}
