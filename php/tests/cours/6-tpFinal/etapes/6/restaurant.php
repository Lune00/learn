<?php
$idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
try {
    if (!$idR)
        throw new Exception('L\'identifiant d\'un restaurant doit être un nombre entier');
    require_once './Modele/modeleRestaurant.php';
    $r = getRestaurant($idR);
    if (!$r)
        throw new Exception('Identifiant de restaurant inexistant');
    require 'Vue/vueRestaurant.php';
} catch (PDOException $e) {
    $message = 'Une erreur est survenue avec la base de données : ' .
            $e->getMessage();
    require './Vue/vueErreur.php';
} catch (Exception $e) {
    $message = $e->getMessage();
    require './Vue/vueErreur.php';
}
