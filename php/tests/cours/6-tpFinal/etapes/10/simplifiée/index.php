<?php
require_once './Controleur/controleur.php';

$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
try { 
    if ($action == '')
        $action = 'accueil';

    if ($action === 'restaurant') {
        $idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
        restaurant($idR);
    }

   else if ($action === 'accueil') {
        accueil();
    }
    else {
        throw new Exception("Action non valable");
    }
} catch (PDOException $e) {
    $v = new Vue('Erreur');
    $v->afficher(['message'=>'Une erreur est survenue avec la base de données : ' . $e->getMessage()]);
} catch (Exception $e) {
    $v = new Vue('Erreur');
    $v->afficher(['message'=> $e->getMessage()]);
}