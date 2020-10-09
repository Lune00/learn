<?php
require_once './tp1cnx.php';

$ajouter = filter_input(INPUT_POST, 'Ajouter', FILTER_SANITIZE_STRING);
if ($ajouter) {
    $req = $pdo->prepare('INSERT INTO modeles(id_modele, marque, modele, carburant) ' .
            'VALUES(:id_modele, :marque, :modele, :carburant);');
    $req->bindValue(':id_modele', filter_input(INPUT_POST, 'Identifian', FILTER_SANITIZE_STRING));
    $req->bindValue(':marque', filter_input(INPUT_POST, 'Marque', FILTER_SANITIZE_STRING));
    $req->bindValue(':modele', filter_input(INPUT_POST, 'Modle', FILTER_SANITIZE_STRING));
    $req->bindValue(':carburant', filter_input(INPUT_POST, 'Carburant', FILTER_SANITIZE_STRING));
    $req->execute();
    $req->closeCursor();
}
