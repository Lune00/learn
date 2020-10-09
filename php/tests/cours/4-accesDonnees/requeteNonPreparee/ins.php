<?php
require_once '../connexion/connexion.php';

$id = 9;
$libelle = 'Artichauts';
$prix = 7.2;
$query = 'INSERT INTO articles(identifiant, libelle, prix) VALUES(' . $id . ', \'' . $libelle . '\', ' . $prix . ');';
$rowcount = $pdo->exec($query);
echo "Nombre de lignes insérées : " . $rowcount . '<br>';

require '../afficheTousLesArticles.php';
