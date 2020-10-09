<?php
$idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
if (!$idR) {
    echo 'Identifiant de restaurant inexistant';
    die();
}
require_once './Modele/modeleRestaurant.php';
$r = getRestaurant($idR);

require 'Vue/vueRestaurant.php';
