<?php

require_once './Controleur/Controleur.php';

try {
    $action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
    if ($action == '') {
        accueil();
    } elseif ($action == 'restaurant') {
        restaurant();
    } else {
        throw new Exception('Action inconnue');
    }
} catch (PDOException $e) {
    $msgErreur = 'L\'accès aux données a échoué (code : ' . $e->getCode() . ')';
    require './Vue/vueErreur.php';
} catch (Exception $e) {
    $msgErreur = $e->getMessage();
    require './Vue/vueErreur.php';
}