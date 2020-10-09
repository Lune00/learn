<?php
require_once '../classes/UtilisateurAvecCouleurs.class.php';

// Instanciation d'un objet sur la classe fille.
$louis = new UtilisateurAvecCouleurs('louis', 'lumière', 'rouge,vert,bleu');

echo '<code>$louis->__toString()</code> :<br>' . $louis->__toString() . '<br>'; // existe par héritage
echo '<code>$louis->couleurs()</code> :<br>' . $louis->couleurs() . '<br>'; // existe dans la classe
echo '<code>$louis->informations()</code> :<br>' . $louis->informations(); // méthode substituée
