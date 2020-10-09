<?php
require_once '../connexion/connexion.php';

$libelle = 'Artichauts';

$query = 'UPDATE articles SET prix = prix/2 WHERE libelle=\'' . $libelle . '\';';
$rowcount = $pdo->exec($query);
echo "Nombre de lignes modifiées : " . $rowcount . '<br>';

require '../afficheTousLesArticles.php';
