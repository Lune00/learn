<?php
require_once './Modele/modeleRestaurant.php';
try {
$restaurants = getRestaurants();
require './Vue/vueAccueil.php';
} catch (PDOException $e) {
    $msgErreur = 'L\'accès aux données a échoué (code : '.$e->getCode().')';
    require './Vue/vueErreur.php';
}