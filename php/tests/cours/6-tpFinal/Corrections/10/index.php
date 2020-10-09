<?php

function chargementAutomatique($nomClasse) {
    $fichier = str_replace('\\', DIRECTORY_SEPARATOR, $nomClasse.'.class.php');
    require_once($fichier);
}

spl_autoload_register('chargementAutomatique');

$r = new Controleur\Routeur();
$r->router();
