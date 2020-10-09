<?php
require_once '../connexion/connexion.php';

$prixMax = 40;
$query = 'SELECT * FROM articles WHERE prix < :prixMax;';
$prep = $pdo->prepare($query);
$prep->bindValue(':prixMax', $prixMax);
$prep->execute();
$arrAll = $prep->fetchAll();
var_dump($arrAll);

for ($i = 0; $i < count($arrAll); $i++) {
    echo 'Article : ' . $arrAll[$i]['libelle'] . ' à ' . $arrAll[$i][2] . ' €<br>';
}
