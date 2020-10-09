<?php

require_once './Modele/accesDonnees.php';

function getRestaurants() {
    $pdo = getConnexion();
    $reqRest = 'SELECT idRestaurant, nom, ville, description FROM Restaurants;';
    return $pdo->query($reqRest);
}

function getRestaurant($idRestaurant) {
    $pdo = getConnexion();
    $reqRest = 'SELECT nom, adresse, cp, ville, telephone, description '
            . 'FROM Restaurants WHERE idRestaurant=:idRestaurant;';
    $prep = $pdo->prepare($reqRest);
    $prep->bindValue(':idRestaurant', $idRestaurant);
    $prep->execute();
    return $prep->fetch();
}

function getAvis($idRestaurant) {
    $pdo = getConnexion();
    $reqAvis = 'SELECT auteur, note, commentaire '
            . 'FROM avis WHERE idRestaurant=:idRestaurant;';
    $avis = $pdo->prepare($reqAvis);
    $avis->bindValue(':idRestaurant', $idRestaurant);
    $avis->execute();
    return $avis;
}
