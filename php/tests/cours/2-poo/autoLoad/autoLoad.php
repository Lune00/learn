<?php
// fonction qui réalise l'inclusion du fichier correspondant
// au nom de la classe
function chargementAutomatique($nomClasse) {
    include_once '../../2-poo/classes/' . $nomClasse . '.class.php';
}

// Enregistrer la fonction comme fonction d'autochargement.
// PHP l'appellera si on fait appel à une classe qui n'est pas
// incluse.
spl_autoload_register('chargementAutomatique');
