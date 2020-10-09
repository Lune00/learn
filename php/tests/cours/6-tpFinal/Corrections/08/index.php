<?php

require_once './Controleur/Controleur.php';
require_once './Vue/Vue.class.php';

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
    afficherErreur('L\'accès aux données a échoué (code : '.$e->getCode().')');
} catch (Exception $e) {
    afficherErreur($e->getMessage());
}

function afficherErreur($msgErreur) {
    $vue = new Vue('Erreur');
    $vue->afficher(['msgErreur' => $msgErreur]);
}
