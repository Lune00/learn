<?php

require_once 'Modele/accesDonnees.php';

function getRestaurants() {
    $pdo = getConnexion();
    return $pdo->query('SELECT * FROM Restaurants;');
}

function getRestaurant($idR) {
    $pdo = getConnexion();

    $req = $pdo->prepare('SELECT * FROM Restaurants WHERE idRestaurant=:idR');
    $req->bindValue(':idR', $idR);
    $req->execute();
    return $req->fetch();
}

function getAvis($idR) {
    $pdo = getConnexion();

    $reqAvis = $pdo->prepare('SELECT * FROM Avis WHERE idRestaurant=:idR');
    $reqAvis->bindValue(':idR', $idR);
    $reqAvis->execute();
    return $reqAvis;
}
