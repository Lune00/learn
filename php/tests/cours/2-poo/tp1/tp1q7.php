<?php
require_once '../classes/Client.class.php';
require_once '../classes/Electeur.class.php';

$c1 = new Client('Malalaniche', 'Mélanie');
$c1->setCoord('34 rue de la clinique vétérinaire');
echo $c1;

$e1 = new Electeur('Bosapin', 'Edmond', '103');
echo $e1;
echo 'appel à la méthode de vote<br>';
$e1->aVote();
echo $e1;
