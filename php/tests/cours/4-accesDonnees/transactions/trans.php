<?php
require_once '../connexion/connexion.php';

$pdo->beginTransaction();

$pdo->query('INSERT INTO articles(identifiant, libelle, prix) VALUES(101, \'mirabelle\', 56.8)');
$pdo->query('INSERT INTO articles(identifiant, libelle, prix) VALUES(102, \'topinambour\', 22.3)');

echo '<h3>Avant le RollBack</h3>';
require '../afficheTousLesArticles.php';

$pdo->rollback();

echo '<h3>Après le RollBack</h3>';
require '../afficheTousLesArticles.php';
