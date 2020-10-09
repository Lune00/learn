<?php
require_once '../connexion/connexion.php';

$query = 'SELECT * FROM articles;';
$stmt = $pdo->query($query);
$arrAll = $stmt->fetchAll();
for ($i = 0; $i < count($arrAll); $i++) {
    echo 'Article : ' . $arrAll[$i]['libelle'] . ' à ' . $arrAll[$i][2] . ' €<br>';
}
