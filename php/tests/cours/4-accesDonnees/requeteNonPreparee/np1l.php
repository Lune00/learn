<?php
require_once '../connexion/connexion.php';

$id = 1;
$query = 'SELECT * FROM articles WHERE identifiant = ' . $id . ';';
$arr = $pdo->query($query)->fetch();
var_dump($arr);

echo 'Article : ' . $arr['libelle'] . ' à ' . $arr[2] . ' €<br>';
