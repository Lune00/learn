<?php
require_once './Modele/modeleRestaurant.php';

$idRestaurant = filter_input(INPUT_GET, 'idRestaurant',
        FILTER_SANITIZE_NUMBER_INT);
if (!$idRestaurant) {
    exit('L\'identifiant du restaurant doit être un nombre');
}
$r = getRestaurant($idRestaurant);
if(!$r) {
    exit('Ce restaurant n\'existe pas');
}
$avis = getAvis($idRestaurant);

require './Vue/vueRestaurant.php';
