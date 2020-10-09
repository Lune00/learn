<?php
require_once '../connexion/connexion.php';


$id = 2;
$query = 'SELECT nomArticle(:id);';
$prep = $pdo->prepare($query);
$prep->bindValue(':id', $id);
$prep->execute();
$arr= $prep->fetch();
var_dump($arr);

echo 'Article : ' . $arr[0];
