<?php
require_once './Modele/modeleRestaurant.php';

try {
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
} catch (PDOException $e) {
    $msgErreur = 'L\'accès aux données a échoué (code : ' . $e->getCode() . ')';
    require './Vue/vueErreur.php';
} catch (Exception $e) {
    $msgErreur = $e->getMessage();
    require './Vue/vueErreur.php';
}
