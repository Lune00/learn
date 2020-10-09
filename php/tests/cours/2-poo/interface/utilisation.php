<?php
require_once '../classes/Valeur.class.php';

$objet = new Valeur();

echo 'Appel à la méthode <code>put()</code><br>';
$objet->put(123);

echo 'Appel à la méthode <code>get()</code> : ' . $objet->get();
