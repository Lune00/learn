<?php
require_once '../connexion/connexion.php';

$id = 3;

$query = 'CALL info(:id);';
$prep = $pdo->prepare($query);
$prep->bindValue(':id', $id);

$prep->execute();
$arr = $prep->fetch();
var_dump($arr);

echo 'Article : ' . $arr['libelle'] . ' à ' . $arr['prix'] . ' €.';
