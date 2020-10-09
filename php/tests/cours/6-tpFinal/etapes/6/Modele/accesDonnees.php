<?php
function getConnexion() {
    $chaineCnx = 'mysql:host=localhost;dbname=restaurant';
    $pdo = new PDO($chaineCnx, 'root', '', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $pdo;
}
