<?php
require_once '../connexion/connexion.php';

$query = 'CALL statistiques();';
$arr = $pdo->query($query)->fetch();
var_dump($arr);

echo 'Il y a ' . $arr['nbArticles'] . ' article' . ($arr['nbArticles'] > 1 ? 's' : '') . '<br>';
echo 'Prix moyen : ' . number_format($arr['prixMoyen'], 2, '€', ' ') . '.';
