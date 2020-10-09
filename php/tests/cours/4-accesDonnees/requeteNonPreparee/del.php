<?php
require_once '../connexion/connexion.php';

$prix = 10;
$query = 'DELETE FROM articles WHERE prix < ' . $prix . ';';
$rowcount = $pdo->exec($query);
echo "Nombre de lignes supprimées : " . $rowcount . '<br>';

require '../afficheTousLesArticles.php';
