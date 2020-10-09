<?php
require_once '../connexion/connexion.php';

$prix = 25;
$query = 'DELETE FROM articles WHERE prix < :prix;';
$prep = $pdo->prepare($query);
$prep->bindValue(':prix', $prix);
$prep->execute();
echo "Nombre de lignes supprimées : " . $prep->rowCount() . '<br>';

require '../afficheTousLesArticles.php';
