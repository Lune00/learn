<?php
define('QUATRE', 4);

function produit($valeur1 = QUATRE, $valeur2 = 2) {
    return $valeur1 * $valeur2;
}

function somme($valeur1, $valeur2) {
    return $valeur1 + $valeur2;
}

function operation($valeur1, $valeur2, $fonction) {
    return $fonction($valeur1, $valeur2);
}

function multiplieReference(&$valeur, $multiplicateur = 1) {
    $valeur *= $multiplicateur;
    echo 'Valeur multipliée dans la fonction : ' . $valeur . '<br>';
}

function variableStatique() {
    $variable = 0;
    static $variable_statique = 0;

    $variable++;
    echo "Variable : $variable <br>";

    $variable_statique++;
    echo "Variable statique : $variable_statique <br>";
}

//echo 'Je suis le fichier inclus';



        echo '<h2>Code de la page :</h2>';
        highlight_file(__FILE__);
        echo '<h2>Code de fonctions.php :</h2>';
        highlight_file('fonctions.php');
        echo '<h2>Code de entete.inc :</h2>';
        highlight_file('entete.inc');
        echo '<h2>Code de piedpage.inc :</h2>';
        highlight_file('piedpage.inc');

//include 'autres_functions.php';
//require_once 'fonctions.php';
//$titre_page = "Test des fonctions";
// Ecrire l'entete HTML
//require 'entete.inc';
// Terminer le flux HTML
//require 'piedpage.inc';
        ?>

<?php

$a = 67600;

function util_var_globale() {
    global $a;
    echo 'valeur de variable globale :' . $a . '<br>';
    //$GLOBALS['variable_fonction'] = 'test';
}

util_var_globale();
//echo "Variable fonction : ", $variable_fonction;
