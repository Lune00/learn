<?php
require_once './autoLoad.php';
// Appel à la classe Chaine -> la fonction chargementAuto réalise l'include de ../classes/Chaine.class.php au moment de l'instanciation.
$bidon = new Chaine('Je suis une chaine de caractères !');
echo 'instance Chaine créée : ' . $bidon->getX();
