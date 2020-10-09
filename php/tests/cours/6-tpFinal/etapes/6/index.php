<?php
require_once 'Modele/modeleRestaurant.php';
try {
$restaurants = getRestaurants();
require 'Vue/vueAccueil.php';
} catch (PDOException $e) {
    $message = 'Une erreur est survenue avec la base de données : '.
            $e->getMessage();
    require './Vue/vueErreur.php';
} catch (Exception $e) {
    $message = $e->getMessage();
    require './Vue/vueErreur.php';
}
