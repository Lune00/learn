<?php
$regEx = ['options' => ['regexp' => '#^[^"]+$#']];
$nom = filter_input(INPUT_POST, 'nom', FILTER_VALIDATE_REGEXP, $regEx);
$idp = filter_input(INPUT_POST, 'idP', FILTER_SANITIZE_NUMBER_INT);
$dur = filter_input(INPUT_POST, 'dur', FILTER_SANITIZE_NUMBER_INT);
if ($nom && $idp && $dur) {
    setcookie('nomF', $nom, time() + 3600 * 24 * $dur);
    setcookie('idp', $idp, time() + 3600 * 24 * $dur);
    require_once '../../4-accesDonnees/tp1/tp1cnx.php';
    $prep = $pdo->prepare('SELECT COUNT(*) FROM proprietaires '
            . 'WHERE id_pers=:id_pers AND nom=:nom;');
    $prep->bindValue(':id_pers', $idp);
    $prep->bindValue(':nom', $nom);
    $prep->execute();
    $donnees = $prep->fetch();
    var_dump($donnees);
    if ($donnees[0] == 1) {
        session_start();
        $_SESSION['nom'] = $nom;
        $_SESSION['id_pers'] = $idp;
        header('Location:tp1q4c.php');
    }
} else {
    $nom = filter_input(INPUT_COOKIE, 'nomF', FILTER_VALIDATE_REGEXP, $regEx);
    $idp = filter_input(INPUT_COOKIE, 'idp', FILTER_VALIDATE_REGEXP, $regEx);
}
