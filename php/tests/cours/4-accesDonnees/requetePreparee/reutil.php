<?php
require_once '../connexion/connexion.php';

$query = 'INSERT INTO articles(libelle, prix) VALUES(:libelle, :prix);';
$prep = $pdo->prepare($query);
$prep->bindParam(':libelle', $libelle);
$prep->bindParam(':prix', $prix);

$libelle = 'Chou-fleur';
$prix = 23.1;
$prep->execute();

$libelle = 'Poireau';
$prix = 15.7;
$prep->execute();

require '../afficheTousLesArticles.php';
