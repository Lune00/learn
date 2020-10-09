<?php
$regEx = ['options' => ['regexp' => '#^[^"]+$#']];
$nom = filter_input(INPUT_POST, 'nom', FILTER_VALIDATE_REGEXP, $regEx);
$idp = filter_input(INPUT_POST, 'mdp', FILTER_VALIDATE_REGEXP, $regEx);
$dur = filter_input(INPUT_POST, 'dur', FILTER_SANITIZE_NUMBER_INT);
if ($nom && $idp && $dur) {
    setcookie('nom', $nom, time() + 3600 * 24 * $dur);
    setcookie('mdp', $idp, time() + 3600 * 24 * $dur);
    if ($nom === "Noémie" && $idp === "Gt48gY") {
        session_start();
        $_SESSION['nom'] = $nom;
        header('Location:tp1q2connecte.php');
    }
} else {
    $nom = filter_input(INPUT_COOKIE, 'nom', FILTER_VALIDATE_REGEXP, $regEx);
    $idp = filter_input(INPUT_COOKIE, 'mdp', FILTER_VALIDATE_REGEXP, $regEx);
}
