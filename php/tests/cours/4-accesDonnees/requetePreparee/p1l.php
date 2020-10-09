<?php
require_once '../connexion/connexion.php';

$id = 1;
// Préparer la requête
$query = 'SELECT * FROM articles WHERE identifiant = ?;';
$prep = $pdo->prepare($query);
// Associer des valeurs aux "trous"
$prep->bindValue(1, $id);
// Exécuter la requête
$prep->execute();
// Récupérer les données retournées.
$arr = $prep->fetch();
var_dump($arr);

echo 'Article : ' . $arr['libelle'] . ' à ' . $arr[2] . ' €<br>';
