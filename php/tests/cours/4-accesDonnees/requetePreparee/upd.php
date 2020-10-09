<?php
require_once '../connexion/connexion.php';

$libelle = 'Artichauts';

$query = 'UPDATE articles SET prix = prix/2 WHERE libelle=:libelle;';
$prep = $pdo->prepare($query);
$prep->bindValue(':libelle', $libelle);
$prep->execute();
echo "Nombre de lignes modifiées : " . $prep->rowCount() . '<br>';

require '../afficheTousLesArticles.php';
